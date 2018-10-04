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
## basistest regel 1, tonen resultaten
 ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex6_data[sii_z_ex6_data$id == 1,],
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                             lwd = 0.05
               ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


 ## basistest, tonen resultaten
 ggplot2::ggplot() +
  geom_solviioutline(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             comparewithid = comparewithid
                             ),
                             lwd = 0.05
               ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


 ## alles, default outline
 ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                             lwd = 0.05
               ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng) +
  geom_solviioutline(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             comparewithid = comparewithid
                             ),
                             lwd = 0.1,
                              color = "red"
               )



 ## alles, custom outline

 ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                             lwd = 0.05
                             ,color = "red"
               ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng) +
  geom_solviioutline(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             comparewithid = comparewithid

                             ),
                             lwd = 0.05,
               outline = sii_z_ex6_outline
               )

