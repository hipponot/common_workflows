#!/bin/sh

ISSUE_NUMBER=$(git symbolic-ref HEAD --short | sed -nE 's/[A-Za-z\-_]*([0-9]+).*/\1/p')
REPO_NAME=$(git symbolic-ref HEAD --short | sed -nE 's/([A-Za-z]*)[\-_]*[0-9]+.*/\1/p')
REPO_PREPEND=""
if [ "$REPO_NAME" = "gh" ]; then
    REPO_PREPEND=""
fi

if [ "$REPO_NAME" = "nimbee" ]; then
    REPO_PREPEND="hipponot/nimbee"
fi
if [ "$REPO_NAME" = "vega" ]; then
    REPO_PREPEND="hipponot/vega"
fi
if [ "$REPO_NAME" = "ms" ]; then
    REPO_PREPEND="hipponot/microservices"
fi
if [ "$REPO_NAME" = "scs" ]; then
    REPO_PREPEND="saga-ed/saga-cu-shared"
fi


if [ -n "$ISSUE_NUMBER" ]; then
    echo "$REPO_PREPEND#$ISSUE_NUMBER" `cat $1`  > "$1"
fi
