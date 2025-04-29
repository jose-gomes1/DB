#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

if [ -z "$2" ]; then
    echo "Provide output"
    exit 1
else
    cp "$1" "$2"
fi
echo "Created $1 as $2"

# TPC: Fazer o clone criar como <filename>_Data_Hora.bck 