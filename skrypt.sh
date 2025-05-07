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