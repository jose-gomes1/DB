#!/bin/bash

# Obter a data e hora no formato desejado
data=$(date '+_%m_%d_%H-%M')

# Verificar se o argumento foi fornecido
if [ -z "$1" ]; then
    echo "Uso: $0 <ficheiro>"
    exit 1
fi

# Obter o nome do ficheiro sem o caminho e sem a extensão
filename=$(basename "$1")
base="${filename%.*}"

# Criar o backup com o nome desejado
cp "$1" "${base}${data}.bck"

echo "Backup criado: ${base}${data}.bck"
