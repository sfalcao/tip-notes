#!/usr/bin/env bash
#
# Bash completion file for tip-notes
#

script_name=$(basename "${0}")

link_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
linked_script=$(readlink "${link_dir}/${script_name}")
if [[ -z "${linked_script}" ]]; then
    executables_dir="${link_dir}"
else
    executables_dir=$(dirname "${linked_script}")
fi
# shellcheck source=./project-header.sh
source "${executables_dir}/project-header.sh"
# shellcheck source=/home/falcao/.config/tip-notes/tiprc
source "${HEADER___PROJECT_CONFIG_FILE}"

#echo $executables_dir
#echo $HEADER___PROJECT_CONFIG_FILE
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
    tip_opts_long+=' --find --find-content'
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
