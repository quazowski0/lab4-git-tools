#!/bin/bash

# Flaga --date (-d)
if [[ "$1" == "--date" || "$1" == "-d" ]]; then
    date
    exit 0
fi

# Flaga --logs (-l)
if [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    num_files=${2:-100} # Domyślnie 100 plików
    for ((x=1; x<=$num_files; x++)); do
        echo "Nazwa pliku: log$x.txt" > log$x.txt
        echo "Nazwa skryptu: $0" >> log$x.txt
        echo "Data: $(date)" >> log$x.txt
    done
    exit 0
fi

# Flaga --help (-h)
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Dostępne opcje:"
    echo "--date (-d)          Wyświetla dzisiejszą datę"
    echo "--logs (-l) [LICZBA] Tworzy X plików log"
    echo "--help (-h)          Wyświetla pomoc"
    exit 0
fi

# Flaga --init
if [[ "$1" == "--init" ]]; then
    git clone https://github.com/quazowski0/lab4-git-tools.git
    export PATH=$PATH:$(pwd)/lab4-git-tools
    echo "Repozytorium sklonowane i ścieżka dodana do PATH"
    exit 0
fi

# Flaga --error (-e)
if [[ "$1" == "--error" || "$1" == "-e" ]]; then
    num_files=${2:-100}
    for ((x=1; x<=$num_files; x++)); do
        mkdir -p error$x
        echo "Nazwa pliku: error$x.txt" > error$x/error$x.txt
        echo "Data: $(date)" >> error$x/error$x.txt
    done
    exit 0
fi
