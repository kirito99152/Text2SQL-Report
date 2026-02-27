#!/bin/bash

# Configuration
EVAL_SCRIPT="/root/Text2SQL-Report/spiderEval/evaluation.py"
DB_DIR="/root/Text2SQL-Report/ViText2SQL/data/syllable-level/databases"
TABLE_FILE="/root/Text2SQL-Report/ViText2SQL/data/syllable-level/tables.json"
BASE_DIR="/root/Text2SQL-Report/spiderEval"

# Pipelines to evaluate
PIPELINES=("base" "no_planning" "no_self_check" "remove_schema_linking")

for pipeline in "${PIPELINES[@]}"; do
    echo "Evaluating pipeline: $pipeline"
    GOLD_FILE="$BASE_DIR/gold_base.sql"
    PRED_FILE="$BASE_DIR/pred_$pipeline.sql"
    OUTPUT_FILE="$BASE_DIR/output_$pipeline.txt"
    
    python3 "$EVAL_SCRIPT" \
        --gold "$GOLD_FILE" \
        --pred "$PRED_FILE" \
        --db "$DB_DIR" \
        --table "$TABLE_FILE" \
        --etype match > "$OUTPUT_FILE" 2>&1
    
    echo "Results saved to $OUTPUT_FILE"
done
