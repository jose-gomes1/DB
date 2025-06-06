#!/bin/bash

usrRoot=$1
pwRoot=$2
usrNew=$3
pwNew=$4

if [ $# -ne 4 ]; then
    echo "Forma de usar: $0 <nome_do_user_root> <password_da_root> <nome_do_novo_utilizador> <palavra_passe>"
    exit 1
fi

# Create new user accessible from any host (%)
docker exec -i mysql_container mysql -u"$usrRoot" -p"$pwRoot" -e "CREATE USER '$usrNew'@'localhost' IDENTIFIED BY '$pwNew';"
docker exec -i mysql_container mysql -u"$usrRoot" -p"$pwRoot" -e "GRANT ALL PRIVILEGES ON *.* TO '$usrNew'@'localhost';"
docker exec -i mysql_container mysql -u"$usrRoot" -p"$pwRoot" -e "FLUSH PRIVILEGES;"

# Optional: dump all databases to host file
docker exec -i mysql_container mysqldump -u"$usrRoot" -p"$pwRoot" --all-databases > ~/Documentos/script.sql

# Optional: restore dump back into the container (if needed)
docker exec -i mysql_container mysql -u"$usrRoot" -p"$pwRoot" < ~/Documentos/script.sql
