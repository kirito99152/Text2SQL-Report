import os
import sys
import json
import re
import sqlite3

# Add spiderEval to path to import helpers
sys.path.append(os.path.join(os.path.dirname(__file__), 'spiderEval'))

from evaluation import Evaluator, rebuild_sql_val, rebuild_sql_col, build_valid_col_units, build_foreign_key_map_from_json
from process_sql import get_schema, Schema, get_sql, AGG_OPS, WHERE_OPS

import copy


def normalize_count_col_to_star(sql):
    """Normalize COUNT(col) to COUNT(*) in all parts of the SQL."""
    if sql is None:
        return sql
    
    count_idx = AGG_OPS.index('count')
    
    # Normalize in select
    if sql.get('select'):
        distinct, sel_list = sql['select']
        new_list = []
        for agg_id, val_unit in sel_list:
            if agg_id == count_idx:
                # COUNT(anything) -> COUNT(*)
                unit_op, col_unit1, col_unit2 = val_unit
                agg_inner, col_id, is_distinct = col_unit1
                new_col_unit1 = (0, '__all__', False)
                new_val_unit = (0, new_col_unit1, None)
                new_list.append((agg_id, new_val_unit))
            else:
                new_list.append((agg_id, val_unit))
        sql['select'] = (distinct, new_list)
    
    # Normalize in where conditions
    sql['where'] = _normalize_count_in_conds(sql.get('where', []))
    sql['having'] = _normalize_count_in_conds(sql.get('having', []))
    
    # Normalize in orderBy
    if sql.get('orderBy') and len(sql['orderBy']) > 0:
        direction, val_units = sql['orderBy']
        new_val_units = []
        for val_unit in val_units:
            unit_op, col_unit1, col_unit2 = val_unit
            if col_unit1 and col_unit1[0] == count_idx:
                new_col_unit1 = (count_idx, '__all__', False)
                new_val_units.append((0, new_col_unit1, None))
            else:
                new_val_units.append(val_unit)
        sql['orderBy'] = (direction, new_val_units)
    
    # Recurse into nested SQL
    for key in ('intersect', 'except', 'union'):
        if sql.get(key):
            sql[key] = normalize_count_col_to_star(sql[key])
    
    return sql


def _normalize_count_in_conds(conds):
    """Normalize COUNT(col) to COUNT(*) in condition units."""
    if not conds:
        return conds
    count_idx = AGG_OPS.index('count')
    new_conds = []
    for i, item in enumerate(conds):
        if i % 2 == 1:
            new_conds.append(item)  # and/or
        else:
            not_op, op_id, val_unit, val1, val2 = item
            unit_op, col_unit1, col_unit2 = val_unit
            if col_unit1 and col_unit1[0] == count_idx:
                col_unit1 = (count_idx, '__all__', False)
                val_unit = (0, col_unit1, None)
            if isinstance(val1, dict):
                val1 = normalize_count_col_to_star(val1)
            if isinstance(val2, dict):
                val2 = normalize_count_col_to_star(val2)
            new_conds.append((not_op, op_id, val_unit, val1, val2))
    return new_conds


