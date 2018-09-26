# rm(list=ls())  ## vanwege handwerk_basis



fillcolors_sf_eng <- c("SCR"                         ="#1f78b4", #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
                          "BSCR"                     ="#48b0eb", #scr +282828
                          "operational"              ="#70d8ff", #bscr +282828
                              "market"               ="#d95f02", #http://colorbrewer2.org/?type=qualitative&scheme=Dark2&n=7
                              "health"               ="#4a1486", #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                              "life"                 ="#33a02c", #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
                              "nonlife"              ="#b2df8a",   #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
                              "cp-default"           ="#fb9a99",   #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
                              "intangibles"          ="#fdbf6f",   #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
                                  "m_interestrate"   ="#990000", #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                  "m_equity"         ="#d7301f",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                  "m_property"       ="#ef6548",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                  "m_spread"         ="#fc8d59",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                  "m_currency"       ="#fdbb84",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                  "m_concentration"  ="#fdd49e",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                  "m_illiquidity"    ="#fef0d9",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                      "market_other" ="#d95f02", #= market
                                  "h_CAT"            ="#cb181d", #http://colorbrewer2.org/?type=sequential&scheme=Reds&n=8
                                  "h_n_premiumres"   ="#fc9272",    #http://colorbrewer2.org/?type=sequential&scheme=Reds&n=8
                                  "h_n_lapse"        ="#fee0d2",    #http://colorbrewer2.org/?type=sequential&scheme=Reds&n=8
                                  "h_SLT"            ="#6a51a3", #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                  "h_s_mortality"    ="#dadaeb",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                  "h_s_longevity"    ="#9e9ac8",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                  "h_s_disability"   ="#bcbddc",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                  "h_s_lapse"        ="#dadaeb",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                  "h_s_expenses"     ="#efedf5",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                  "h_s_revision"     ="#fcfbfd",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                      "h_s_other"    ="#6a51a3",# = h_slt
                                  "l_mortality"      ="#005a32",
                                  "l_longevity"      ="#238b45",
                                  "l_disability"     ="#41ab5d",
                                  "l_lapse"          ="#74c476",
                                  "l_expenses"       ="#a1d99b",
                                  "l_revision"       ="#c7e9c0",
                                  "l_CAT"            ="#edf8e9",
                                      "life_other"   ="#33a02c", #=life
                                  "n_premiumreserve" ="#000000",
                                  "n_lapse"          ="#000000",
                                  "n_CAT"            ="#000000",
                                      "non-life_other"   ="#66a61e" #=nonlife
                      )

colorcolors_sf_eng <- c("SCR"                         ="#000000",
                        "BSCR"                     ="#1f78b4",
                        "operational"              ="#1f78b4",
                        "market"               ="#48b0eb",
                        "health"               ="#48b0eb",
                        "life"                 ="#48b0eb",
                        "nonlife"              ="#48b0eb",
                        "cp-default"           ="#48b0eb",
                        "intangibles"          ="#48b0eb",
                        "m_interestrate"   ="#d95f02",
                        "m_equity"         ="#d95f02",
                        "m_property"       ="#d95f02",
                        "m_spread"         ="#d95f02",
                        "m_currency"       ="#d95f02",
                        "m_concentration"  ="#d95f02",
                        "m_illiquidity"    ="#d95f02",
                        "market_other" ="#d95f02" ,
                        "h_CAT"            ="#4a1486",
                        "h_n_premiumres"   ="#4a1486",
                        "h_n_lapse"        ="#4a1486",
                        "h_SLT"            ="#4a1486",
                        "h_s_mortality"    ="#6a51a3",
                        "h_s_longevity"    ="#6a51a3",
                        "h_s_disability"   ="#6a51a3",
                        "h_s_lapse"        ="#6a51a3",
                        "h_s_expenses"     ="#6a51a3",
                        "h_s_revision"     ="#6a51a3",
                        "h_s_other"    ="#6a51a3",
                        "l_mortality"      ="#33a02c",
                        "l_longevity"      ="#33a02c",
                        "l_disability"     ="#33a02c",
                        "l_lapse"          ="#33a02c",
                        "l_expenses"       ="#33a02c",
                        "l_revision"       ="#33a02c",
                        "l_CAT"            ="#33a02c",
                        "life_other"        ="#33a02c",
                        "n_premiumreserve" ="#b2df8a",
                        "n_lapse"          ="#b2df8a",
                        "n_CAT"            ="#b2df8a",
                        "non-life_other"   ="#b2df8a"
                        )



  #################################
