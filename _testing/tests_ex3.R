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

sii_debug(data_descr = sii_z_ex3_data$description,
          structure = sii_z_ex3_structure,
          levelmax = sii_z_ex3_levelmax
)

sii_debug(data_descr = sii_z_ex3_data$description,
          structure = sii_structure_sf16_eng,
          levelmax = sii_z_ex3_levelmax
)






## test of a compact dataset in a compact structure
ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex3_data,
                        mapping = ggplot2::aes(x = time,
                                               y = ratio,
                                               id = id,
                                               value = value,
                                               description = description,
                                               fill = description,
                                               color = description)
                        , structuredf = sii_z_ex3_structure
                        , levelmax = sii_z_ex3_levelmax

              ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)



## test of a compact dataset in a full structure, geen levelmax meegegeven
ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex3_data,
                        mapping = ggplot2::aes(x = time,
                                               y = ratio,
                                               id = id,
                                               value = value,
                                               description = description,
                                               fill = description,
                                               color = description)
                        ,  structuredf = sii_structure_sf16_eng
                        # , geen levelmax meegegeven

              ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


## test of a compact dataset in a full structure (levelmax = 95)
ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex3_data,
                        mapping = ggplot2::aes(x = time,
                                               y = ratio,
                                               id = id,
                                               value = value,
                                               description = description,
                                               fill = description,
                                               color = description)
                        , structuredf = sii_structure_sf16_eng
                        , levelmax = 95

              ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)






## test of a compact dataset in a full structure
ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex3_data,
                        mapping = ggplot2::aes(x = time,
                                               y = ratio,
                                               id = id,
                                               value = value,
                                               description = description,
                                               fill = description,
                                               color = description)
                        , structuredf = sii_structure_sf16_eng
                        , levelmax = sii_z_ex3_levelmax

              ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

