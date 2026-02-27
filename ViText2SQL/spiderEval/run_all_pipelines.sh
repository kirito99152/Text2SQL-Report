#!/bin/bash

ARGS="--dataset test_random_300 --workers 3"

echo "Starting Base Pipeline..."
python3 -u benchmark_tensor.py --pipeline base $ARGS > base.log 2>&1 &
PID1=$!

echo "Starting Ablation 1 (No Schema Linking)..."
python3 -u benchmark_tensor.py --pipeline ablation1 $ARGS > ablation1.log 2>&1 &
PID2=$!

echo "Starting Ablation 2 (No Logical Planning)..."
python3 -u benchmark_tensor.py --pipeline ablation2 $ARGS > ablation2.log 2>&1 &
PID3=$!

echo "Starting Ablation 3 (No Self-check)..."
python3 -u benchmark_tensor.py --pipeline ablation3 $ARGS > ablation3.log 2>&1 &
PID4=$!

echo "All 4 pipelines are running concurrently. Check .log files for progress."
echo "Waiting for them to finish..."

wait $PID1
echo "Base Pipeline finished."

wait $PID2
echo "Ablation 1 finished."

wait $PID3
echo "Ablation 2 finished."

wait $PID4
echo "Ablation 3 finished."

echo "All benchmark testing complete."
