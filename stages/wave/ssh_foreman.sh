#!/bin/bash

local sshs_str="$1"
local foreman_str="$2"

declare -a ssh_strs="${sshs_str[@]}"

for ssh_str in "${ssh_strs[@]}" ; do
    echo "$ssh_str"
    ssh -t $ssh_str "
        sudo bash -c \"
            gem list -i foreman || gem install foreman
            foreman $foreman_str
        \"
  "
done
