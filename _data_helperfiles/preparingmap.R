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
## sii_z_ex8_map ======================================================== =====
##
## library(ggmap)

  # map_data <- ggmap::get_map(location = c(3,50,8, 54), source = "stamen",  maptype = "watercolor")
  map_data2 <- ggmap::get_map(location = c(-3.5,42, 12, 55), source = "stamen",  maptype = "watercolor")
  sii_z_ex8_map <- ggmap::ggmap(map_data2, extent = "device")
  # sii_z_ex8_map
  devtools::use_data(sii_z_ex8_map, overwrite = TRUE)
  rm(sii_z_ex8_map)
## ====================================================================== ===
