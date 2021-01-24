#!/usr/bin/env bash
#===============================================================================
#
#   DESCRIPTION: stores functions for tip-notes project
# 
#         USAGE: source this file from script
#                
#        AUTHOR: S. Falcao
#       CREATED: 24.01.2021 09:18

#===============================================================================

# Copyright (C) 2020 tip-notes authors.
#
# This file is part of tip-notes.
#
#     tip-notes is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     tip-notes is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with Foobar.  If not, see <https://www.gnu.org/licenses/>



#set -o errexit
set -o nounset
set -o pipefail
#set -o xtrace


#-------------------------------------------------------------------------------
# CONFIGURATION SECTION
#-------------------------------------------------------------------------------
#
script_name=$(basename "${0}")


#####
# E #
#####
#

function print_error(){

    # print_error <message>
    #
    # input:
    #  message      message to be displayed
    #
    # output:
    #  prints <message> to stderr

    printf "%s\n" "$*" >/dev/stderr;
}

function print_error_if_flag_is_false(){

    # usage:
    #
    # print_error_if_flag_is_false <message> [<flag>]
    #
    # useful for example when you want to avoid messages from being displayed
    # based on a silent flag or something like that
    #
    # input:
    #  message      message to be displayed
    #  flag         <message> is displayed if flag contains 0, false or
    #               have not been passed, any other values prevent <message>
    #               from being printed
    #
    # output:
    #  prints <message> to stderr depending on flag value

    local message="${1}"
    local flag="${2-false}"     # if no value is passed for flag, false is
                                # assumed therefore message is displayed

    if [[ "${flag}" -eq "0" ]] || [[ "${flag}" == 'false' ]]; then
        printf "%s\n" "${message}" >/dev/stderr;
        return "0"
    else
        return "1"
    fi
}

#####
# P #
#####
#

function print_if_flag_is_false(){

    # usage:
    #
    # print_if_flag_is_false <message> [<flag>]
    #
    # input:
    #  message      message to be displayed
    #  flag         <message> is displayed if flag contains 0 or false
    #
    # output:
    #  prints <message> to stdout depending on flag value

    local message="${1}"
    local flag="${2}"

    if [[ "${flag}" -eq "0" ]] || [[ "${flag}" == 'false' ]]; then
        printf "${message}"
        return "0"
    else
        return "1"
    fi
}


function print_if_flag_is_true(){

    # usage:
    #
    # print_if_flag_is_true <message> [<flag>]
    #
    # input:
    #  message      message to be displayed
    #  flag         <message> is displayed if flag contains 1 or true
    #
    # output:
    #  prints <message> to stdout depending on flag value

    local message="${1}"
    local flag="${2}"

    if [[ "${flag}" -eq "1" ]] || [[ "${flag}" == 'true' ]]; then
        printf "${message}"
        return 0
    else
        return 1
    fi
}
