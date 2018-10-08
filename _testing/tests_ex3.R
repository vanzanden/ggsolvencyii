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
        testdata <- sii_z_ex3_data

        testparams <- NULL
        testparams$structuredf <- sii_structure_sf16_eng # sii_z_ex_structure
        testparams$levelmax <- 99 # sii_levelmax_995 # sii_z_ex_levelmax
        testparams$aggregatesuffix <- "_other"

sii_debug(data_descr = testdata$description, structure = testparams$structuredf, aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)

test_result <- ggsolvencyii:::fn_structure_expansion(testparams) ; test_result

test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;

rm(testdata); rm(testparams); rm(test_result)

## test setup ================================================================= =====
        testdata <- sii_z_ex3_data

        testparams <- NULL
        testparams$structuredf <- sii_structure_sf16_eng # sii_z_ex_structure
        testparams$levelmax <- 99 # sii_levelmax_995 # sii_z_ex_levelmax
        testparams$aggregatesuffix <- "_other"
        testparams$plotdetails <-  NULL

        testmaxscrvalue = NULL # 100
        testscalingx = 1 # 0.02
        testscalingy = 1 # 0.02
        testrotationdegrees = NULL # 10 # -10 # 70
        testrotationdescription = NULL # operational #  life # l_longevity # h_s_longevity
        testsquared = FALSE # TRUE

## plain vanilla plot
ggplot2::ggplot() + ggsolvencyii::geom_sii_risksurface(data = testdata, mapping = ggplot2::aes(
        x = time,
        y = ratio,
        value = value,  id = id, description = description, fill = description, color = description),
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,plotdetails = testparams$plotdetails) +
  ggplot2::theme_bw() + ggplot2::scale_fill_manual(name = "Comp", values = ggsolvencyii::sii_x_fillcolors_sf16_eng) +
                      ggplot2::scale_color_manual(name = "Comp", values = ggsolvencyii::sii_x_edgecolors_sf16_eng) +
  ggsolvencyii::geom_sii_riskoutline(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,
        value = value,  id = id, description = description), color = "red", lwd = 0.7, alpha = 0.99,
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared, plotdetails = testparams$plotdetails) +
  ggsolvencyii::geom_sii_riskconnection(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,      id = id), arrow = ggplot2::arrow(angle = 20, type = "closed" )
                          )

## test  and plotdetails 3 where only 'o'levels are plotted in surface but since there is no grouping, nothing is plotted========== =====
testparams$plotdetails <-  sii_z_ex3_plotdetails

ggplot2::ggplot() + ggsolvencyii::geom_sii_risksurface(data = testdata, mapping = ggplot2::aes(
        x = time,
        y = ratio,
        value = value,  id = id, description = description, fill = description, color = description),
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,plotdetails = testparams$plotdetails) +
  ggplot2::theme_bw() + ggplot2::scale_fill_manual(name = "Comp", values = ggsolvencyii::sii_x_fillcolors_sf16_eng) +
                      ggplot2::scale_color_manual(name = "Comp", values = ggsolvencyii::sii_x_edgecolors_sf16_eng) +
  ggsolvencyii::geom_sii_riskoutline(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,
        value = value,  id = id, description = description), color = "red", lwd = 0.7, alpha = 0.99,
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared, plotdetails = testparams$plotdetails) +
  ggsolvencyii::geom_sii_riskconnection(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,      id = id), arrow = ggplot2::arrow(angle = 20, type = "closed" ))



## test ===missing pieces door combin levelmax and plotdetails 3 where only 'o'levels are plotted =====
testparams$levelmax = sii_levelmax_sf16_995

ggplot2::ggplot() + ggsolvencyii::geom_sii_risksurface(data = testdata, mapping = ggplot2::aes(
        x = time,
        y = ratio,
        value = value,  id = id, description = description, fill = description, color = description),
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,plotdetails = testparams$plotdetails) +
  ggplot2::theme_bw() + ggplot2::scale_fill_manual(name = "Comp", values = ggsolvencyii::sii_x_fillcolors_sf16_eng) +
                      ggplot2::scale_color_manual(name = "Comp", values = ggsolvencyii::sii_x_edgecolors_sf16_eng) +
  ggsolvencyii::geom_sii_riskoutline(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,
        value = value,  id = id, description = description), color = "red", lwd = 0.7, alpha = 0.99,
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared, plotdetails = testparams$plotdetails) +
  ggsolvencyii::geom_sii_riskconnection(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,      id = id), arrow = ggplot2::arrow(angle = 20, type = "closed" ))

## less groups, so o-level is larger,
testparams$levelmax = sii_levelmax_sf16_993

ggplot2::ggplot() + ggsolvencyii::geom_sii_risksurface(data = testdata, mapping = ggplot2::aes(
        x = time,
        y = ratio,
        value = value,  id = id, description = description, fill = description, color = description),
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,plotdetails = testparams$plotdetails) +
  ggplot2::theme_bw() + ggplot2::scale_fill_manual(name = "Comp", values = ggsolvencyii::sii_x_fillcolors_sf16_eng) +
                      ggplot2::scale_color_manual(name = "Comp", values = ggsolvencyii::sii_x_edgecolors_sf16_eng) +
  ggsolvencyii::geom_sii_riskoutline(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,
        value = value,  id = id, description = description), color = "red", lwd = 0.7, alpha = 0.99,
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared, plotdetails = testparams$plotdetails) +
  ggsolvencyii::geom_sii_riskconnection(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,      id = id), arrow = ggplot2::arrow(angle = 20, type = "closed" ))




## test ===self reference =====
testparams$levelmax = 99
testparams$plotdetails <- NULL

ggplot2::ggplot() + ggsolvencyii::geom_sii_risksurface(data = testdata, mapping = ggplot2::aes(
        x = time,
        y = ratio,
        value = value,  id = id, description = description, fill = description, color = description),
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,plotdetails = testparams$plotdetails) +
  ggplot2::theme_bw() + ggplot2::scale_fill_manual(name = "Comp", values = ggsolvencyii::sii_x_fillcolors_sf16_eng) +
                      ggplot2::scale_color_manual(name = "Comp", values = ggsolvencyii::sii_x_edgecolors_sf16_eng) +
  ggsolvencyii::geom_sii_riskoutline(data = testdata, mapping = ggplot2::aes(
        # comparewithid = comparewithid,
        x = time,
        y = ratio,
        value = value,  id = id, description = description), color = "red", lwd = 0.7, alpha = 0.99,
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared, plotdetails = testparams$plotdetails)
# +
#   ggsolvencyii::geom_sii_riskconnection(data = testdata, mapping = ggplot2::aes(
#         comparewithid = comparewithid,
#         x = time,
#         y = ratio,      id = id), arrow = ggplot2::arrow(angle = 20, type = "closed" ))



## cleanup ============================================================== =====
rm(testparams) ; rm(testdata) ;rm(test_result); rm(testmaxscrvalue); rm(testrotationdegrees);rm(testrotationdescription); rm(testscalingx); rm(testscalingy); rm(testsquared)
## ====================================================================== =====
