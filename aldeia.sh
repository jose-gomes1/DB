# 1 - pedir a introducao do total de jogadores que serão guardados num array
# 2 - listar no ecrã a lista de jogadores com o respetido indice do array
# 3 - pedir para indicar quem são os 4 lobos, pelo id do array
# 4 - pedir para indicar a vidente
# 5 - de forma aleatória, o programa faz as jogadas, manda os lobos matar um aldeao, faz a vidente tentar adivinhar um lobo, manda os aldeoes votarem

JOGADORES={}
VIDENTE=false
LOBO=false

echo "Adicione os jogadores: "
read -i PLAYERS

JOGADORES+=PLAYERS

echo $JOGADORES