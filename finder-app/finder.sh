#!/bin/bash

NUMBER_OF_ARGUMENTS=$#

if [ $NUMBER_OF_ARGUMENTS -ne 2 ]; then
    exit 1
else
    # Get arguments
    FILESDIR=$1
    SEARCHSTR=$2

    # Check if directory exists
    if [ -d $FILESDIR ]; then
        # Get files in directory and subdirectories including the ones in symlinks
        FILES=$(find -L $1 -type f)
        # Get number of files n directory and subdirectories including the ones in symlinks
        NUMBER_OF_FILES=$(find -L $FILESDIR -type f | wc -l)
        # Get matching lines in all files
        MATCHING_LINES=$(grep -o $SEARCHSTR ${FILES})
        # Count nnumber of matching lines
        NUMBER_OF_MATCHING_LINES=$(grep -o $SEARCHSTR ${FILES} | wc -l)
        echo "The number of files are ${NUMBER_OF_FILES} and the number of matching lines are ${NUMBER_OF_MATCHING_LINES}"
    else
        echo "${FILESDIR} is not a directory."
        exit 1
    fi
fi