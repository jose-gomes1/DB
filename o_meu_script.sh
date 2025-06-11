#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <texto>"
    exit 1
fi

texto=$1

echo $texto > texto.txt
echo "texto.txt foi criado com sucesso"