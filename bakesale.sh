#!/bin/bash

set -e

bakesale_script=$( cd $(dirname $0) ; pwd -P )
bakesale_source=$( dirname "${BASH_SOURCE[0]}" )


source "$bakesale_source/common/banner.sh"


# = Create Cakebox

bakesale_cakebox=`mktemp -d -t bakesale_cakebox`

trap "{ rm -rf $bakesale_cakebox; }" EXIT


# = Main

bakesale() {
    local stage=$1
    local cmd=$2
    
    shift; shift
    
    source "$bakesale_source/stages/$stage/$cmd.sh"
}