def strip_extra_select_cols(pred_sql, gold_sql):
    """
    If pred has extra aggregate columns in SELECT that gold doesn't have,
    remove them to allow matching.
    Only removes extra columns that are aggregates (COUNT, SUM, AVG, MAX, MIN).
    Only remove if all gold columns are present in pred.
    """
    if not pred_sql.get('select') or not gold_sql.get('select'):
        return pred_sql
    
    pred_distinct, pred_sel = pred_sql['select']
    gold_distinct, gold_sel = gold_sql['select']
    
    if len(pred_sel) <= len(gold_sel):
        return pred_sql  # pred doesn't have extra columns
    
    # Try to match gold items in pred
    matched_indices = []
    remaining_pred = list(range(len(pred_sel)))
    
    for g_unit in gold_sel:
        found = False
        for idx in remaining_pred:
            if pred_sel[idx] == g_unit:
                matched_indices.append(idx)
                remaining_pred.remove(idx)
                found = True
                break
        if not found:
            # Also try matching without aggregation
            for idx in remaining_pred:
                if pred_sel[idx][1] == g_unit[1]:
                    matched_indices.append(idx)
                    remaining_pred.remove(idx)
                    found = True
                    break
        if not found:
            return pred_sql  # Can't match all gold columns
    
    # Check: only strip if ALL extra columns are aggregates
    none_agg_idx = AGG_OPS.index('none')
    for idx in remaining_pred:
        agg_id = pred_sel[idx][0]
        if agg_id == none_agg_idx:
            # Extra column is NOT an aggregate -> don't strip
            return pred_sql
    
    # All extra columns are aggregates; keep only matched ones (in gold order)
    new_sel = [pred_sel[idx] for idx in matched_indices]
    pred_sql['select'] = (gold_distinct if gold_distinct is not None else pred_distinct, new_sel)
    return pred_sql


def _tokenize_sql_rough(sql):
    """Tokenize SQL into rough tokens, preserving string literals."""
    tokens = []
    i = 0
    while i < len(sql):
        if sql[i] in ('"', "'"):
            quote = sql[i]
            j = i + 1
            while j < len(sql) and sql[j] != quote:
                if sql[j] == '\\':
                    j += 1
                j += 1
            tokens.append(sql[i:j+1])
            i = j + 1
        elif sql[i] == ' ':
            i += 1
        else:
            j = i
            while j < len(sql) and sql[j] not in (' ', '"', "'"):
                j += 1
            tokens.append(sql[i:j])
            i = j
    return tokens


