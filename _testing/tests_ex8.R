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
## ====================================================================== =====

        testdata <- sii_z_ex2_data # but manual x and y coordinates

        testparams <- NULL
        testparams$structuredf <- sii_structure_sf16_eng # sii_z_ex_structure
        testparams$levelmax <- 99 # sii_levelmax_995 # sii_z_ex_levelmax
        testparams$aggregatesuffix <- "_other"
        testparams$plotdetails <-  NULL

        testmaxscrvalue = NULL # 100
        testscalingx = 1 # 0.02
        testscalingy = .7 # 0.02
        testrotationdegrees = NULL # 10 # -10 # 70
        testrotationdescription = NULL # operational #  life # l_longevity # h_s_longevity
        testsquared = FALSE # TRUE


sii_z_ex8_map +
  ggsolvencyii::geom_sii_risksurface(data = testdata, mapping = ggplot2::aes(
        x = -0.5,
        y = 53.5,
        value = value,      id = id, description = description, fill = description, color = description),
                            structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                            maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                            rotationdescription = testrotationdescription, squared = testsquared,plotdetails = testparams$plotdetails) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "Comp", values = ggsolvencyii::sii_x_fillcolors_sf16_eng) +
  ggplot2::scale_color_manual(name = "Comp", values = ggsolvencyii::sii_x_edgecolors_sf16_eng) +
  ggsolvencyii::geom_sii_risksurface(data = testdata, mapping = ggplot2::aes(
        x = 9,
        y = 50,
        value = value,      id = id, description = description, fill = description, color = description),
                            structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
        maxscrvalue = 20, ## data has SCR = 30 so radius will be larger
                            scalingx = testscalingx, scalingy = testscalingy,
        rotationdegrees = 15,
                            rotationdescription = testrotationdescription, squared = testsquared,plotdetails = testparams$plotdetails) +
   ggsolvencyii::geom_sii_risksurface(data = testdata, mapping = ggplot2::aes(
        x = 0,
        y = 45,
        value = value,      id = id, description = description, fill = description, color = description),
                            structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
        maxscrvalue = 40,
                            scalingx = testscalingx, scalingy = testscalingy,
        rotationdegrees = 35,
                            rotationdescription = testrotationdescription, squared = testsquared,plotdetails = testparams$plotdetails)



## cleanup ============================================================== =====
rm(testparams) ; rm(testdata) ; rm(testmaxscrvalue); rm(testrotationdegrees);rm(testrotationdescription); rm(testscalingx); rm(testscalingy); rm(testsquared)
## ====================================================================== =====
