#!/bin/bash

if [ -z "$1 $2" ]; then
    echo "Usage: $0 <input> <output>"
    exit 1
fi

if [ -e "$1" ]; then
    echo "File found"
    touch "$2"
    cp "$1" "$2"
    echo "File $2 created"
    exit 1
else
    echo "File not found"
    exit 1
fi