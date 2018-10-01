


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




## test connection sec
ggplot2::ggplot() +
  geom_solviiconnection(data = sii_z_example3_data,
                        mapping = ggplot2::aes(x = time, y = ratio, id = id,  comparewithid = comparewithid )
                         , arrow = arrow(angle = 20, type = "closed" )
                         # color = "red",
                      # lwd = .5 #,
                     # outlinelevels = "VERWIJZING NAAR EEN TABEL"
  )



# test alles in een (testdata2)
    ggplot() +
     geom_solvii(data = sii_z_example2_data,
                 mapping = ggplot2::aes(x = time, y = ratio, id = id, value = value, description = description,
                               fill = description,color = description),
                               lwd = 0.5) +
                scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
                scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng) +
      geom_solviioutline(data = sii_z_example2_data,
                         mapping = ggplot2::aes(x = time, y = ratio, id = id, value = value,
                                       description = description, comparewithid = comparewithid),
                         color = "red", lwd = 0.7, alpha = 0.99 ) +
      geom_solviiconnection(data = sii_z_example2_data,
                            mapping = ggplot2::aes(x = time, y = ratio, id = id, comparewithid = comparewithid ),
                            arrow = arrow(angle = 20, type = "closed" )
                            ) +
      theme_bw()




    # test alles in een (sii_z_example3_data)
    ggplot2::ggplot() +
      geom_solvii(data = sii_z_example3_data,
                  mapping = ggplot2::aes(x = time,
                                y = ratio ,
                                id = id,
                                value = value,
                                description = description,
                                fill = description,
                                color = description),
                  # structuredf = sii_z_example3_structure,
                  # levelmax = sii_z_example3_levelmax,
                  # rotationdegrees = -45,
                  # rotationdescription = "life",
                  scalingx = 0.5,scalingy = 0.5,
                  lwd = 0.5)    +
                scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
                scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng) +
      geom_solviioutline(data = sii_z_example3_data,
                         mapping = aes(x = time,
                                       y = ratio ,
                                       id = id,
                                       value = value,
                                       description = description,
                                       comparewithid = comparewithid),
                         # structuredf = sii_z_example3_structure,
                         # levelmax = sii_z_example3_levelmax,
                         color = "red",
                         lwd = 1 ,
                         # rotationdegrees = -45,
                         # rotationdescription = "life",
                         alpha = 0.99,
                         scalingx = 0.5,scalingy = 0.5
                         # outlinedf = "VERWIJZING NAAR EEN TABEL"
      ) +
      theme_bw()    +
      geom_solviiconnection(data = sii_z_example3_data,
                            mapping = aes(x = time,
                                          y = ratio,
                                          id = id,
                                          comparewithid = comparewithid )
                            ,arrow = arrow(angle = 20,
                                             type = "closed" )
                            # color = "red",
                            # lwd = 0.5 #,
                            # outlinedf = "VERWIJZING NAAR EEN TABEL"
      )




# test alles in een (testdata2)
    ggplot2::ggplot() +
     geom_solvii(data = sii_z_example2_data,
                 mapping = ggplot2::aes(x = time,
                               y = ratio ,
                               id = id,
                               value = value,
                               description = description,
                               fill = description,color = description),
                               # structuredf = sii_z_example2_structure,
                                # rotationdegrees = -45,
                                # rotationdescription = "life",
                               squared = TRUE,
                               lwd = 0.5)    +
                scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
                scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng) +
      geom_solviioutline(data = sii_z_example2_data,
                         mapping = aes(x = time,
                                       y = ratio ,
                                       id = id,
                                       value = value,
                                       description = description,
                                       comparewithid = comparewithid),
                         # structuredf = sii_z_example2_structure,
                         color = "red",
                         lwd = 0.7 ,
                         # rotationdegrees = -45,# rotationdescription = "life",
                         squared = TRUE,
                         alpha = .99 # ,
                         # scalingx = 1.5# outlinedf = "VERWIJZING NAAR EEN TABEL"
                          ) +
      geom_solviiconnection(data = sii_z_example2_data,
                            mapping = aes(x = time,
                                          y = ratio,
                                          id = id,
                                          comparewithid = comparewithid )
                            , arrow = arrow(angle = 20, type = "closed" )
                            # color = "red",# lwd = 0.5 #,# outlinedf = "VERWIJZING NAAR EEN TABEL"
                              )    +
      theme_bw()






library(ggmap)

    map_data <- ggmap::get_map(location = c(3,50,8, 54), source = "stamen",  maptype = "watercolor")
      base_map_nederland2 <- ggmap::ggmap(map_data, extent = "device")
      base_map_nederland2


    base_map_nederland2 +
           # ggplot()+
      geom_solvii(data =# testdata2
                    sii_z_example6_data,
                    # exceldf[exceldf$id==1,]
                    #,
                  mapping = aes(x = lat, y = lon , id = id, value = value, description = description,
                                fill = description, color = description
                  ),
                  maxscrvalue = 87.4,
                  # scalingx =1.25,
                  # scalingy = 0.5,
                  # levelmax = 2,
                  # levelmax = levelmax_dev,
                  color = "black",
                  lwd = 0.05
                  ,scalingx = 0.45
                  , scalingy = 0.40
      )    +
      geom_solvii(
                  data = exceldf[exceldf$id != 1,],
                  mapping = aes(x = x, y = y , id = id, value = value, description=description,
                                fill = description, color = description
                  ),
                  # maxscrvalue = 53.333,
                  # scalingx =1.25,
                  # scalingy = 0.5,
                  # levelmax = 2,
                  # levelmax = levelmax_dev,
                  color = "black",
                  lwd = 0.05,
                  alpha = 0.6
                  ,scalingx = 0.45
                  , scalingy = 0.40
      ) +
      geom_solviioutline(data = exceldf
                         ,mapping = aes(x = x, y = y , id = id, value = value, description = description, comparewithid = comparewithid)
                         ,color = "red"
                         ,lwd = 0.2
                         # alpha = 0.25 # ,
                         ,scalingx = 0.45
                         , scalingy = 0.40
                         # outlinelevels = "VERWIJZING NAAR EEN TABEL"
      ) +
      theme_bw() +
      scale_fill_manual(name = "Componenten",values = fillcolors_sf_eng) +
      scale_color_manual(name = "Componenten",values = colorcolors_sf_eng)
