#!/bin/bash

del)
    if [ -z "$2" ]; then
        echo "Error: Please provide a task number."
        exit 1
    fi

    total_tasks=$(wc -l < "$FILE")

    if [ "$2" -lt 1 ] || [ "$2" -gt "$total_tasks" ]; then
        echo "Error: Task number does not exist."
        exit 1
    fi

    > new.txt
    number=1

    while read -r line; do
        if [ "$number" -ne "$2" ]; then
            echo "$line" >> new.txt
        fi
        ((number++))
    done < "$FILE"

    mv new.txt "$FILE"
    echo "Task deleted successfully."
    ;;
