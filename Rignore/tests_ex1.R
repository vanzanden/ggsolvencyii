## sii_z_example1_data ================================================== =====
##
## 1 dataregel, scr bevat allee leven en markt risicos
##
##
## basistest circle====================================================== =====
ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex1_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              )  ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

##  =max scr===================================================== =====
ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex1_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              ),
               maxscrvalue = .333
              ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


##  =schaling hor===================================================== =====
ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex1_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              ),
               scalingx = .01
  ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)



##  ==levelmax =2==================================================== =====
ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex1_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              ),
               levelmax = 2  ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

##  ==levelmax = 3 =color is part of aes=================================================== =====
ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex1_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            # ,color = description
                            ),
               levelmax = 3,
              color = "black"
              ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

##  ===levelmax = tabel =================================================== =====
ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex1_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              ),
               levelmax = sii_levelmax_sf16_993
  ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

## test square en vaste rotatie en description rotatie ================== =====

ggplot2::ggplot() +  #xlim(0,40) +# ylim(190,230)+
    geom_solvii(data = sii_z_ex1_data,
                  mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                                 ,fill = description
                                ,color = description
                              ),
                     rotationdescription = "l_lapse",
                     squared = TRUE,
                color = "black",
                lwd = 0.25

                 ) +
    theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

## test square en vaste rotatie en description rotatie ================== =====

ggplot2::ggplot() +  #xlim(0,40) +# ylim(190,230)+
    geom_solvii(data = sii_z_ex1_data,
                  mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                                 ,fill = description
                                ,color = description
                              ),
                      rotationdegrees = -10,
                     rotationdescription = "l_lapse",
                     squared = TRUE,
                color = "black",
                lwd = 0.25

                 ) +
    theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


## test alles ================== =====

ggplot2::ggplot() +  #xlim(0,40) +# ylim(190,230)+
    geom_solvii(data = sii_z_ex1_data,
                  mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                                 ,fill = description
                                ,color = description
                              ),
                  maxscrvalue = 53.333,
                   scalingx = 0.005,
                   scalingy = 0.005,
                    levelmax = sii_levelmax_sf16_995,
                      rotationdegrees = -10,
                     rotationdescription = "l_lapse",
                     squared = TRUE,
                # color = "green",
                lwd = 0.75
                 ) +
    theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

## vergelijk grootte van rond en square in een figuur =================== =====

ggplot2::ggplot() +
  geom_solvii(data = sii_z_ex1_data,
              mapping = ggplot2::aes(x = 10, y = 5 , id = id, value = value
                                     ,description = description
                                    ,fill = description
                                    ,color = description
                                    ),
              # color = NA
              lwd = .75
              ,alpha = 0.6
  ) +
  theme_bw()  +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng) +
  geom_solvii(data = sii_z_ex1_data,
              mapping = ggplot2::aes(x = 10, y = 5 , id = id, value = value
                                    ,description = description
                                    ,color = description
                                    ),
              fill = NA
              ,lwd = 0.7
              ,alpha = 1.0
  ) +
  geom_solvii(data = sii_z_ex1_data,
              mapping = ggplot2::aes(x = 10, y = 5 , id = id, value = value,
                            description = description
                            ,fill = description
                                        ),
              color = "black",
              lwd = .5,
              squared = TRUE,
              # rotationdegrees = 45,
              alpha = .4
   )

