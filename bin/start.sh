#!/bin/bash

exit_script() {
    $(/usr/local/bin/iptables_down.sh)
#   trap - SIGINT SIGTERM # clear the trap
    exit 1
}

trap exit_script SIGINT SIGTERM

$(/usr/local/bin/iptables_up.sh)
$(/usr/local/bin/iptables_own.sh)

#other commands here
#sleep infinity
while :; do :; done
