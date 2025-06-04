#!/bin/bash

echo "Insira PIN: "
read -s -n 4 PIN
echo

clear

while [[ "$ANSWER" != "$PIN" ]]; do
    echo "Adivinhe a chave: "
    read -n 4 ANSWER
    echo

    CORRECT=0
    INCORRECT=0
    MID=0
    for (( i=0; i<4; i++ )); do
        pin_char="${PIN:i:1}"
        answer_char="${ANSWER:i:1}"

        if [[ "$pin_char" == "$answer_char" ]]; then
            ((CORRECT++))
        else
            # Check if pin_char exists anywhere in ANSWER but not at position i
            if [[ "$ANSWER" == *"$pin_char"* ]]; then
                ((MID++))
            else
                ((INCORRECT++))
            fi
        fi
    done

echo "Tem $CORRECT caracteres corretos na posição certa."
echo "Tem $MID caracteres corretos na posição errada."
echo "Tem $INCORRECT caracteres incorretos."

done
