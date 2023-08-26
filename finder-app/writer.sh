#!/bin/bash

NUMBER_OF_ARGUMENTS=$#

if [ $NUMBER_OF_ARGUMENTS != 2 ]; then
    exit 1
else
    # Get arguments
    WRITEFILE=$1
    WRITESTR=$2
    # Get directory name of file
    DIR="$(dirname "${WRITEFILE}")"
    # Create directory
    mkdir -p ${DIR}
    # Write string to file
    echo $WRITESTR > $WRITEFILE
    # Check if file was created successfully
    if [ $? -ne 0 ]; then
        echo "The file could not be created"
        exit 1
    fi
fi