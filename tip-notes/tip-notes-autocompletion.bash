#!/bin/usr/env bash
#
# Bash completion file for tip-notes
#

set -o nounset

SCRIPT_NAME=$(basename "${0}")

LINK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LINKED_SCRIPT=$(readlink "${LINK_DIR}/${SCRIPT_NAME}")
if [[ -z "${LINKED_SCRIPT}" ]]; then
    EXECUTABLES_DIR="${LINK_DIR}"
else
    EXECUTABLES_DIR=$(dirname "${LINKED_SCRIPT}")
fi
# shellcheck source=./project-header.sh
source "${EXECUTABLES_DIR}/project-header.sh"
# shellcheck source=/home/falcao/.config/tip-notes/tiprc
source "${___HEADER___PROJECT_CONFIG_FILE___}"

#echo $EXECUTABLES_DIR
#echo $___HEADER___PROJECT_CONFIG_FILE___
#echo $___CONFIG___TIP_NOTES_FOLDER


_tip() {
    local cur prev tip_opts_long tip_opts_short notes_list
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    tip_opts_short='-b -d -e -f -F -h'

    tip_opts_long='--help --authors --version'
    tip_opts_long+=' --backup'
    tip_opts_long+=' --edit --delete'
    tip_opts_long+=' --config --reset --init'
    tip_opts_long+=' --remove --purge'

    tip_backup_suboptions_long='--all --config-only --notes-only'

    notes_list=$(
        find "${___CONFIG___TIP_NOTES_FOLDER}" \
        | sort \
        | grep -oP "${___CONFIG___TIP_NOTES_FOLDER}/\K.*" \
    )



    if [[ "${cur}" == '-' && ${COMP_CWORD} -eq 1 ]]; then
        # linting sugesttion causes undesired column efect. Keep as it is
        COMPREPLY=( $(compgen -W "${tip_opts_short}" -- "${cur}") )
        return 0
    elif [[ "${cur}" == '--'* && ${COMP_CWORD} -eq 1 ]]; then
        # linting sugesttion causes undesired column efect. Keep as it is
        COMPREPLY=( $(compgen -W "${tip_opts_long}" -- "${cur}") )
        return 0
    elif [[ "${COMP_CWORD}" -eq 1 ]]; then
        COMPREPLY=( $(compgen -W "${notes_list}" -- "${cur}") )
        return 0
    fi
 
    case "${prev}" in
        '-d' | '--delete')
            COMPREPLY=( $(compgen -W "${notes_list}" -- "${cur}") )
            ;;
        '-e' | '--edit')
            COMPREPLY=( $(compgen -W "${notes_list}" -- "${cur}") )
            ;;
        '-b' | '--backup')
            if [[ "${COMP_CWORD}" -eq 2 ]]; then
                COMPREPLY=(
                    $(compgen -W "${tip_backup_suboptions_long}" -- "${cur}")
                )
            fi
            ;;
    esac
}

complete -F _tip tip
