#!/bin/bash
if [ $# -eq 0 ]; then
echo "Error: No filename provided"
echo "Usage: $0 <filename>"
exit 1
fi
FILENAME=$1
MAX_SIZE=1048576
if [ ! -f "$FILENAME" ]; then
echo "Error: File '$FILENAME' does not exist"
exit 1
fi
FILE_SIZE=$(stat -c%s "$FILENAME" 2>/dev/null || stat -f%z "$FILENAME" 2>/dev/null)
if [ "$FILE_SIZE" -gt "$MAX_SIZE" ]; then
echo "Warning: File is too large"
echo "File size: $FILE_SIZE bytes ($(echo "scale=2; $FILE_SIZE/1048576" | bc) MB)"
else
echo "File size is within limits"
echo "File size: $FILE_SIZE bytes ($(echo "scale=2; $FILE_SIZE/1048576" | bc) MB)"
fi