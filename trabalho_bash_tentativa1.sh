#!/bin/bash

# @author José Gomes
# @brief Ficheiro de Backups para SQL
# @date 04-06-2025
# @file trabalho_bash_tentativa1.sh

# Verifica se os parâmetros necessários foram passados
if [ $# -ne 3 ]; then
    echo "Uso: $0 <nome_do_container> <nome_da_base_de_dados> <ficheiro_de_destino>"
    exit 1
fi

if [ "$1" == "--help" ]; then
    echo "Uso: $0 <nome_do_container> <nome_da_base_de_dados> <ficheiro_de_destino>"
    exit 0
fi

# Atribui os parâmetros a variáveis
CONTAINER_NAME="$1"
DB_NAME="$2"
DEST_FILE="$3"

if [ ! -d $DEST_FILE ]; then
    echo "$DEST_FILE não existe"
    mkdir "$DEST_FILE"
fi

# Adiciona timestamp ao nome do backup
TIMESTAMP=$(date "+_%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="${DB_NAME}${TIMESTAMP}.sql"

read -p "Username do MYSQL: " USER
read -s -p "Palavra Passe do MYSQL: " PASS

# Executa o dump dentro do container e redireciona a saída para um ficheiro no host
echo "A fazer backup da base de dados '$DB_NAME' no container '$CONTAINER_NAME' para '$DEST_FILE'..."
docker exec -i "$CONTAINER_NAME" mysqldump "$DB_NAME" -u$USER -p$PASS > "$DEST_FILE"/"$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Backup criado: $BACKUP_FILE"
else
    echo "Erro a criar o backup"
    exit 2
fi