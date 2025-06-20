#!/bin/bash

if [ $# -ne 2 ] && [ "$1" != "criar" ]; then
    echo "Uso: $0 <ação> <nome_container>"
    exit 1
fi

if [ $1 == "criar" ] && [ $# -ne 3 ]; then
    echo "Imagem necessária para criar: $0 <ação> <nome_container> [imagem]"
    exit 1
fi

if [ $1 == "--help" ]; then
    echo "Ações: criar, iniciar, parar, apagar, estado"
    exit 0
fi

ACTION=$1
CONTAINER=$2
IMAGE=$3

verifica_nome(){
    docker ps -a --format '{{.Names}}' | grep -wq "$CONTAINER"
}

if ! verifica_nome; then
  case $ACTION in 

    criar)
      docker run -d --name "$CONTAINER" "$IMAGE"
      ;;

    iniciar)
      docker start "$CONTAINER"
      ;;

    parar)
      docker stop "$CONTAINER"
      ;;

    apagar)
      docker rm "$CONTAINER"
      ;;

    estado)
      docker ps -a | grep "$CONTAINER"
      ;;

    *)
      echo "Opção inválida"
      exit 1
      ;;

  esac
else
  echo "O container '$CONTAINER' já existe."
fi
