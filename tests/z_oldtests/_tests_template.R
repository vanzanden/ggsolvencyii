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
    testparams <- NULL
    testparams$structure <- sii_z_ex1_structure
    testparams$fillcolors <- sii_z_ex1_fillcolors
    testparams$edgecolors <- sii_z_ex1_edgecolors
    testparams$plotdetails <- sii_z_ex1_plotdetails
    testparams$levelmax <- sii_z_ex1_levelmax
    testparams$aggregatesuffix <- "_other"

sii_debug_geom(data_descr = testdata$description, structure = testparams$structure, aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax, plotdetails = testparams$plotdetails,fillcolors = testparams$fillcolors, edgecolors = testparams$edgecolors)

test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result

test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;test_result

    rm(testparams); rm(testdata); rm(test_result)
# test ========================================================= =====
        testdata <- sii_z_ex_data

        testparams <- NULL
        testparams$structure <- sii_structure_sf16_eng # sii_z_ex_structure
        testparams$levelmax <- 99 # sii_levelmax_995 # sii_z_ex_levelmax
        testparams$aggregatesuffix <- "_other"

sii_debug_geom(data_descr = testdata$description, structure = testparams$structure, aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)

test_result <- ggsolvencyii:::fn_structure_expansion(testparams) ; test_result

test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;

 rm(testdata); rm(testparams); rm(test_result)
# test ========================================================= =====
        testdata <- sii_z_ex3_data

        testparams <- NULL
        testparams$structure <- sii_structure_sf16_eng # sii_z_ex_structure
        testparams$levelmax <- 99 # sii_levelmax_995 # sii_z_ex_levelmax
        testparams$aggregatesuffix <- "_other"
        testparams$plotdetails <-  NULL

        testmaxscrvalue = NULL # 100
        testscalingx = 1 # 0.02
        testscalingy = 1 # 0.02
        testrotationdegrees = NULL # 10 # -10 # 70
        testrotationdescription = NULL # operational #  life # l_longevity # h_s_longevity
        testsquared = FALSE # TRUE


ggplot2::ggplot() + ggsolvencyii::geom_sii_risksurface(data = testdata, mapping = ggplot2::aes(
        x = time,
        y = ratio,
        value = value,  id = id, description = description, fill = description, color = description),
                        structure = testparams$structure, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,plotdetails = testparams$plotdetails) +
  ggplot2::theme_bw() + ggplot2::scale_fill_manual(name = "Comp", values = ggsolvencyii::sii_x_fillcolors_sf16_eng) +
                      ggplot2::scale_color_manual(name = "Comp", values = ggsolvencyii::sii_x_edgecolors_sf16_eng) +
  ggsolvencyii::geom_sii_riskoutline(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,
        value = value,  id = id, description = description), color = "red", lwd = 0.7, alpha = 0.99,
                        structure = testparams$structure, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared, plotdetails = testparams$plotdetails) +
  ggsolvencyii::geom_sii_riskconnection(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,      id = id), arrow = ggplot2::arrow(angle = 20, type = "closed" ))



## cleanup ============================================================== =====
rm(testparams) ; rm(testdata) ; rm(testmaxscrvalue); rm(testrotationdegrees);rm(testrotationdescription); rm(testscalingx); rm(testscalingy); rm(testsquared)
## ====================================================================== =====





