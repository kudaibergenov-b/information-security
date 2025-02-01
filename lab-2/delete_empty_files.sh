#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

DIRECTORY="$1"

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory '$DIRECTORY' not found!"
    exit 1
fi

EMPTY_FILES=$(find "$DIRECTORY" -type f -empty)

if [ -z "$EMPTY_FILES" ]; then
    echo "No empty files found in '$DIRECTORY'."
    exit 0
fi

echo "Deleting the following empty files:"
echo "$EMPTY_FILES"
find "$DIRECTORY" -type f -empty -delete

echo "Empty files deleted successfully."
