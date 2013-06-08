#!/bin/bash

local sshs_str="$1"
local remote_dir="$2"
local rsync_str="$3"

declare -a ssh_strs="${sshs_str[@]}"

for ssh_str in "${ssh_strs[@]}" ; do
    echo "$ssh_str"
    rsync -avz --delete $rsync_str "$bakesale_cakebox/" -e ssh -t "$ssh_str:$remote_dir"
done