ggplot2::ggplot() +  #xlim(0,40) +# ylim(190,230)+
  geom_solvii(data = sii_z_example1_data,
              mapping = aes(x=time, y=ratio , id = id, value = value, description=description
                            ,fill = description
                            , color = description
              ),
              # maxscrvalue = 53.333,
              # levelonedescription = "BKR",
              # scalingx =1.25,
              # scalingy = .5,
              # levelmax = 2,
              levelmax = 3,
               # levelmax = 5,
              # levelmax = 7,
              # levelmax = 99,
              # levelmax = sii_levelmax_sf16_995,
              # levelmax = testlevelmax,
              # rotationdegrees = -45,
              # rotationdescription = "life",
              # squared = TRUE,
              # color = "black",
              lwd = 0.25
              # ,scalingx = .5
              # , scalingy=.5
  )+
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = fillcolors_sf_eng ) +
  scale_color_manual(name = "Componenten",values = colorcolors_sf_eng  )



ggplot2::ggplot() +  #xlim(0,40) +# ylim(190,230)+
    geom_solvii(data = sii_z_example1_data,
                  mapping = aes(x=time, y=ratio , id = id, value = value, description=description
                                 ,fill = description
                                , color = description
                              ),
                  maxscrvalue = 53.333,
                  # levelonedescription = "BKR",
                  scalingx =1.25,
                  scalingy = .5,
                    # levelmax = 2,
                    levelmax = 3,
                    # levelmax = 5,
                    # levelmax = 7,
                    # levelmax = 99,
                    # levelmax = sii_levelmax_sf16_995,
                    # levelmax = testlevelmax,
                     rotationdegrees = -32,
                     rotationdescription = "life",
                     squared = TRUE,
                color = "black",
                lwd = 0.25
                # ,scalingx = .5
                # , scalingy=.5
                 )+
    theme_bw() +
    scale_fill_manual(name = "Componenten",values = fillcolors_sf_eng ) +
    scale_color_manual(name = "Componenten",values = colorcolors_sf_eng  )





 ggplot2::ggplot() +  #xlim(0,40) +# ylim(190,230)+
  geom_solvii(data = sii_z_example2_data,
               mapping = aes(x=time, y=ratio , id = id, value = value, description=description,
                             fill = description, color = description
                             ),
                              # maxscrvalue = 53.333,
                             # levelonedescription = "BKR",
                             # levelmax = 4,
                             # levelmax = sii_levelmax_sf16_993,
                             # color = "black",
                              # scalingx = .2,
                             # , scalingy=.5,
                             rotationdegrees = -90,
                             squared = TRUE  ,
                             # rotationdescription = "life",
                             rotationdescription = "l_longevity",
                             lwd = 0.05
               )+
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = fillcolors_sf_eng ) +
 scale_color_manual(name = "Componenten",values = colorcolors_sf_eng  )





## test outline sec (basis outline table)
ggplot2::ggplot() +
  geom_solviioutline(data = sii_z_example2_data,
                     mapping = aes(x=time, y=ratio , id = id, value = value, description=description, comparewithid = comparewithid),
                     color = "red",
                     # rotationdegrees = -45,
                     # rotationdescription = "life",
                     lwd = .5 #,
  )


## test outline sec (basis outline table)
ggplot2::ggplot() +
  geom_solviioutline(data = sii_z_example2_data,
                     mapping = aes(x=time, y=ratio , id = id, value = value, description=description, comparewithid = comparewithid),
                     color = "red",
                     # rotationdegrees = -45,
                     # rotationdescription = "life",
                     squared =  TRUE,
                     lwd = .5 #,
  )



 ## test outline sec ( outline table sii_outline_sf16_exceptions)
ggplot2::ggplot() +
  geom_solviioutline(data = sii_z_example2_data,
                     mapping = aes(x=time, y=ratio , id = id, value = value, description=description, comparewithid = comparewithid),
                     color = "red",
                     lwd = .5 ,
                     # rotationdegrees = -45,
                     # rotationdescription = "life",
                     outlinedf = sii_z_example4_outline_exceptions
  )




## test outline sec ( outline table sii_outline_sf16_exceptions)
ggplot2::ggplot() +
  geom_solviioutline(data = sii_z_example2_data,
                     mapping = aes(x=time, y=ratio , id = id, value = value, description=description, comparewithid = comparewithid),
                     color = "red",
                     lwd = .5 ,
                     # rotationdegrees = -45,
                     squared =  TRUE,
                     # rotationdescription = "life",
                     outlinedf = sii_z_example4_outline_exceptions
  )




## test connection sec
ggplot2::ggplot() +
  geom_solviiconnection(data = sii_z_example2_data,
                        mapping = aes(x=time, y=ratio, id = id,  comparewithid = comparewithid )
                         , arrow = arrow (angle=20, type = "closed" )
                         # color = "red",
                      # lwd = .5 #,
                     # outlinelevels = "VERWIJZING NAAR EEN TABEL"
  )



