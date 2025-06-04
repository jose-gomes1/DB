#!/bin/bash

# @author José Gomes
# @brief Ficheiro de Backups para SQL
# @date 03-06-2025
# @file trabalho_bash_tentativa1.sh

# Verifica se os parâmetros necessários foram passados
if [ $# -ne 5 ]; then
    echo "Uso: $0 <nome_do_utilizador> <palavra_passe> <nome_do_container> <nome_da_base_de_dados> <ficheiro_de_destino>"
    exit 1
fi

# Atribui os parâmetros a variáveis
USER="$1"
PASS="$2"
CONTAINER_NAME="$3"
DB_NAME="$4"
DEST_FILE="$5"

# Adiciona timestamp ao nome do backup
TIMESTAMP=$(date '_+%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="${DB_NAME%.*}${TIMESTAMP}.sql"

# Executa o dump dentro do container e redireciona a saída para um ficheiro no host
echo "A fazer backup da base de dados '$DB_NAME' no container '$CONTAINER_NAME' para '$BACKUP_FILE'..."
docker exec "$CONTAINER_NAME" mysqldump "$DB_NAME" -u$USER -p$PASS > "$BACKUP_FILE"

echo "Backup criado: $BACKUP_FILE"
