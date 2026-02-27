#!/bin/bash

PIPELINE=$1
if [ -z "$PIPELINE" ]; then
    echo "Usage: ./run_single.sh <base|ablation1|ablation2|ablation3>"
    exit 1
fi

ARGS="--dataset dev --workers 3 --start 0 --end 3"

echo "Starting Pipeline: $PIPELINE (Dev Dataset, 3 queries, 3 workers)"
python3 -u benchmark_tensor.py --pipeline $PIPELINE $ARGS > ${PIPELINE}.log 2>&1

echo "Done. Check ${PIPELINE}.log for results."
