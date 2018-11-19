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
## about indenting ====================================================== =====
## four spaces indending is datasetting, preparation or cleaning up
## no indenting is the actual test
##
## test ================================================================= =====
    testdata <- sii_z_ex2_data

    testparams <- NULL
    testparams$structure <- sii_structure_sf16_eng
    testparams$levelmax <- sii_levelmax_sf16_993
    testparams$aggregatesuffix <- "_other"

test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result

test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;test_result

    rm(testparams); rm(testdata); rm(test_result)

## sii_z_example2_data ================================================== =====
##
## 1 dataregel, scr bevat allee leven en markt risicos
##
##
## basistest circle, no plotdetails ===================================== =====
ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description

              )  )

## basistest circle, legends ok === ===================================== =====
ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description

              )  ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten", values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten", values = sii_x_edgecolors_sf16_eng)


## basistest circle=, with plotdetails table ============================ =====
ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description

              ),
              plotdetails = sii_plotdetails_sf16  ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

##  =max scr===================================================== =====
ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              ),
               maxscrvalue = .00333
              ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


##  =schaling hor===================================================== =====
ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              ),
               scalingx = .01
  ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)



##  ==levelmax =2==================================================== =====
ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              ),
               levelmax = 2  ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

##  ==levelmax = 3 ,color is part of aes=================================================== =====
ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            # ,color = description
                            ),
               levelmax = 3,
              color = "black"
              ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

##  ===levelmax = tabel 993 ============================================= =====
ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              ),
               levelmax = sii_levelmax_sf16_993
  ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


##  ===levelmax = tabel 995============================================== =====
ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              ),
               levelmax = sii_levelmax_sf16_995
  ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)



## test square and description rotation ================================== =====

ggplot2::ggplot() +  #xlim(0,40) +# ylim(190,230)+
    geom_sii_risksurface(data = sii_z_ex2_data,
                  mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                                 ,fill = description
                              ),
                     rotationdescription = "l_lapse",
                     squared = TRUE,
                color = "black",
                lwd = 0.25

                 ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

## test square, fixed rotation and description rotation ================== =====

ggplot2::ggplot() +  #xlim(0,40) +# ylim(190,230)+
    geom_sii_risksurface(data = sii_z_ex2_data,
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
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


## test description rotatie on an "other" item ================== =====

ggplot2::ggplot() +  #xlim(0,40) +# ylim(190,230)+
    geom_sii_risksurface(data = sii_z_ex2_data,
                  mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                                 ,fill = description
                                ,color = description
                              ),
                     squared = TRUE,
                     levelmax = sii_levelmax_sf16_995,
                     rotationdescription = "market_other",
                color = "black",
                lwd = 0.25
                 ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)




## test alles ================== =====

ggplot2::ggplot() +  #xlim(0,40) +# ylim(190,230)+
    geom_sii_risksurface(data = sii_z_ex2_data,
                  mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                                 ,fill = description
                                ,color = description
                              ),
                  maxscrvalue = 53.333,
                   scalingx = 10.0,
                   scalingy = 0.005,
                    levelmax = sii_levelmax_sf16_995,
                      rotationdegrees = -90,
                     rotationdescription = "life_other",
                     squared = TRUE,
                # color = "green",
                lwd = 0.75
                 ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

## vergelijk grootte van rond en square in een figuur =================== =====

ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = 10, y = 5 , id = id, value = value
                                     ,description = description
                                    ,fill = description
                                    ,color = description
                                    ),
              # color = NA
              lwd = .75
              ,alpha = 0.6
  ) +
  ggplot2::theme_bw()  +
  ggplot2::scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng) +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = 10, y = 5 , id = id, value = value,
                            description = description
                            ,fill = description
                                        ),
              color = "black",
              lwd = .5,
              squared = TRUE,
              # rotationdegrees = 45,
              alpha = .2
   )

## outline (no 'compareid'-column is present in data , is equal to the situation that raw data has the column but no mapping has been mede in 'geom_'-call)
## no comparewithid in the mapping
  ggplot2::ggplot() +  #xlim(0,40) +# ylim(190,230)+
    geom_sii_riskoutline(data = sii_z_ex2_data,
                  mapping = ggplot2::aes(x = time, y = ratio , id = id,
                                         value = value, description = description)
                 ) +
  ggplot2::theme_bw()

##  comparewithid in the mapping, refering to id. i.e. "self"

  ggplot2::ggplot() +  #xlim(0,40) +# ylim(190,230)+
    geom_sii_riskoutline(data = sii_z_ex2_data,
                  mapping = ggplot2::aes(x = time, y = ratio , id = id,
                                         value = value, description = description
                                        ,comparewithid = id)
                 ) +
  ggplot2::theme_bw()


  ## will throw error plus warning about this error
  ggplot2::ggplot() +  #xlim(0,40) +# ylim(190,230)+
    geom_sii_riskoutline(data = sii_z_ex2_data,
                  mapping = ggplot2::aes(x = time, y = ratio , id = id,
                                         value = value, description = description
                                        ,comparewithid = 2)
                 ) +
  ggplot2::theme_bw()


## basistest circle, tocenter = TRUE  =================================== =====
ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description

              ) , tocenter = FALSE ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten", values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten", values = sii_x_edgecolors_sf16_eng)


## basistest circle, tocenter = TRUE  =================================== =====
ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description

              ) , tocenter = TRUE ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Componenten", values = sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Componenten", values = sii_x_edgecolors_sf16_eng)

