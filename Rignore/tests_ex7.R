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

sii_debug(data_descr = sii_z_ex7_data$description,
          structure = sii_z_ex7_structure,
          outline = sii_z_ex7_outline,
          levelmax = sii_z_ex7_levelmax
      )



ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex7_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              ),
              structuredf =  sii_z_ex7_structure,
              levelmax = 99
              ) +
  theme_bw()
+
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


exampledata <- sii_z_ex7_data
exampledata$id <- 2
exampledata$comparewithid <- 1
exampledata$time <- 5
exampledata <- rbind(exampledata,sii_z_ex7_data)

ggplot2::ggplot() +
  geom_solvii(data = exampledata,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              ),
              structuredf =  sii_z_ex7_structure,
              levelmax = 99
              ) +
  theme_bw() +
  geom_solviioutline(data = exampledata,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,comparewithid = comparewithid
              ),
              structuredf =  sii_z_ex7_structure,
              levelmax = 99,
              color = "red",
              lwd = 1
              ) +
  theme_bw()



ggplot2::ggplot() +
  geom_solvii(data = exampledata,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,color = description
              ),
              fill = NA,
              structuredf =  sii_z_ex7_structure,
              levelmax = sii_z_ex7_levelmax
              ) +
  theme_bw()

+
  geom_solviioutline(data = exampledata,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,comparewithid = comparewithid
              ),
              structuredf =  sii_z_ex7_structure,
              levelmax = sii_z_ex7_levelmax,
              color = "red",
              lwd = 2
              ) +
  theme_bw()

rm(exampledata)

