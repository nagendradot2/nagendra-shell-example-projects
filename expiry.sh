#!/bin/bash

###########################
# Author: Nagendra
# Date: 08-03-2026
# Version: V2
###########################

set -o pipefail
set -e
set -x

# Check if arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <username> <expiry-date>"
    echo "Example: $0 siva 2026-12-31"
    exit 1
fi

# Check if  user already exits
if id "$user" &>/dev/null; then
    echo "User $user already exists"
    exit 1
fi
user=$1
expiry_date=$2

# Create user with expiry date
sudo useradd -e "$expiry_date" "$user"

# Set password
sudo passwd "$user"

# Check user expiry details
sudo chage -l "$user"
