#!/bin/bash

local ssh_str="$1"
local rvm_environment="$2"
local foreman_str="$3"

local load_rvm=`cat $bakesale_source/stages/wave/_rvm.sh`

ssh -t $ssh_str "
    sudo bash -c \"
        $load_rvm
        rvm use $rvm_environment
        rvm-prompt
        
        gem list -i foreman || gem install foreman
        foreman $foreman_str
    \"
"
