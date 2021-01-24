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
#     along with Foobar.  If not, see <https://www.gnu.org/licenses/>



HEADER___PROJECT_NAME="tip-notes"
HEADER___PROJECT_VERSION="0.1.0"
HEADER___PROJECT_MAIL="falecomigo.falcao@gmail.com"
HEADER___PROJECT_DEV_STAGE="DRAFT"


HEADER___PROJECT_EXECUTABLES_FOLDER="/usr/lib/${HEADER___PROJECT_NAME}"
HEADER___PROJECT_LINKS_FOLDER='/usr/local/bin'
HEADER___PROJECT_DOC_FOLDER="/usr/share/doc/${HEADER___PROJECT_NAME}"
HEADER___PROJECT_AUTOCOMPLETION_FOLDER="/etc/bash_completion.d"
___HEADER___PROJECT_AUTOCOMPLETION_FILE___="${HEADER___PROJECT_AUTOCOMPLETION_FOLDER}/tip.bash"
___HEADER___PROJECT_MAN_FOLDER___="/usr/local/man/man1"


# if change the following line, change also deb-make purge section
_home="`cat /etc/passwd |grep ^${SUDO_USER:-$(id -un)}: | cut -d: -f 6`"
_home=${_home:-$HOME}
___HEADER___PROJECT_CONFIG_FOLDER___="${_home}/.config/${HEADER___PROJECT_NAME}"
HEADER___PROJECT_CONFIG_FILE="${___HEADER___PROJECT_CONFIG_FOLDER___}/tiprc"
