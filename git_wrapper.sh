#!/bin/bash

if [ "$1" == "yeet" ]; then
    git push && git pull
elif [ "$1" == "commit"; then
    shift
    grep "url" "${PWD}/.git.config
    if
    git commit "$@"
else
    git "$@"
fi
