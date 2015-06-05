#!/bin/sh
# chamada.c
# This file is part of chamada.sh
#
# Copyright (C) 2015 - Jurandy Soares
#
# chamada.sh is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# chamada.sh is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with chamada.sh. If not, see <http://www.gnu.org/licenses/>.
#

# Script que lista o nome completo de quem iniciou sessão no horário da aula

# A-FAZER: 
#   * extrair ano, mês, dia do ambiente (amd=$(date +'%Y%m%d'))
#   * deduzir hora e minuto de início da aula (md=$(date +'%H%M'))
#   * tomar como base os horários https://github.com/jurandysoares/colario/blob/master/rascunho/tabela-horarios.csv

quem_acessou=$(last -R -w -t 20150603163000 |  \
               awk '{print $1}' | \
               sort -u | \
               egrep -v "(${USER}|reboot|wtmp)"
               )
               
for u in $quem_acessou; 
  do 
    egrep "^${u}:" /etc/passwd | \
    awk -F: '{print $5}'; 
  done | sort
