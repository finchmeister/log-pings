#!/usr/bin/env bash

function getStatus() {
    ping -c1 google.co.uk &> /dev/null
    if [[ $? -eq 0 ]]
    then
        status="UP"
    else
        status="DOWN"
    fi
    echo "$(date)::$status" >> status.log
}

while true
do
    getStatus
    sleep 10
done