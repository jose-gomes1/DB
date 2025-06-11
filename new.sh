#!/bin/bash

echo "Nome do S.O: "$GDMSESSION > machine.inf
echo "User: "$USER >> machine.inf
echo "Linguagem: "$LANG >> machine.inf
echo "Desktop: "$XDG_CURRENT_DESKTOP >> machine.inf