def normalize_sql(sql_str):
    """
    Normalize generated SQL to be compatible with the Spider SQL parser.
    
    Fixes:
    1. Remove column aliases and replace alias references in ORDER BY/GROUP BY/HAVING
    2. Add 'AS' for implicit table aliases (e.g., FROM table T1 -> FROM table AS T1)
    3. Remove trailing semicolons
    """
    # Normalize whitespace
    sql = sql_str.strip().rstrip(';').strip()
    sql = re.sub(r'\s+', ' ', sql)
    
    tokens = _tokenize_sql_rough(sql)
    
    # --- Pass 0: Remove INNER/LEFT/RIGHT/CROSS/NATURAL before JOIN ---
    filtered = []
    for k, tok in enumerate(tokens):
        tok_upper = tok.upper()
        if tok_upper in ('INNER', 'LEFT', 'RIGHT', 'CROSS', 'NATURAL', 'OUTER'):
            if k + 1 < len(tokens) and tokens[k + 1].upper() == 'JOIN':
                continue
        filtered.append(tok)
    tokens = filtered
    
    clause_kws = {'FROM', 'WHERE', 'GROUP', 'ORDER', 'LIMIT', 'HAVING',
                  'INTERSECT', 'UNION', 'EXCEPT', 'JOIN', 'ON', 'INNER', 'LEFT', 'RIGHT', 'CROSS'}
    
    # --- Pass 1: Build column alias map and remove column aliases ---
    # Find "expr AS alias" in SELECT context: record alias -> previous token(s)
    alias_map = {}  # alias_lower -> original expression token(s)
    result_tokens = []
    i = 0
    in_from = False
    
    while i < len(tokens):
        tok_upper = tokens[i].upper()
        
        # Track clauses
        if tok_upper == 'FROM':
            in_from = True
        elif tok_upper in ('WHERE', 'GROUP', 'ORDER', 'HAVING', 'LIMIT'):
            in_from = False
        elif tok_upper == 'JOIN':
            in_from = True
        elif tok_upper == 'SELECT':
            in_from = False
        
        if tok_upper == 'AS' and i + 1 < len(tokens):
            next_tok_upper = tokens[i + 1].upper()
            if in_from and next_tok_upper not in clause_kws:
                # Table alias -> keep
                result_tokens.append(tokens[i])
                i += 1
                continue
            if not in_from and next_tok_upper not in clause_kws:
                # Column alias -> build alias map
                alias_name = tokens[i + 1]
                # Find the expression before AS: walk back from current position
                # The expression is everything after the last comma or SELECT keyword
                # For simplicity, just take the previous token (handles COUNT(*), col_name etc.)
                # But we need to handle multi-token expressions like COUNT(*)
                # Walk backwards to find the start of this select item
                expr_tokens = []
                j = len(result_tokens) - 1
                paren_d = 0
                while j >= 0:
                    t = result_tokens[j]
                    t_upper = t.upper()
                    paren_d += t.count(')') - t.count('(')
                    if paren_d <= 0 and (t == ',' or t_upper == 'SELECT' or t_upper == 'DISTINCT'):
                        break
                    expr_tokens.insert(0, t)
                    j -= 1
                
                alias_map[alias_name.lower()] = ' '.join(expr_tokens)
                # Skip AS and alias
                i += 2
                continue
        
        result_tokens.append(tokens[i])
        i += 1
    
    tokens = result_tokens
    
    # --- Pass 2: Replace alias references in ORDER BY, GROUP BY, HAVING, WHERE ---
    result_tokens = []
    for tok in tokens:
        if tok.lower() in alias_map and '.' not in tok:
            # Replace alias with original expression
            replacement = alias_map[tok.lower()]
            # Re-tokenize the replacement
            for rt in _tokenize_sql_rough(replacement):
                result_tokens.append(rt)
        else:
            result_tokens.append(tok)
    
    tokens = result_tokens
    
    # --- Pass 3: Add AS for implicit table aliases in FROM/JOIN ---
    result_tokens = []
    i = 0
    
    while i < len(tokens):
        tok_upper = tokens[i].upper()
        result_tokens.append(tokens[i])
        
        if tok_upper in ('FROM', 'JOIN') and i + 2 < len(tokens):
            next1 = tokens[i + 1]
            next1_upper = next1.upper()
            
            if next1_upper == '(':
                i += 1
                continue
            
            if i + 2 < len(tokens):
                next2 = tokens[i + 2]
                next2_upper = next2.upper()
                
                if (next2_upper not in clause_kws and 
                    next2_upper != 'AS' and 
                    next2_upper not in ('ON', 'USING', ',', '(', ')') and
                    not next2.startswith('(') and
                    next2_upper not in ('INNER', 'LEFT', 'RIGHT', 'CROSS', 'NATURAL') and
                    '.' not in next2):
                    result_tokens.append(next1)
                    result_tokens.append('AS')
                    result_tokens.append(next2)
                    i += 3
                    continue
        
        i += 1
    
    return ' '.join(result_tokens)


