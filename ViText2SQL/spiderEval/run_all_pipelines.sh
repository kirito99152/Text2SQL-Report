#!/bin/bash

# Configuration
WORKERS=8
DATASET="test"

echo "============================================"
echo "  Running Pipeline Scripts"
echo "  Workers: $WORKERS"
echo "============================================"

# 1. Base Pipeline: Rerun evaluation errors (Token Efficient)
echo "Starting Base Pipeline eval error rerun..."
python3 -u rerun_eval_errors.py --pipeline base --workers $WORKERS > rerun_base.log 2>&1 &
PID1=$!

# 2. Ablation 1: Rerun evaluation errors (Token Efficient)
echo "Starting Ablation 1 eval error rerun..."
python3 -u rerun_eval_errors.py --pipeline ablation1 --workers $WORKERS > rerun_abl1.log 2>&1 &
PID2=$!

# 3. Ablation 3: Rerun evaluation errors (Token Efficient)
echo "Starting Ablation 3 eval error rerun..."
python3 -u rerun_eval_errors.py --pipeline ablation3 --workers $WORKERS > rerun_abl3.log 2>&1 &
PID3=$!

echo ""
echo "All 3 pipeline scripts are running concurrently in 'rerun errors' mode."
echo "Check log files for progress:"
echo "  - rerun_base.log"
echo "  - rerun_abl1.log"
echo "  - rerun_abl3.log"
echo ""
echo "Waiting for them to finish..."

wait $PID1
echo "Base Pipeline (Bridge) finished."

wait $PID2
echo "Ablation 1 re-run finished."

wait $PID3
echo "Ablation 3 re-run finished."

echo ""
echo "============================================"
echo "  All pipeline scripts complete!"
echo "============================================"
