# !/bin/bash

clear
read -s -p "Introduza o nome de um aluno: " NOME
echo

while true; do

    read -p "Tenta adivinhar o nome: " INPUT

    if [ $INPUT != $NOME ]; then
        echo "Não é esse o nome, tenta novamente"
    else
        echo "Acertaste! O nome era $NOME"
        break
    fi

done
