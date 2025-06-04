#!/bin/bash

echo "Insira PIN: "
read -s -n 4 PIN
echo

clear

while [[ "$ANSWER" != "$PIN" ]]; do
    echo "Adivinhe a chave: "
    read -n 4 ANSWER
    echo

    # Verifica quantos caracteres estão corretos na mesma posição
    CORRECT=0
    LEN=${#PIN}
    for (( i=0; i<LEN; i++ )); do
        if [[ "${PIN:i:1}" == ${ANSWER:i:1} ]]; then
            ((CORRECT++))
        fi
    done

    echo "Tem $CORRECT caracteres corretos na posição certa."
done