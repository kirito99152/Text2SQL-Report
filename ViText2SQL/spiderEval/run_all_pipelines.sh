#!/bin/bash

# Configuration
WORKERS=10
DATASET="test"

echo "Running benchmarks with WORKERS=$WORKERS and DATASET=$DATASET"

# 1. Base Pipeline (Full Pipeline)
# Features: Logical Planning + SQL Generation + Self-Check + Execution Correction
echo "Starting Base Pipeline (Full Pipeline)..."
python3 -u benchmark_tensor.py --pipeline base --dataset "$DATASET" --workers $WORKERS > base.log 2>&1 &
PID1=$!

# 2. Ablation 1 (No Planning)
# Features: SQL Generation + Self-Check + Execution Correction
# Purpose: Test performance without the pre-generation reasoning/planning step.
echo "Starting Ablation 1 (No Planning)..."
python3 -u benchmark_tensor.py --pipeline ablation1 --dataset "$DATASET" --workers $WORKERS > ablation1.log 2>&1 &
PID2=$!

# 3. Ablation 2 (No Post-Generation Refinement)
# Features: Logical Planning + SQL Generation (SKIPS Self-Check & Execution Correction)
# Purpose: Test performance of raw generation without iterative refinement steps.
echo "Starting Ablation 2 (No Self-Check / No Execution-Correction)..."
python3 -u benchmark_tensor.py --pipeline ablation2 --dataset "$DATASET" --workers $WORKERS > ablation2.log 2>&1 &
PID3=$!

echo "All 3 pipelines are running concurrently. Check .log files for progress."
echo "Waiting for them to finish..."

wait $PID1
echo "Base Pipeline finished."

wait $PID2
echo "Ablation 1 finished."

wait $PID3
echo "Ablation 2 finished."

echo "All benchmark testing complete."
