container="$1"
nomeDB="$2"
nomeTabela="$3"

if [ $# -ne 3 ]; then
    echo "Modo de uso: $0 <container> <nome_da_db> <nome_da_tabela>"
    exit 1
fi

echo "CREATE DATABASE $nomeDB;" > criar_tabela.sql
echo "USE $nomeDB;" >> criar_tabela.sql
echo "CREATE TABLE $nomeTabela (
    Nome varchar(255)
);" >> criar_tabela.sql

read -p "Username: " user
read -s -p "Password: " pw

docker exec -i $container mysql -u$user -p$pw < criar_tabela.sql
