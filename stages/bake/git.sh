#!/bin/bash

local repo="$1"
local branch="${2-master}"

git clone --recursive "$repo" --branch "$branch" "$bakesale_cakebox"
rm -Rf "$bakesale_cakebox/.git/"
