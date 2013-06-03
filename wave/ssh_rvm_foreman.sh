#!/bin/bash

local ssh_str="$1"
local rvm_path="$2"
local foreman_str="$3"

ssh -t $ssh_str "
    sudo bash -c \"
        source '$rvm_path'
        rvm-prompt
        gem list -i foreman || gem install foreman
        foreman $foreman_str
    \"
"
