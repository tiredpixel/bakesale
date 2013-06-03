#!/bin/bash

local repo="$1"

git clone --recursive "$repo" "$bakesale_cakebox"
rm -Rf "$bakesale_cakebox/.git/"
