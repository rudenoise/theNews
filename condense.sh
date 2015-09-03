#! /bin/bash

if [ -z "$1" ]; then
    echo "Usage:"
    echo "condense.sh [url]"
else
    curl $1 | \
        pandoc -f html -t plain | \
        grep ^[\“A-Za-z0-9] |\
        tr '\ ' '\n' | \
        tr '[:upper:]' '[:lower:]' | \
        tr -d '[:punct:]' | \
        sort | \
        uniq -c | \
        sort
fi
