#!/bin/bash

# TODO: to be improoved. How it is the file will take time to scan
#       tip-notes folde which my be not nice if a large number of
#       files is present. Please see /support/code-candidates

source ./project-header.sh
source ${__project_config_file__}

MY_OPTIONS='
    -d -e -h \
    --config --config-init --config-reset --delete --edit --help --version \
    --authors
'

NOTES_LIST=$(
    find ${tip_notes_folder} \
    | sort \
    | grep -oP "${tip_notes_folder}/\K.*" \
)

complete -W "${MY_OPTIONS} ${NOTES_LIST}" tip
