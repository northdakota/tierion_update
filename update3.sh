#!/bin/bash

for (( ; ; ))
do
    NODE=$(docker ps | grep -c 'chainpoint/chainpoint-node')

    if  (("$NODE" >= 1)) ; then
        echo "Node running"
    else
        echo "Restarting node..."
        make down
        make up
    fi
    sleep 10
done
