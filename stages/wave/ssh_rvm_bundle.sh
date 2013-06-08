#!/bin/bash

local ssh_str="$1"
local rvm_environment="$2"
local cd_path="$3"

local load_rvm=`cat $bakesale_source/stages/wave/_rvm.sh`

ssh -t $ssh_str "
    $load_rvm
    rvm use $rvm_environment
    rvm-prompt
    
    cd '$cd_path'
    gem list -i bundler || gem install bundler
    bundle install --without development:test --binstubs --deployment
"
