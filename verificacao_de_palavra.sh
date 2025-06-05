ficheiro="$1"
palavra="$2"

if [ -z "$ficheiro" ] || [ -z "$palavra" ]; then
    echo "Usage: $0 <ficheiro> <palavra>"
    exit 1
fi

if [ ! -e "$ficheiro" ]; then
    echo "Ficheiro inexistente"
    exit 1
fi

if grep -wq "$palavra" "$ficheiro"; then
    echo "$palavra existe em $ficheiro"
else
    echo "$palavra não existe em $ficheiro"
fi