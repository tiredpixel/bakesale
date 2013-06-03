#!/bin/bash

set -e

bakesale_script=$( cd $(dirname $0) ; pwd -P )
bakesale_source=$( dirname "${BASH_SOURCE[0]}" )

cat << EOF

                                    *  *  *
                                    |  |  |
                                   +++++++++
                                   +/\/-\/\+
                                   +\/\-/\/+
                                   +++++++++
                                   
                                  BAKESALE :)

                         Qu'ils mangent de la brioche.


          More sleep lost by tiredpixel (http://www.tiredpixel.com).

EOF


# = Create Cakebox

bakesale_cakebox=`mktemp -d -t bakesale_cakebox`

trap "{ rm -rf $bakesale_cakebox; }" EXIT


# = Main

bakesale() {
    local stage=$1
    local cmd=$2
    
    shift; shift
    
    source "$bakesale_source/$stage/$cmd.sh"
}
