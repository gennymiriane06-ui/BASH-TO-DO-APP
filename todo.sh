#!/bin/bash

FILE="tasks.txt"

if [ ! -f "$FILE" ]; then
    touch "$FILE"
fi

if [ "$1" = "add" ]; then
    echo "$2" >> "$FILE"
    echo "Task added."
fi

if [ "$1" = "list" ]; then
    number=1
    while read -r line; do
        echo "$number. $line"
        number=$((number+1))
    done < "$FILE"
fi

if [ "$1" = "del" ]; then
    number=1
    
    while read -r line; do
        if [ "$number" != "$2" ]; then
            echo "$line" >> new.txt
        fi
        number=$((number+1))
    done < "$FILE"

    mv new.txt "$FILE"
    echo "Task deleted."
fi
