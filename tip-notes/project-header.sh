#!/usr/bin/env bash
#==============================================================================
#
#   DESCRIPTION: tip-notes's Header
# 
#         USAGE: source this file in script that need project informations
#                
#        AUTHOR: S. Falcao
#       CREATED: 11.07.2020 16:09
# 
#==============================================================================

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
#     along with this program. If not, see <https://www.gnu.org/licenses/>


# improved /home detection required when used with sudo
_HOME="$(cat /etc/passwd |grep ^${SUDO_USER:-$(id -un)}: | cut -d: -f 6)"
_HOME=${_HOME:-$HOME}

HEADER___PROJECT_NAME="tip-notes"
HEADER___PROJECT_VERSION="0.1.0"
HEADER___PROJECT_MAIL="falecomigo.falcao@gmail.com"
HEADER___PROJECT_DEV_STAGE="DRAFT"

HEADER___PROJECT_EXECUTABLES_FOLDER="/usr/lib/${HEADER___PROJECT_NAME}"
HEADER___PROJECT_EXECUTABLE_FILE_NAME_1="tip"
HEADER___PROJECT_LINKS_FOLDER='/usr/local/bin'
HEADER___PROJECT_DOC_FOLDER="/usr/share/doc/${HEADER___PROJECT_NAME}"
HEADER___PROJECT_AUTOCOMPLETION_FOLDER="/etc/bash_completion.d"
HEADER___PROJECT_AUTOCOMPLETION_FILE="${HEADER___PROJECT_AUTOCOMPLETION_FOLDER}/tip.bash"
HEADER___PROJECT_MAN_FOLDER="/usr/local/man/man1"


# if change the following line, change also deb-make purge section
HEADER___PROJECT_CONFIG_FOLDER="${_HOME}/.config/${HEADER___PROJECT_NAME}"
HEADER___PROJECT_CONFIG_FILE="${HEADER___PROJECT_CONFIG_FOLDER}/tiprc"
