#!/usr/bin/env bash
set -e

# Compile
if ! make; then
  echo "❌ Compilation failed, skipping execution test."
  exit 1
fi

# Parameters for output check
HP=5

# DV="dataValidation"
# Period = 1/180s => N = 6
NDV=$((HP*6)) 

# KDT="keyboardDataTracking"
# Period = 1/30s => N = 1
NKDT=$((HP*1)) 

# COT="controlOuterLoops"
# Period = 1/30s => N = 1
NCOT=$((HP*1)) 

# CIT="controlInnerLoops"
# Period = 1/90s => N = 3
NCIT=$((HP*3)) 

# CNT="computeNComd"
# Period = 1/180s => N = 6
NCNT=$((HP*6))	 

# Run program and capture stdout
OUTPUT=$(./run.sh)


# Run program
OUTPUT=$(./run.sh)

# Count occurrences
count_dv=$(echo "$OUTPUT" | grep -o "\*\*\* dataValidation" | wc -l)
count_kdt=$(echo "$OUTPUT" | grep -o "\*\*\* keyboardDataTracking" | wc -l)
count_cot=$(echo "$OUTPUT" | grep -o "\*\*\* controlOuterLoops" | wc -l)
count_cit=$(echo "$OUTPUT" | grep -o "\*\*\* controlInnerLoops" | wc -l)
count_cnt=$(echo "$OUTPUT" | grep -o "\*\*\* computeNComd" | wc -l)

# Check if counts match expected
if [[ "$count_dv" -eq "$NDV" ]] && [[ "$count_kdt" -eq "$NKDT" ]] && \
   [[ "$count_cot" -eq "$NCOT" ]] && [[ "$count_cit" -eq "$NCIT" ]] && \
   [[ "$count_cnt" -eq "$NCNT" ]]; then
  echo "✅ Counts match!"
  exit 0
else
  echo "❌ Counts not correct!"
  echo "dataValidation: $count_dv/$NDV"
  echo "keyboardDataTracking: $count_kdt/$NKDT"
  echo "controlOuterLoops: $count_cot/$NCOT"
  echo "controlInnerLoops: $count_cit/$NCIT"
  echo "computeNComd: $count_cnt/$NCNT"
  exit 1
fi
