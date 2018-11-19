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

 ## voorbereiding op outline  sec
unique(paste0(sii_z_ex6_data$id,"-",sii_z_ex6_data$comparewithid))

## basistest regel 1, tonen resultaten van de buildup waarmee vergeleken wordt
 ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex6_data[sii_z_ex6_data$id == 1,],
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                             lwd = 0.05
               ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


 ## basistest, outline met alle segmenten
 ggplot2::ggplot() +
  geom_sii_riskoutline(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             comparewithid = comparewithid
                             ),
                             lwd = 0.05
               ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


## basistest, outline
 ggplot2::ggplot() +
  geom_sii_riskoutline(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             comparewithid = comparewithid
                             ),
                               plotdetails = sii_plotdetails_sf16,
                             lwd = 0.05
               ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)



 ## alles, SHOWCASE
 ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                             lwd = 0.05
               ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng) +
  ## complete outline, very thin
  geom_sii_riskoutline(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             comparewithid = comparewithid
                             ),
                             lwd = 0.1,
                              color = "black",
                              alpha = 0.1 ) +
   ## only outer outline and scr outline,
   geom_sii_riskoutline(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             comparewithid = comparewithid
                             ),
                             plotdetails = sii_z_ex6_plotdetails,
                            lwd = 0.6,
                              color = "red",
                              alpha = 0.7
               )



 ## alles, SHOWCASE, met grouping
 ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                              levelmax = sii_levelmax_sf16_995,
                             lwd = 0.05
               ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng) +
  ## complete outline, very thin
  geom_sii_riskoutline(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             comparewithid = comparewithid
                             ),
                              levelmax = sii_levelmax_sf16_995,
                             lwd = 0.1,
                              color = "black",
                              alpha = 0.1
               ) +
   ## only outer outline and scr outline,
   geom_sii_riskoutline(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             comparewithid = comparewithid
                             ),
                              levelmax = sii_levelmax_sf16_995,
                              plotdetails = sii_plotdetails_sf16,
                             lwd = 0.6,
                              color = "red",
                              alpha = 0.7
               )

 ## alles, custom outline

 ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                             lwd = 0.05
                             ,color = "red"
               ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng) +
  geom_sii_riskoutline(data = sii_z_ex6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             comparewithid = comparewithid

                             ),
                             lwd = 0.05,
               outline = sii_z_ex6_plotdetails
               )
