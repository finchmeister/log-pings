#!/usr/bin/env bash

function getStatus() {
    fail=0
    # Retry 2 twice if fail
    n=0
    until [ $n -ge 2 ]
    do
      ping -c1 google.co.uk &> /dev/null && break
      fail=1
      n=$[$n+1]
      sleep 5
    done

    if [[ $fail -eq 0 ]]
    then
        status="UP"
    else
        status="DOWN"
    fi
    echo "$(date "+%a %d %b %T %Z %Y")::$status" >> status.log
}


while true
do
    getStatus
    sleep 10
done