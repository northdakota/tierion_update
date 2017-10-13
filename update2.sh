#!/bin/bash

for (( ; ; ))
do
    git fetch

    UPSTREAM=${1:-'@{u}'}
    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse "$UPSTREAM")
    BASE=$(git merge-base @ "$UPSTREAM")

    NOW=$(date +"%Y-%m-%d %T")

    if [ $LOCAL = $REMOTE ]; then
        echo $(printf "%s: Up-to-date" "$NOW")
    elif [ $LOCAL = $BASE ]; then
        echo $(printf "%s: Updating..." "$NOW")
        make down
        git pull
        make up
        echo $(printf "%s: Done..." "$NOW")
    else
        echo "Diverged!"
    fi
    sleep 5
done
