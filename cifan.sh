#!/bin/bash

PREFIX="/opt/cidf"


# Set command
if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] || [[ -z "$1" ]]; then
    MODULE="$PREFIX/help.sh"
else
    MODULE="$PREFIX/$1.sh"
fi

# Check if module exists
if [ ! -f "$MODULE" ]; then
    echo "Module not found"
    exit 1
fi

source "$MODULE"
main $@