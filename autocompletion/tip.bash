#
# Bash completion file for tip-notes
#

source /usr/lib/tip-notes/project-header.sh
source ${___HEADER___PROJECT_CONFIG_FILE___}

have tip &&
_complete_me()
{
    local cur opt
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"

#    echo
#    echo "COMP_CWORD...: '${COMP_CWORD}'"
#    echo "COMP_WORDS...: '${COMP_WORDS}'"
#    echo "COMP_WORDS[0]: '${COMP_WORDS[0]}'"
#    echo "COMP_WORDS[1]: '${COMP_WORDS[1]}'"
#    echo "COMP_WORDS[2]: '${COMP_WORDS[2]}'"
#    echo "cur..........: '${cur}'"
#    echo


    if [[ $COMP_CWORD == 1 ]]; then
        if  [[ $cur == '-' ]]; then
            # Completion of -<options>
            #echo "--<options> detected"
            COMPREPLY=( $(compgen -W '
                -b -d -e -f -F -h
                ' -- "$cur" ) )
            return 0
        elif  [[ $cur =~ --.* ]]; then
            # Completion of --<options>
            #echo "--<options> detected"
            COMPREPLY=( $(compgen -W '
                --backup
                --config --reset --init 
                --edit --delete
                --find --find-content
                --remove --purge
                --authors --version --help
                ' -- "$cur" ) )
            return 0
        fi
    fi

    # completion of --backup
    if [[ $COMP_CWORD == 2 ]]; then
        if [[ ${COMP_WORDS[1]} == "--backup" ]]; then
            #echo "--backup detected"
            COMPREPLY=( $(compgen -W '
                --all --config-only --notes-only
                ' -- "$cur" ) )
            return 0
	fi
    fi


    # completion of -d & -e options
    if [[ ${COMP_WORDS[1]} =~ -[d|e] ]] || [[ ${COMP_WORDS[1]} == '' ]]; then
        # Completion of existing notes
        NOTES_LIST=$(
    	    find ${___CONFIG___TIP_NOTES_FOLDER} \
    	    | sort \
    	    | grep -oP "${___CONFIG___TIP_NOTES_FOLDER}/\K.*" \
        )
    
        COMPREPLY=( $(compgen -W ' ${NOTES_LIST}' -- "$cur" ) )
        return 0
    fi

} &&
complete -F _complete_me tip