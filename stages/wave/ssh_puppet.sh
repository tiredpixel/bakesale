#!/bin/bash

local sshs_str="$1"
local puppet_dir="$2"
local log_file="$3"

declare -a ssh_strs="${sshs_str[@]}"

for ssh_str in "${ssh_strs[@]}" ; do
    echo "$ssh_str"
    ssh -t $ssh_str "
        sudo bash -c \"
            puppet apply --logdest /dev/stdout $puppet_dir/**/*.pp | tee -a $log_file
        \"
  "
done
