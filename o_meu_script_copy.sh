#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <texto>"
    exit 1
fi

texto=$1

echo $texto > "$USER"_"$GDMSESSION".txt
echo "'$USER'_'$GDMSESSION'.txt criado"