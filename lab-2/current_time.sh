#!/bin/bash

WORK_END_HOUR=18
WORK_END_MINUTES=$((WORK_END_HOUR * 60))  # Convert to total minutes

CURRENT_HOUR=$(date +"%H")
CURRENT_MINUTE=$(date +"%M")

CURRENT_TOTAL_MINUTES=$((CURRENT_HOUR * 60 + CURRENT_MINUTE))

if [ "$CURRENT_TOTAL_MINUTES" -lt "$WORK_END_MINUTES" ]; then
    REMAINING_MINUTES=$((WORK_END_MINUTES - CURRENT_TOTAL_MINUTES))
    HOURS=$((REMAINING_MINUTES / 60))
    MINUTES=$((REMAINING_MINUTES % 60))
    echo "Current time: $(date +"%H:%M"). Work day ends after $HOURS hours and $MINUTES minutes."
else
    echo "Current time: $(date +"%H:%M"). The workday has already ended."
fi
