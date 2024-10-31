#!/bin/sh

ISSUE_NUMBER=$(git symbolic-ref HEAD | sed -nE 's/[A-Za-z//-_]*([0-9]+).*/\1/p')
if [ -n "$ISSUE_NUMBER" ]; then
    echo "#$ISSUE_NUMBER" `cat $1`  > "$1"
fi
