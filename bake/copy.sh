#!/bin/bash

local from="$1"
local to="$2"

cp -R "$from" "$bakesale_cakebox/$to"