# test alles in een (testdata2)
    ggplot2::ggplot() +
     geom_solvii(data= sii_z_example2_data,
                 mapping = aes(x=time,
                               y=ratio ,
                               id = id,
                               value = value,
                               description=description,
                               fill = description,color = description),
                               # structuredf = sii_z_example2_structure,
                                # rotationdegrees = -45,
                                # rotationdescription = "life",
                               squared = TRUE,
                               lwd=.5)    +
      scale_fill_manual(name = "Componenten",values = fillcolors_sf_eng ) +
      scale_color_manual(name = "Componenten",values = colorcolors_sf_eng  ) +
      geom_solviioutline(data= sii_z_example2_data,
                         mapping = aes(x=time,
                                       y=ratio ,
                                       id = id,
                                       value = value,
                                       description=description,
                                       comparewithid=comparewithid),
                         # structuredf = sii_z_example2_structure,
                         color = "red",
                         lwd = .7 ,
                         # rotationdegrees = -45,# rotationdescription = "life",
                         squared = TRUE,
                         alpha = .99 # ,
                         # scalingx = 1.5# outlinedf = "VERWIJZING NAAR EEN TABEL"
                          ) +
      geom_solviiconnection(data = sii_z_example2_data,
                            mapping = aes(x=time,
                                          y=ratio,
                                          id = id,
                                          comparewithid = comparewithid )
                            , arrow = arrow (angle=20, type = "closed" )
                            # color = "red",# lwd = .5 #,# outlinedf = "VERWIJZING NAAR EEN TABEL"
                              )    + theme_bw()



    # test alles in een (sii_z_example3_data)
    ggplot2::ggplot() +
      geom_solvii(data= sii_z_example3_data,
                  mapping = aes(x=time,
                                y=ratio ,
                                id = id,
                                value = value,
                                description=description,
                                fill = description,
                                color = description),
                  # structuredf = sii_z_example3_structure,
                  # levelmax = sii_z_example3_levelmax,
                  # rotationdegrees = -45,
                  # rotationdescription = "life",
                  scalingx=.5,scalingy =0.5,
                  lwd=.5)    +
      scale_fill_manual(name = "Componenten",values = fillcolors_sf_eng ) +
      scale_color_manual(name = "Componenten",values = colorcolors_sf_eng  ) +
      geom_solviioutline(data= sii_z_example3_data,
                         mapping = aes(x=time,
                                       y=ratio ,
                                       id = id,
                                       value = value,
                                       description=description,
                                       comparewithid=comparewithid),
                         # structuredf = sii_z_example3_structure,
                         # levelmax = sii_z_example3_levelmax,
                         color = "red",
                         lwd = 1 ,
                         # rotationdegrees = -45,
                         # rotationdescription = "life",
                         alpha = .99  ,
                         scalingx=.5,scalingy =0.5
                         # outlinedf = "VERWIJZING NAAR EEN TABEL"
      ) +
      theme_bw()    +
      geom_solviiconnection(data = sii_z_example3_data,
                            mapping = aes(x=time,
                                          y=ratio,
                                          id = id,
                                          comparewithid = comparewithid )
                            , arrow = arrow (angle=20,
                                             type = "closed" )
                            # color = "red",
                            # lwd = .5 #,
                            # outlinedf = "VERWIJZING NAAR EEN TABEL"
      )


library(ggmap)

    longBL <- as.integer(3)
    latBL <-  as.integer(50)
    longTR <- as.integer(8)
    latTR <-  as.integer(54 )## 8 != 7:  IkePoint a little above the middle of vertical scale of the map

    map_data <- ggmap::get_map(location= c(longBL,latBL,longTR, latTR), source ="stamen",  maptype ="watercolor")
      base_map_nederland2 <- ggmap::ggmap(map_data, extent = "device")
      base_map_nederland2


    base_map_nederland2 +
           # ggplot()+
      geom_solvii(data =# testdata2
                    sii_z_example1_data,
                    # exceldf[exceldf$id==1,]
                    #,
                  mapping = aes(x=lat, y=lon , id = id, value = value, description=description,
                                fill = description, color = description
                  ),
                  maxscrvalue = 87.4,
                  # scalingx =1.25,
                  # scalingy = .5,
                  # levelmax = 2,
                  # levelmax = levelmax_dev,
                  color = "black",
                  lwd = 0.05
                  ,scalingx = .45
                  , scalingy=.40
      )

    +
      geom_solvii(
                  data = exceldf[exceldf$id != 1,],
                  mapping = aes(x=x, y=y , id = id, value = value, description=description,
                                fill = description, color = description
                  ),
                  # maxscrvalue = 53.333,
                  # scalingx =1.25,
                  # scalingy = .5,
                  # levelmax = 2,
                  # levelmax = levelmax_dev,
                  color = "black",
                  lwd = 0.05,
                  alpha = .6
                  ,scalingx = .45
                  , scalingy=.40
      )+
      geom_solviioutline(data = exceldf
                         ,mapping = aes(x=x, y=y , id = id, value = value, description=description, comparewithid=comparewithid)
                         ,color = "red"
                         ,lwd = .2
                         # alpha = .25 # ,
                         ,scalingx = .45
                         , scalingy=.40
                         # outlinelevels = "VERWIJZING NAAR EEN TABEL"
      ) +
      theme_bw() +
      scale_fill_manual(name = "Componenten",values = fillcolors_sf_eng ) +
      scale_color_manual(name = "Componenten",values = colorcolors_sf_eng  )
