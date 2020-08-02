#!/bin/bash
#==============================================================================
#
#   DESCRIPTION:  edit config.rg in order to make test possible
# 
#         USAGE:  ./test.sh
# 
#        AUTHOR:  S. Falcao
#       CREATED:  29.12.2019 19:24 BRST
# 
#==============================================================================

set -o errexit
#set -o nounset
set -o pipefail
#set -o xtrace



#---------
# HEADER
#---------
__script_name__="test.sh"
__target_file__="./config.rc"




#---------------
# MAIN ROUTINE
#---------------
#
echo "Editing: ${__target_file__}"
if sed -i "s/\[\[project_name\]\]/super-test/g" "${__target_file__}"; then
    echo "project_name edited in ${__target_file__} ..."
fi
if sed -i "s/\[\[project_main_script\]\]/test/g" "${__target_file__}"; then
    echo "project_main_script edited in ${__target_file__} ..."
fi
if sed -i "s/\[\[project_author\]\]/S. Falcao/g" "${__target_file__}"; then
    echo "project_author edited in ${__target_file__} ..."
fi
if sed -i "s/\[\[project_mail\]\]/falecomigo.falcao@gmail.com/g" "${__target_file__}"; then
    echo "project_mail edited in ${__target_file__} ..."
fi
if sed -i "s/\[\[project_version\]\]/v0.1.0/g" "${__target_file__}"; then
    echo "project_version edited in ${__target_file__} ..."
fi
if sed -i "s/\[\[project_dev_stage\]\]/TOSCO/g" "${__target_file__}"; then
    echo "project_dev_stage edited in ${__target_file__} ..."
fi


exit 0
