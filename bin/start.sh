#!/bin/bash

exit_script() {
    $(iptables_down.sh)
#   trap - SIGINT SIGTERM # clear the trap
    exit 1
}

trap exit_script SIGINT SIGTERM

$(iptables_up.sh)
$(iptables_own.sh)

#other commands here
#sleep infinity
while :; do :; done
