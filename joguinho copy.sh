# !/bin/bash

clear
read -s -p "Introduza o nome de um aluno: " NOME
echo

while [[ $INPUT != $NOME ]]; do
    read -p "Tenta adivinhar o nome: " INPUT
    echo "Não é esse o nome, tenta novamente"
done

echo "Sim, o nome era $NOME"
