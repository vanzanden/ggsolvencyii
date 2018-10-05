## GNU General Public License version 3 , see file LICENCE ============== =====
##
##    sourcefile of package 'ggsolvencyii'
##    Copyright (C) <2018>  < Marco van Zanden , git@vanzanden.nl >
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <https://www.gnu.org/licenses/>.
##
##
## ====================================================================== =====
utils::suppressForeignCheck(c("comparewithid","compid",
                               "description","draw",
                               "group",
                               "id",
                              "level","level_grouping","levelordescription",
                              "n",
                              "outline1", "outline2", "outline3", "outline4", "outline11", "outline13",
                              "outlinetype",
                              "value",
                              "x","xend","xpoint",
                              "y","yend",
"ypoint"
                            ) )

utils::globalVariables(c("comparewithid","compid",
                         "description", "draw",
                         "group",
                         "id",
                         "level", "level_grouping", "levelordescription",
                         "n",
                         "outline1", "outline2", "outline3", "outline4", "outline11", "outline13",
                         "outlinetype",
                         "value",
                         "x","xend","xpoint",
                         "y","yend","ypoint"
                      ))
