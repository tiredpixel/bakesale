#!/bin/bash

local ssh_str="$1"
local rsync_str="$2"

rsync -avz --delete $rsync_str "$bakesale_cakebox/" -e ssh -t $ssh_str
