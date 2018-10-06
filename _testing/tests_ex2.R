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
## sii_z_ex2_data ================================================== =====
##
## 3 dataregel, 1 EN 2E scr bevat alle leven en markt risicos
## de derde regel ook nonlife en health
##
##


sii_debug(data_descr = sii_z_ex2_data$description,
          structure = sii_structure_sf16_eng,
          levelmax = sii_levelmax_sf16_995,
          plotdetails = sii_plotdetails_sf16,
          fillcolors = sii_x_fillcolors_sf16_eng,
          edgecolors = sii_x_edgecolors_sf16_eng,
          aggregatesuffix = "_test"  )

sii_debug(data_descr = sii_z_ex2_data$description,
          structure = sii_structure_sf16_eng,
          levelmax = sii_levelmax_sf16_995,
          plotdetails = sii_plotdetails_sf16,
          fillcolors = sii_x_fillcolors_sf16_eng,
          edgecolors = sii_x_edgecolors_sf16_eng,
          aggregatesuffix = "_other"  )


## basistest data, tonen resultaten
 ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                             lwd = 0.05
               ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


## groeperen van resultaten, levelmax = 3
 ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                              # maxscrvalue = 53.333,
                               levelmax = 3,
                             # levelmax = sii_levelmax_sf16_993,
                             # color = "black",
                              # scalingx = .2,
                             # , scalingy=.5,
                             # rotationdegrees = -90,
                             # squared = TRUE,
                             # rotationdescription = "life",
                             # rotationdescription = "l_longevity",
                             lwd = 0.05
               ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


## groeperen van resultaten, levelmax = 993
  ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                              # maxscrvalue = 53.333,
                             # levelmax = 4,
                             levelmax = sii_levelmax_sf16_993,
                             # color = "black",
                              # scalingx = .2,
                             # , scalingy=.5,
                             # rotationdegrees = -90,
                             # squared = TRUE,
                             # rotationdescription = "life",
                             # rotationdescription = "l_longevity",
                             lwd = 0.05
               ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)




 ## voorbereiding op outline  sec
unique(paste0(sii_z_ex2_data$id,"-",sii_z_ex2_data$comparewithid))

sii_z_ex2_data[!duplicated(sii_z_ex2_data[c('id','time', 'ratio', 'comparewithid')]),]



ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data[sii_z_ex2_data$id == 2,],
                     mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                                   description = description,color = description, fill = description ),
                     lwd = .5
  )


testparams <- NULL

testparams$structuredf <- sii_structure_sf16_eng
testparams$levelmax <- 99
testdata <- sii_z_ex2_data[sii_z_ex2_data$id == 2,]

testparams$aggregatesuffix <- "_other"
test_result <- ggsolvencyii:::fn_structure_expansion(testparams) ;test_result

test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ; test_result

rm(testparams) ; rm(testdata) ;rm(test_result)



##  outline
  ggplot2::ggplot() +
  geom_sii_riskoutline(data = sii_z_ex2_data,
                     mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                                   description = description, comparewithid = comparewithid),
                     # color = "red",
                     # lwd = .5 #,
  )


## outline sec (no plotdetails table )
  ggplot2::ggplot() +
  geom_sii_riskoutline(data = sii_z_ex2_data[sii_z_ex2_data$id <= 2,],
                     mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                                   description = description, comparewithid = comparewithid),
                     # color = "red",
                     # lwd = .5 #,
  )


  ##  outline sec (no plotdetails table , fixed comparewithid)
  ggplot2::ggplot() +
  geom_sii_riskoutline(data = sii_z_ex2_data[sii_z_ex2_data$id <= 2,],
                     mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                                   description = description, comparewithid = 2 ),
                     color = "red",
                     lwd = .5 #,
  )

  ## test outline sec (no plotdetails table , fixed wrong comparewithid)
  ggplot2::ggplot() +
  geom_sii_riskoutline(data = sii_z_ex2_data[sii_z_ex2_data$id <= 2,],
                     mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                                   description = description, comparewithid = 7 ),
                     color = "red",
                     lwd = .5 #,
  )

  ## test outline sec (no plotdetails table , no comparewithid)
  ggplot2::ggplot() +
  geom_sii_riskoutline(data = sii_z_ex2_data[sii_z_ex2_data$id <= 2,],
                     mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                                   description = description ),
                     color = "red",
                     lwd = .5 #,
  )











  ## test outline sec (standaard plotdetails table )
  ggplot2::ggplot() +
  geom_sii_riskoutline(data = sii_z_ex2_data[sii_z_ex2_data$id <= 2,],
                     mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                                   description = description, comparewithid = comparewithid),
                     color = "red",
                     lwd = 0.5 ,
					           plotdetails = sii_plotdetails_sf16
  )




# test alles in een
    ggplot() +
     geom_sii_risksurface(data = sii_z_ex2_data,
                 mapping = ggplot2::aes(x = time, y = ratio, id = id, value = value, description = description,
                               fill = description,color = description),
                               lwd = 0.5) +
                ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
                ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng) +
      geom_sii_riskoutline(data = sii_z_ex2_data,
                         mapping = ggplot2::aes(x = time, y = ratio, id = id, value = value,
                                       description = description, comparewithid = comparewithid),
                         color = "red", lwd = 0.7, alpha = 0.99 ) +
      geom_sii_riskconnection(data = sii_z_ex2_data,
                            mapping = ggplot2::aes(x = time, y = ratio, id = id, comparewithid = comparewithid ),
                            arrow = arrow(angle = 20, type = "closed" )
                            ) +
      ggplot2::theme_bw()


