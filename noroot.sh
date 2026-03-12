#!/bin/bash
#
#
#
###########################
# Author:Nagendra
# Date:08-03-2026
# version V1
#
###########################


set -o pipefail   # pipeline failure detection
set -e            # exit if any command fails
set -x            # debug mode (prints commands)

user="tony"
servers=("stapp01" "stapp02" "stapp03")

for server in "${servers[@]}"
do
    ssh ${user}@${server} "
        sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
        sudo systemctl restart sshd
        grep PermitRootLogin /etc/ssh/sshd_config
    "
done
