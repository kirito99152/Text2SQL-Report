import os
import re
from collections import defaultdict

def analyze_errors(output_file, report_file):
    print(f"Parsing {output_file}...")
    
    with open(output_file, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        
    errors = []
    current_error = {}
    
    # Parse output.txt
    for line in lines:
        line = line.strip()
        if line.startswith("eval_err_num:"):
            # New error block or parsing error, we can skip or log
            pass
        elif " pred: " in line:
            parts = line.split(" pred: ", 1)
            current_error['hardness'] = parts[0].strip()
            current_error['pred'] = parts[1].strip()
        elif " gold: " in line:
            parts = line.split(" gold: ", 1)
            # Ensure it matches the current hardness
            if parts[0].strip() == current_error.get('hardness'):
                current_error['gold'] = parts[1].strip()
                errors.append(current_error)
                current_error = {}
                
    print(f"Total incorrectly generated queries found: {len(errors)}")
    
    # Group by hardness
    by_hardness = defaultdict(list)
    for err in errors:
        by_hardness[err['hardness']].append(err)
        
    # Simple error pattern categorization
    def categorize_error(pred, gold):
        pred_lower = pred.lower()
        gold_lower = gold.lower()
        
        reasons = []
        if " join " in gold_lower and " join " not in pred_lower:
            reasons.append("Missing JOIN")
        elif " group by " in gold_lower and " group by " not in pred_lower:
            reasons.append("Missing GROUP BY")
        elif " order by " in gold_lower and " order by " not in pred_lower:
            reasons.append("Missing ORDER BY")
        elif " limit " in gold_lower and " limit " not in pred_lower:
            reasons.append("Missing LIMIT")
        elif " where " in gold_lower and " where " not in pred_lower:
            reasons.append("Missing WHERE")
        elif " count(" in gold_lower and " count(" not in pred_lower:
            reasons.append("Missing COUNT aggregation")
        elif "sum(" in gold_lower and "sum(" not in pred_lower:
            reasons.append("Missing SUM aggregation")
        elif "avg(" in gold_lower and "avg(" not in pred_lower:
            reasons.append("Missing AVG aggregation")
        elif "intersect" in gold_lower and "intersect" not in pred_lower:
            reasons.append("Missing INTERSECT")
        elif "except" in gold_lower and "except" not in pred_lower:
            reasons.append("Missing EXCEPT")
        elif "union" in gold_lower and "union" not in pred_lower:
            reasons.append("Missing UNION")
        
        if not reasons:
            # Check if it might be a column selection issue
            pred_select = pred_lower.split("from")[0] if "from" in pred_lower else ""
            gold_select = gold_lower.split("from")[0] if "from" in gold_lower else ""
            if pred_select and gold_select and pred_select.strip() != gold_select.strip():
                reasons.append("Select columns mismatch")
            else:
                reasons.append("Logic/Condition mismatch")
                
        return ", ".join(reasons)

    # Analyze and write to report
    with open(report_file, 'w', encoding='utf-8') as f:
        f.write("# Error Analysis Report\n\n")
        f.write(f"**Total Errors**: {len(errors)}\n\n")
        
        # Breakdown by hardness
        f.write("## Breakdown by Hardness\n")
        for hardness in ["easy", "medium", "hard", "extra"]:
            count = len(by_hardness[hardness])
            f.write(f"- **{hardness.capitalize()}**: {count} errors\n")
        f.write("\n")
        
        # Categorize all
        patterns = defaultdict(int)
        for err in errors:
            cat = categorize_error(err['pred'], err['gold'])
            patterns[cat] += 1
            
        f.write("## Common Error Patterns\n")
        for cat, cnt in sorted(patterns.items(), key=lambda x: x[1], reverse=True):
            f.write(f"- **{cat}**: {cnt} times\n")
        f.write("\n")
        
        # Sample of errors
        f.write("## Detailed Error Samples (Top 10)\n")
        for i, err in enumerate(errors[:10]):
            f.write(f"### Sample {i+1} ({err['hardness'].capitalize()})\n")
            f.write(f"**Gold**: `{err['gold']}`\n\n")
            f.write(f"**Pred**: `{err['pred']}`\n\n")
            cat = categorize_error(err['pred'], err['gold'])
            f.write(f"**Suspected Reason**: {cat}\n\n")
            
    print(f"Analysis saved to {report_file}")

if __name__ == "__main__":
    output_path = os.path.join(os.path.dirname(__file__), "output.txt")
    report_path = os.path.join(os.path.dirname(__file__), "error_analysis_report.md")
    
    if os.path.exists(output_path):
        analyze_errors(output_path, report_path)
    else:
        print(f"File not found: {output_path}")

