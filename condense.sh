#! /bin/bash

FILTER='and\>\|that\>\|but\>\|or\>\|as\>\|if\>\|when\>\|than\>\|because\>\|while\>\|where\>\|after\>\|so\>\|though\>\|since\>\|until\>\|whether\>\|before\>\|although\>\|nor\>\|like\>\|once\>\|unless\>\|now\>\|except'
FILTER='$FILTER\>\|the'

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
        sort | \
        grep -v -w $FILTER
fi