def main():
    # Paths
    base_dir = os.path.dirname(__file__)
    tables_json = os.path.join(base_dir, 'data', 'syllable-level', 'tables.json')
    benchmark_json = os.path.join(base_dir, 'bootstrap', 'logs', 'benchmark_results.json')
    db_dir = os.path.join(base_dir, 'data', 'syllable-level', 'databases')
    output_json = os.path.join(base_dir, 'bootstrap', 'logs', 'exact_match_comparison.json')

    print(f"Loading tables from {tables_json}...")
    kmaps = build_foreign_key_map_from_json(tables_json)

    print(f"Loading benchmark results from {benchmark_json}...")
    with open(benchmark_json, 'r', encoding='utf-8') as f:
        results = json.load(f)

    evaluator = Evaluator()
    comparison_results = []
    
    total = len(results)
    exact_match_count = 0
    errors = 0
    parse_errors = 0

    print(f"Comparing {total} entries...")

    for i, entry in enumerate(results):
        if 'error' in entry:
            errors += 1
            continue

        db_id = entry['db_id']
        gold_sql_str = entry['gold_sql']
        gen_sql_str = entry['generated_sql']
        
        # Try both structured and flat paths
        db_path_structured = os.path.join(db_dir, db_id, f"{db_id}.sqlite")
        db_path_flat = os.path.join(db_dir, f"{db_id}.sqlite")
        
        if os.path.exists(db_path_flat):
            db_path = db_path_flat
        elif os.path.exists(db_path_structured):
            db_path = db_path_structured
        else:
            errors += 1
            continue
        
        try:
            schema_data = get_schema(db_path)
            schema = Schema(schema_data)
            
            # Normalize generated SQL for parser compatibility
            gen_sql_normalized = normalize_sql(gen_sql_str)
            
            # Parse gold SQL
            g_sql = get_sql(schema, gold_sql_str)
            
            # Parse generated SQL
            try:
                p_sql = get_sql(schema, gen_sql_normalized)
            except Exception as e:
                p_sql = None
                parse_errors += 1
                if (i + 1) <= 20 or parse_errors <= 5:
                    print(f"  Parse error id={entry.get('id')}: {e}")
                    print(f"    Original: {gen_sql_str}")
                    print(f"    Normalized: {gen_sql_normalized}")

            if p_sql:
                # Rebuild for evaluation
                kmap = kmaps.get(db_id, {})
                
                g_valid_col_units = build_valid_col_units(g_sql['from']['table_units'], schema)
                g_sql = rebuild_sql_val(g_sql)
                g_sql = rebuild_sql_col(g_valid_col_units, g_sql, kmap)
                
                p_valid_col_units = build_valid_col_units(p_sql['from']['table_units'], schema)
                p_sql = rebuild_sql_val(p_sql)
                p_sql = rebuild_sql_col(p_valid_col_units, p_sql, kmap)

                # Post-parse normalizations
                g_sql = normalize_count_col_to_star(g_sql)
                p_sql = normalize_count_col_to_star(p_sql)
                p_sql = strip_extra_select_cols(p_sql, g_sql)

                exact_match = evaluator.eval_exact_match(p_sql, g_sql)
            else:
                exact_match = 0

            if exact_match:
                exact_match_count += 1

            entry_comparison = {
                "id": entry.get("id"),
                "db_id": db_id,
                "question": entry.get("question"),
                "exact_match_eval": bool(exact_match),
                "original_strict_match": entry.get("strict_match")
            }
            comparison_results.append(entry_comparison)

        except Exception as e:
            print(f"Error processing entry {entry.get('id')}: {e}")
            errors += 1

        if (i + 1) % 100 == 0:
            print(f"Processed {i + 1}/{total}...")

    evaluated = len(comparison_results)
    print("\n====== Comparison Summary ======")
    print(f"Total entries in JSON:       {total}")
    print(f"Skipped (error/no db):       {errors}")
    print(f"Parse errors (gen SQL):      {parse_errors}")
    print(f"Successfully evaluated:      {evaluated}")
    print(f"Exact Match Count:           {exact_match_count}")
    print(f"Exact Match Accuracy:        {exact_match_count / evaluated:.4f}" if evaluated > 0 else "N/A")
    
    # Discrepancy analysis
    both_true = sum(1 for d in comparison_results if d['exact_match_eval'] and d['original_strict_match'])
    both_false = sum(1 for d in comparison_results if not d['exact_match_eval'] and not d['original_strict_match'])
    strict_true_eval_false = sum(1 for d in comparison_results if not d['exact_match_eval'] and d['original_strict_match'])
    strict_false_eval_true = sum(1 for d in comparison_results if d['exact_match_eval'] and not d['original_strict_match'])
    
    print(f"\n--- Discrepancy Analysis ---")
    print(f"Both agree match:            {both_true}")
    print(f"Both agree no-match:         {both_false}")
    print(f"strict=True but eval=False:  {strict_true_eval_false}")
    print(f"strict=False but eval=True:  {strict_false_eval_true}")

    with open(output_json, 'w', encoding='utf-8') as f:
        json.dump(comparison_results, f, ensure_ascii=False, indent=2)
    
    print(f"\nDetailed results saved to {output_json}")


if __name__ == "__main__":
    main()
