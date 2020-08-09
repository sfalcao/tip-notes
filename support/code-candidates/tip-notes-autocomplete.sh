#!/bin/bash

source ./project-header.sh
source ${__project_config_file__}


_tip_notes ()
{
    local cur

    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}

    case "${cur}" in
        -*) # here is defined completion to my options
            COMPREPLY=(
                $( compgen -W '-d -e -h --config --config-init \
                --config-reset --delete --edit --help --version --authors' \
                -- $cur
                )
            )
            ;;

        *)  # here files with path should be added as completion as:
            # <dir>/<file>

            # BUT it fails, only file names are added in completion
            # folder part is missing
            #
            # If I print ${COMPREPLY[@]} everyting is there, but when
            # I try completion, only filename is present!???
            #
            # e.g
            #
            # I have a folder named "notes" where I have subfolders used to
            # group those notes by issue, in these subfolders are stored
            # notes. For example, a subfolder named "phones" which contain
            # files named "sue", "joe", "lilly" where their phones are stored
            #
            # I want to print out those information and for example use a
            # cat wrapper to print it out so that mycat <TAB><TAB> should
            # bring:
            #
            # /phones/joe /phones/sue /phones/lily
            #
            # BUT, what i get is:
            #
            # joe, sue, lilly
            #
            # I do not understand why


            notes=$(
                find ${tip_notes_folder} -type f \
                | sort \
                | grep -oP "${tip_notes_folder}/\K.*" \
            )

            COMPREPLY=(
                $(compgen -W "${notes}" -- $cur)
            )
            #echo "comp: ${COMPREPLY[@]}"
            ;;
    esac

    return 0
}

complete -F _tip_notes -o filenames tip
