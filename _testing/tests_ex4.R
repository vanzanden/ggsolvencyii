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


    testdata <- sii_z_ex4_data

    testparams <- NULL
    testparams$structuredf <- sii_structure_sf16_eng
    testparams$levelmax <- sii_levelmax_sf16_993
    testparams$aggregatesuffix <- "_other"


sii_debug(data_descr = testdata$description,
          structure = testparams$structuredf,
          levelmax = testparams$levelmax
)



sii_debug(data_descr = testdata$description,
          structure = testparams$structuredf,
          levelmax = testparams$levelmax
)



## test of a compact dataset in a compact structure
    testdata <- sii_z_ex4_data[sii_z_ex4_data$id == 1, ]

    testparams <- NULL
    testparams$structuredf <- sii_z_ex4_structure # sii_z_ex_structure
    testparams$levelmax <- 99 # sii_levelmax_995 # sii_z_ex_levelmax
    testparams$aggregatesuffix <- "_other"
    testparams$plotdetails <- NULL

    testmaxscrvalue = NULL # 100
    testscalingx = 1 # 0.02
    testscalingy = 1 # 0.02
    testrotationdegrees = NULL # 10 # -10 # 70
    testrotationdescription = NULL # operational #  life # l_longevity # h_s_longevity
    testsquared = FALSE # TRUE

sii_debug(data_descr = testdata$description,
                                    structure = testparams$structuredf,
                                    aggregatesuffix = testparams$aggregatesuffix,
                                    levelmax = testparams$levelmax
                          )

test_result <- ggsolvencyii:::fn_structure_expansion(testparams) ; test_result

test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;

ggplot2::ggplot() +
                          ggsolvencyii::geom_sii_risksurface(data = testdata,
                                                    mapping = ggplot2::aes(
    x = time,
    y = ratio,
    value = value,
                                                    id = id,  description = description,
                                                    fill = description, color = description),
    lwd = 0.5,
                              structuredf = testparams$structuredf,
                              levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                              maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,
                              rotationdegrees = testrotationdegrees, rotationdescription = testrotationdescription,
                              squared = testsquared,
                              plotdetails = NULL
                          ) +
                          ggplot2::theme_bw() +
                          ggplot2::scale_fill_manual(name = "Componenten", values = ggsolvencyii::sii_x_fillcolors_sf16_eng
                          ) +
                          ggplot2::scale_color_manual(name = "Componenten", values = ggsolvencyii::sii_x_edgecolors_sf16_eng
                          )

## test of a compact dataset in a full structure, geen levelmax meegegeven

ggplot2::ggplot() +
                          ggsolvencyii::geom_sii_risksurface(data = testdata,
                                                    mapping = ggplot2::aes(
    x = time,
    y = ratio,
    value = value,
                                                    id = id,  description = description,
                                                    fill = description, color = description),
    lwd = 0.5,
                              structuredf = testparams$structuredf,
                              levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                              maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,
                              rotationdegrees = testrotationdegrees, rotationdescription = testrotationdescription,
                              squared = testsquared,
                              plotdetails = NULL
                          ) +
                          ggplot2::theme_bw() +
                          ggplot2::scale_fill_manual(name = "Componenten", values = ggsolvencyii::sii_x_fillcolors_sf16_eng
                          ) +
                          ggplot2::scale_color_manual(name = "Componenten", values = ggsolvencyii::sii_x_edgecolors_sf16_eng
                          )

## test of a compact dataset in a full structure (levelmax = 95)

ggplot2::ggplot() +
                          ggsolvencyii::geom_sii_risksurface(data = testdata,
                                                    mapping = ggplot2::aes(
    x = time,
    y = ratio,
    value = value,
                                                    id = id,  description = description,
                                                    fill = description, color = description),
    lwd = 0.5,
                              structuredf = testparams$structuredf,
                              levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                              maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,
                              rotationdegrees = testrotationdegrees, rotationdescription = testrotationdescription,
                              squared = testsquared,
                              plotdetails = NULL
                          ) +
                          ggplot2::theme_bw() +
                          ggplot2::scale_fill_manual(name = "Componenten", values = ggsolvencyii::sii_x_fillcolors_sf16_eng
                          ) +
                          ggplot2::scale_color_manual(name = "Componenten", values = ggsolvencyii::sii_x_edgecolors_sf16_eng
                          )

## test of a compact dataset in a full structure, levelmax = sii_z_ex4_levelmax (98,97,96 for level 1, 2.01, 3)



ggplot2::ggplot() +
                          ggsolvencyii::geom_sii_risksurface(data = testdata,
                                                    mapping = ggplot2::aes(
    x = time,
    y = ratio,
    value = value,
                                                    id = id,  description = description,
                                                    fill = description, color = description),
    lwd = 0.5,
                              structuredf = testparams$structuredf,
                              levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                              maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,
                              rotationdegrees = testrotationdegrees, rotationdescription = testrotationdescription,
                              squared = testsquared,
                              plotdetails = NULL
                          ) +
                          ggplot2::theme_bw() +
                          ggplot2::scale_fill_manual(name = "Componenten", values = ggsolvencyii::sii_x_fillcolors_sf16_eng
                          ) +
                          ggplot2::scale_color_manual(name = "Componenten", values = ggsolvencyii::sii_x_edgecolors_sf16_eng
                          )
## cleanup ============================================================== =====
rm(testparams) ; rm(testdata) ;rm(test_result); rm(testmaxscrvalue); rm(testrotationdegrees);rm(testrotationdescription); rm(testscalingx); rm(testscalingy); rm(testsquared)
## ====================================================================== =====


