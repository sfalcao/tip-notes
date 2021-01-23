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



___HEADER___PROJECT_NAME___="tip-notes"
___HEADER___PROJECT_VERSION___="0.1.0"
___HEADER___PROJECT_MAIL___="falecomigo.falcao@gmail.com"
___HEADER___PROJECT_DEV_STAGE___="DRAFT"


___HEADER___PROJECT_EXECUTABLES_FOLDER___="/usr/lib/${___HEADER___PROJECT_NAME___}"
___HEADER___PROJECT_LINKS_FOLDER___='/usr/local/bin'
___HEADER___PROJECT_DOC_FOLDER___="/usr/share/doc/${___HEADER___PROJECT_NAME___}"
___HEADER___PROJECT_AUTOCOMPLETION_FOLDER___="/etc/bash_completion.d"
___HEADER___PROJECT_AUTOCOMPLETION_FILE___="${___HEADER___PROJECT_AUTOCOMPLETION_FOLDER___}/tip.bash"
___HEADER___PROJECT_MAN_FOLDER___="/usr/local/man/man1"


# if change the following line, change also deb-make purge section
_home="`cat /etc/passwd |grep ^${SUDO_USER:-$(id -un)}: | cut -d: -f 6`"
_home=${_home:-$HOME}
___HEADER___PROJECT_CONFIG_FOLDER___="${_home}/.config/${___HEADER___PROJECT_NAME___}"
HEADER___PROJECT_CONFIG_FILE="${___HEADER___PROJECT_CONFIG_FOLDER___}/tiprc"
