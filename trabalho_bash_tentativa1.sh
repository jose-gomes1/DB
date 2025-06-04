#!/bin/bash

# @author José Gomes
# @brief Ficheiro de Backups para SQL
# @date 03-06-2025
# @file trabalho_bash_tentativa1.sh

# Verifica se os parâmetros necessários foram passados
if [ $# -ne 3 ]; then
    echo "Uso: $0 <nome_do_container> <nome_da_base_de_dados> <ficheiro_de_destino>"
    exit 1
fi

# Atribui os parâmetros a variáveis
CONTAINER_NAME="$1"
DB_NAME="$2"
DEST_FILE="$3"

# Adiciona timestamp ao nome do backup
TIMESTAMP=$(date '_+%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="${DB_NAME%.*}${TIMESTAMP}.sql"

# Executa o dump dentro do container e redireciona a saída para um ficheiro no host
echo "A fazer backup da base de dados '$DB_NAME' no container '$CONTAINER_NAME' para '$BACKUP_FILE'..."
docker exec "$CONTAINER_NAME" mysqldump "$DB_NAME" -uroot -proot > "$BACKUP_FILE"

echo "Backup criado: $BACKUP_FILE"
