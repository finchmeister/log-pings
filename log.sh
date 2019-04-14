#!/usr/bin/env bash


function getStatus() {
    fail=0
    n=0
    until [[ ${n} -ge 5 ]]
    do
      ping -c1 google.co.uk &> /dev/null && fail=0 && break
      fail=1
      n=$[$n+1]
      sleep 15
    done

    if [[ ${fail} -eq 0 ]]
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
    sleep 30
done