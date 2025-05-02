#!/bin/bash

date=${date '+_%m_%d_%H:%M'}

if [ -z "$1" ]; then
    echo "Usage: $0 <file>"
    exit 1
else
    cp "$1" "${base}$date.bck"
fi
base = "${1%.*}"
echo "Created $1 as $2"

# TPC: Fazer o clone criar como <filename>_Data_Hora.bck 
