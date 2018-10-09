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

    testdata <- sii_z_ex1_data

    testparams <- NULL
    testparams$structuredf <- sii_z_ex1_structure;

test_result <- ggsolvencyii:::fn_levelonedescription(testparams) ; test_result

    testparams <- NULL
    testparams$levelonedescription <- test_result

test_result <- ggsolvencyii:::fn_maxscrvalue(data = testdata, params = testparams)
    rm(testparams) ; rm(test_result);




        testparams <- NULL
        testparams$structuredf <- sii_z_ex1_structure
        testparams$fillcolors <- sii_z_ex1_fillcolors
        testparams$edgecolors <- sii_z_ex1_edgecolors
        testparams$plotdetails <- sii_z_ex1_plotdetails
        testparams$levelmax <- sii_z_ex1_levelmax
        testparams$aggregatesuffix <- "_other"

sii_debug(data_descr = testdata$description, structure = testparams$structuredf, aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax, plotdetails = testparams$plotdetails,fillcolors = testparams$fillcolors, edgecolors = testparams$edgecolors)


test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result

test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;test_result

# test ========================================================= =====
        testdata <- sii_z_ex1_data

        testparams <- NULL
        testparams$structuredf <- sii_structure_sf16_eng # sii_z_ex_structure
        testparams$fillcolors <- sii_z_ex1_fillcolors
        testparams$edgecolors <- sii_z_ex1_edgecolors
        testparams$levelmax <- 99 #sii_z_ex1_levelmax
        testparams$aggregatesuffix <- "_other"
        testparams$plotdetails <-  sii_z_ex1_plotdetails

        testmaxscrvalue = NULL # 100
        testscalingx = .22 # 0.02
        testscalingy = 1 # 0.02
        testrotationdegrees = NULL # 10 # -10 # 70
        testrotationdescription = NULL # operational #  life # l_longevity # h_s_longevity
        testsquared = FALSE # TRUE


ggplot2::ggplot() +
    ggsolvencyii::geom_sii_risksurface(
        data = testdata[testdata$id == 1, ]
                                     , mapping = ggplot2::aes(
        x = time,
        y = ratio,
        value = value,  id = id, description = description, fill = description,
        color = description
                        ),
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
        maxscrvalue =  25.7433642812936,
                        scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,
        plotdetails = NULL,
        lwd = 0.25,
        alpha = 0.75
        ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "risks", values = testparams$fillcolors) +
  ggplot2::scale_color_manual(name = "risks", values = testparams$edgecolors) +
  ggsolvencyii::geom_sii_risksurface(data = testdata, mapping = ggplot2::aes(
        x = time,
        y = ratio,
        value = value,  id = id, description = description, fill = description, color = description
                        ),
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,
        plotdetails = testparams$plotdetails,
        lwd = 0.25,
        alpha = 1.0
        ) +
  ggsolvencyii::geom_sii_riskconnection(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,      id = id), arrow = ggplot2::arrow(angle = 10, type = "open" ), alpha = 0.15) +
  ggsolvencyii::geom_sii_riskoutline(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,
        value = value,  id = id, description = description
                        ),
        color = "red",
        lwd = 0.25,
        alpha = 0.6,
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,
        plotdetails = testparams$plotdetails) +
  ggsolvencyii::geom_sii_risksurface(
        data = testdata,
                          mapping = ggplot2::aes(
        x = time,
        y = ratio,
        value = value,  id = id, description = description, fill = description #,
        # color = description
                        ),
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,
        plotdetails = sii_z_ex1_plotdetails2,

        alpha = 0.30,
        color = NA
                        )


## cleanup ============================================================== =====
rm(testparams) ; rm(testdata) ; rm(testmaxscrvalue); rm(testrotationdegrees);rm(testrotationdescription); rm(testscalingx); rm(testscalingy); rm(testsquared)
## ====================================================================== =====





