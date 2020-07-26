#!/usr/bin/env bash
#===============================================================================
#
#   DESCRIPTION: tip notes's Header
# 
#         USAGE: source this file in script that need project informations
#                
#        AUTHOR: S. Falcao
#       CREATED: 11.07.2020 16:09
# 
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



__project_name__="tip-notes"
__project_version__="0.1.0"
__project_mail__="falecomigo.falcao@gmail.com"
__project_dev_stage__="DRAFT"


__project_binaries_folder__="/usr/local/bin/${__project_name__}"
__project_links_folder__='/usr/local/bin'


tip_config_folder=~/.config/tip-notes
tip_config_file=${tip_config_folder}/tiprc

# defaults (may be changed after sourcing configuration file)
tip_editor=''
#tip_confirm_remove=true
#tip_confirm_remove_purge=true
#tip_confirm_config_reset=true
#tip_confirm_delete_note=true
