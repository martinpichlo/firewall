#!/bin/bash

#Define cleanup procedure
cleanup() {
    echo "Container stopped, performing cleanup..."
    $(date >> /root/date)
}

#Trap SIGTERM
trap 'cleanup' SIGTERM

#Execute a command
"${@}" &

#Wait
wait $!

