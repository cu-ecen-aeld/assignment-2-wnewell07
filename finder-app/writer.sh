#!/bin/bash

# Check if the correct number of arguments was provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file_path> <text_to_write>"
    exit 1
fi

# Assign command line arguments to variables
writefile=$1
writestr=$2

# Extract directory path from file path
dirPath=$(dirname "$writefile")

# Check if the directory exists, if not, create it
if [ ! -d "$dirPath" ]; then
    echo "Directory does not exist, creating it now..."
    mkdir -p "$dirPath"
fi

# Write the text to the file, creating or overwriting the file as necessary
echo "$writestr" > "$writefile"

if ! test -f $writefile; then
  echo "Failed to create $writefile"
  
  exit 1
fi

