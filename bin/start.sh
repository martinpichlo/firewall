#!/bin/bash

# Author: Martin Pichlo
# Created: 08.02.2018

exit_script() {
    $(iptables_down.sh)
    trap - SIGINT SIGTERM # clear the trap
    exit 1
}

trap exit_script SIGINT SIGTERM

$(iptables_up.sh)
$(iptables_own.sh)

while :; do :; done
