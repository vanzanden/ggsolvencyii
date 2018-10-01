## sii_z_example2_data ================================================== =====
##
## 3 dataregel, 1 EN 2E scr bevat alle leven en markt risicos
## de derde regel ook nonlife en health
##
##
## basistest, tonen resultaten
 ggplot2::ggplot() +
  geom_solvii(data = sii_z_example2_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                             lwd = 0.05
               ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

## groeperen van resultaten


 ggplot2::ggplot() +
  geom_solvii(data = sii_z_example2_data,
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
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)



 ggplot2::ggplot() +
  geom_solvii(data = sii_z_example2_data,
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
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)



sii_debug(data_descr = sii_z_example2_data$description, structure = sii_structure_sf16_eng,levelmax = sii_levelmax_sf16_995,outline = sii_outline_sf16_eng,fillcolor = sii_x_fillcolors_sf16_eng
        ,edgecolor = sii_x_edgecolors_sf16_eng, aggregatesuffix = "_test"  )

sii_debug(data_descr = sii_z_example2_data$description, structure = sii_structure_sf16_eng,levelmax = sii_levelmax_sf16_995,outline = sii_outline_sf16_eng,fillcolor = sii_x_fillcolors_sf16_eng
        ,edgecolor = sii_x_edgecolors_sf16_eng, aggregatesuffix = "_other"  )




##  !!!  WAAR IS MARKET_OTHER gebleven ?


## test outline sec (basis outline table)
ggplot() +
  geom_solviioutline(data = sii_z_example2_data,
                     mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                                   description = description, comparewithid = comparewithid),
                     color = "red",
                     # rotationdegrees = -45,
                     # rotationdescription = "life",
                     lwd = .5 #,
  )


## test outline sec (basis outline table)
ggplot2::ggplot() +
  geom_solviioutline(data = sii_z_example2_data,
                     mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                                            description = description, comparewithid = comparewithid),
                     color = "red",
                     # rotationdegrees = -45,
                     # rotationdescription = "life",
                     squared =  TRUE,
                     lwd = .5 #,
  )



 ## test outline sec ( outline table sii_z_example4_outline)
ggplot2::ggplot() +
  geom_solviioutline(data = sii_z_example2_data,
                     mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                                   description = description, comparewithid = comparewithid),
                     color = "red",
                     lwd = .5 ,
                     # rotationdegrees = -45,
                     # rotationdescription = "life",
                     outlinedf = sii_z_example4_outline
  )




## test outline sec ( outline table sii_z_example4_outline)
ggplot2::ggplot() +
  geom_solviioutline(data = sii_z_example2_data,
                     mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                                   description = description, comparewithid = comparewithid),
                     color = "red",
                     lwd = .5 ,
                     rotationdegrees = -8,
                     squared =  TRUE,
                     rotationdescription = "life",
                     outlinedf = sii_z_example4_outline
  )


