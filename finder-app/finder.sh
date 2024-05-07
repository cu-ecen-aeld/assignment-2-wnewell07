#!/bin/bash

# Check if the correct number of arguments was provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <search string>"
    exit 1
fi

# Assign command line arguments to variables
filesdir=$1
searchstr=$2

# Check if the directory exists
if [ -d "$filesdir" ]; then
    # Count the number of files in the directory and subdirectories
    fileCount=$(find "$filesdir" -type f | wc -l)

    # Use grep to search for the string in files and count the occurrences
    occurrenceCount=$(grep -rnohw "$filesdir" -e "$searchstr" | wc -l)
    echo "The number of files are $fileCount and the number of matching lines are $occurrenceCount"
else
    echo "Error: Directory does not exist."
    exit 1
fi

