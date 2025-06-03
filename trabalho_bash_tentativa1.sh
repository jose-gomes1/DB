#!/bin/bash

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
TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="${DB_NAME%.*}${TIMESTAMP}.sql"

# Executa o dump dentro do container e redireciona a saída para um ficheiro no host
echo "A fazer backup da base de dados '$DB_NAME' no container '$CONTAINER_NAME' para '$BACKUP_FILE'..."
docker exec "$CONTAINER_NAME" mysqldump "$DB_NAME" -uroot -proot > "$BACKUP_FILE"

# Verifica se o comando anterior foi bem-sucedido
if [ $? -eq 0 ]; then
    echo "Backup criado com sucesso: $BACKUP_FILE"
else
    echo "Erro ao criar o backup."
    exit 2
fi
