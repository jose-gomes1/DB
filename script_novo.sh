#!/bin/bash

usrRoot=$1
pwRoot=$2
usrNew=$3
mysqlContainer=$4

if [ $# -ne 4 ]; then
    echo "Forma de usar: $0 <nome_do_user_root> <password_da_root> <nome_do_novo_utilizador> <container_sql>"
    exit 1
fi

read -s -p "Qual será a palavra-passe? " pwNew

# Create new user accessible from any host (%)
docker exec -i $mysqlContainer mysql -u"$usrRoot" -p"$pwRoot" -e "CREATE USER IF NOT EXISTS '$usrNew'@'localhost' IDENTIFIED BY '$pwNew';"
docker exec -i $mysqlContainer mysql -u"$usrRoot" -p"$pwRoot" -e "GRANT ALL PRIVILEGES ON *.* TO '$usrNew'@'localhost';"
docker exec -i $mysqlContainer mysql -u"$usrRoot" -p"$pwRoot" -e "FLUSH PRIVILEGES;"

# Optional: dump all databases to host file
docker exec -i $mysqlContainer mysqldump -u"$usrRoot" -p"$pwRoot" --all-databases > ~/Documentos/script.sql

# Optional: restore dump back into the container (if needed)
docker exec -i $mysqlContainer mysql -u"$usrRoot" -p"$pwRoot" < ~/Documentos/script.sql
