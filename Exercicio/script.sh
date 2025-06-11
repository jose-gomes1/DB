#!/bin/bash

if [ $# -ne 4 ]; then
    echo "Uso: $0 <user_mysql> <password_mysql> <file_name> <container>"
    exit 1
fi

usrMYSQL=$1
pwMYSQL=$2
fileNAME=$3
CONTAINER=$4

docker exec -i $CONTAINER mysql -u$usrMYSQL -p$pwMYSQL < $fileNAME