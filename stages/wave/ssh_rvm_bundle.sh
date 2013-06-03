#!/bin/bash

local ssh_str="$1"
local rvm_path="$2"
local cd_path="$3"

ssh -t $ssh_str "
    source '$rvm_path'
    rvm-prompt
    cd '$cd_path'
    gem list -i bundler || gem install bundler
    bundle install --without development:test --binstubs --deployment
"
