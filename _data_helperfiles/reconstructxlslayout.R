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
## ====================================================================== ===
## reconstruct exceltables from data, for use in vignettes

## data (english, without comparewithid)

t <- tidyr::spread(data = sii_z_ex2_data, key = description, value = value)
t <- as.data.frame(t)
t <- dplyr::select( t, id, time, ratio, SCR, dplyr::everything())
t <- t[ ,1:9]
knitr::kable(x = t)


t <- sii_debug(data_descr = sii_z_ex1_data$description,structure = sii_structure_sf16_eng,aggregatesuffix = "other", levelmax = sii_levelmax_sf16_995,plotdetails = sii_z_ex1_plotdetails, fillcolors = sii_z_ex1_fillcolors, edgecolors = sii_z_ex1_edgecolors)
t$debug_description[37:45,]
rbind(t$debug_level[1:13,],tail(t$debug_level,2))
