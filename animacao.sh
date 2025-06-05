#!/bin/bash

echo "Insira uma letra: "
read -n 1 letra

pos=0
direcao=1
largura=$(tput cols)

while true; do

    clear
    for(( i=0; i<pos; i++ )); do
        echo -n " "
    done

    echo "$letra"

    if (( pos >= largura - 1 )); then
        direcao=-1
    elif (( pos <= 0 )); then
        direcao=1
    fi

    (( pos += direcao ))

    sleep 0.09

done