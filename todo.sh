#!/bin/bash

FILE="tasks.txt"

[ ! -f "$FILE" ] && touch "$FILE"

case "$1" in
    add)
        echo "${*:2}" >> "$FILE"
        echo "Task added"
        ;;

    list)
        number=1
        while read -r line; do
            echo "$number. $line"
            number=$((number + 1))
        done < "$FILE"
        ;;

    del)
        total=$(wc -l < "$FILE")

        if [ "$2" -lt 1 ] || [ "$2" -gt "$total" ]; then
            echo "Task number does not exist"
            exit 1
        fi

        : > new.txt
        number=1

        while read -r line; do
            if [ "$number" -ne "$2" ]; then
                echo "$line" >> new.txt
            fi
            number=$((number + 1))
        done < "$FILE"

        mv new.txt "$FILE"
        echo "Task deleted"
        ;;

    *)
        echo "Usage:"
        echo "./todo.sh add \"task name\""
        echo "./todo.sh list"
        echo "./todo.sh del number"
        ;;
esac
