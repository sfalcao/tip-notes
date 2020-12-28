set tip_notes_folder ~/.tip-notes

set -l tip_commands \
    --edit --delete --find --find-content --config --version --authors --help
set -l tip_commands_that_require_folder_list --edit --delete
set -l tip_commands_that_require_note_names --find
set -l tip_backup_commands --backup
set -l tip_backup_options --all --config-only --notes-only


function __fish_tip_notes_names
    find "$tip_notes_folder" -type f -printf "%f\n"
end

function __fish_tip_notes
    find "$tip_notes_folder" \
    | sort \
    | grep -oP $tip_notes_folder/"\K.*"
end

function __fish_tip_backup_options
    echo "--all"
    echo "--config-only"
    echo "--notes-only"
end



complete -f -c tip\
    -n "not __fish_seen_subcommand_from $tip_commands;\
        and not __fish_contains_opt backup"\
    -a --edit\
    -d 'add/edit a note'
complete -f -c tip\
    -n "not __fish_seen_subcommand_from $tip_commands;\
        and not __fish_contains_opt backup"\
    -a --delete\
    -d 'delete a note'
complete -f -c tip\
    -n "not __fish_seen_subcommand_from $tip_commands;\
        and not __fish_contains_opt backup"\
    -a --find\
    -d 'find notes by name'
complete -f -c tip\
    -n "not __fish_seen_subcommand_from $tip_commands;\
        and not __fish_contains_opt backup"\
    -a --find-content\
    -d 'find notes content'
complete -f -c tip\
    -n "not __fish_seen_subcommand_from $tip_commands;\
        and not __fish_contains_opt backup"\
    -a --version\
    -d 'show tip-notes version'
complete -f -c tip\
    -n "not __fish_seen_subcommand_from $tip_commands;\
        and not __fish_contains_opt backup"\
    -a --authors\
    -d 'show tip-notes authors list'
complete -f -c tip\
    -n "not __fish_seen_subcommand_from $tip_commands;\
        and not __fish_contains_opt backup"\
    -a --config\
    -d 'edit tip-notes configuration file'
complete -f -c tip\
    -n "not __fish_seen_subcommand_from $tip_commands;\
        and not __fish_contains_opt backup"\
    -a --help\
    -d 'show tip-notes help'
complete -f -c tip\
    -n "not __fish_seen_subcommand_from $tip_commands;\
        and not __fish_contains_opt backup"\
    -a --backup\
    -d 'backup notes, config files or both'

complete -f -c tip\
    -n "__fish_seen_subcommand_from $tip_commands_that_require_folder_list;\
        and not __fish_seen_subcommand_from (__fish_tip_notes)"\
    -a "(__fish_tip_notes)"

complete -f -c tip\
    -n "__fish_seen_subcommand_from $tip_commands_that_require_note_names;\
        and not __fish_seen_subcommand_from (__fish_tip_notes_names)"\
    -a "(__fish_tip_notes_names)"

    
complete -f -c tip\
    -n "__fish_seen_subcommand_from $tip_backup_commands;\
        and not __fish_seen_subcommand_from (__fish_tip_backup_options)"\
    -a "$tip_backup_options"
