#!/usr/bin/env bash
#===============================================================================
#
#   DESCRIPTION: library file of make-deb
# 
#         USAGE: source this files from your script
#                
#        AUTHOR: S. Falcão
#       CREATED: 06.09.2020 12:09

#===============================================================================

# Copyright (C) 2020 dupes-suite authors.
#
# This file is part of tip-notes
#
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with this program. If not, see <https://www.gnu.org/licenses/>

#-------------------------------------------------------------------------------
# FUNCTIONS
#-------------------------------------------------------------------------------
# use this section to store your functions
#
#

function copy_and_set_permissions(){
# copy_file_list_and_set_permissions \
#   [<file list> | <folder>] \
#   <destination> \
#   [<permission number>]
#
# list must be separated by tab

    origin="${1}"
    destination="${2}"
    permissions_number="${3}"

    folder_mode='false'

    if [[ -d "${origin}" ]]; then
    folder_mode='true'
    fi

    #echo "$list"
    #echo "$destination"
    #echo "$permissions_number"

    mkdir -p "${destination}"
    #echo "criando folder: ${destination}"

    IFS=$'\t'
    if [[ "${folder_mode}" ==  'false' ]]; then
    for full_path in ${origin}; do
        file_name=$(basename -- "${full_path}")
        cp ${full_path} "${destination}/${file_name}"
        if [[ -n "${permissions_number}" ]]; then
            chmod 644 "${destination}/${file_name}"
        fi
    done
    else
    for file_name in "${origin}"/*; do
        #echo "${file_name}"
        cp "${file_name}" "${destination}"/"${file_name}"
        if [[ -n "${permissions_number}" ]]; then
            chmod 644 "${destination}/${file_name}"
        fi
    done
    fi
}

