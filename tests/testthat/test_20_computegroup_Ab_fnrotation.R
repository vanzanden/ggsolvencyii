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
## test ================================================================= =====
library(ggsolvencyii)
context("fn_rotation for a surfaceplot")

    testdata <- sii_z_ex1_data #containes comparewithid (series 1 to 2 to 3 to 4 and 1,5,6,7 and 1,8,9,10)

    ## simulation of the route through ggplot
    testdata_ggplotformat <- dplyr::rename(testdata, x = time, y = ratio, id = id, description = description , value = value )
    testdata_ggplotformat <- dplyr::mutate(testdata_ggplotformat, group = id)

    ## available parameters
                      #   ## structure and form
                      #   structure = ggsolvencyii::sii_structure_sf16_eng,
                      #   squared = FALSE,
                      #   ## grouping
                      #   levelmax = 99,   aggregatesuffix = "_other",
                      #   ##
                      #   plotdetails = NULL,    tocenter = FALSE,   relalpha = FALSE,
                      #   ## rotation
                      #   rotationdegrees = NULL,    rotationdescription = NULL,
                      #   ## scaling
                      #   maxscrvalue = NULL, scalingx = 1, scalingy = 1,
                      # ## other default ggplot2 parameters
                      # ## internal parameters
                      #   ## purpose (attribution in call to ggplot::layer)
                      #

    testparams <- NULL
    testparams$structure = sii_structure_sf16_eng
#    testparams$structure <- sii_z_ex1_structure
    testparams$levelmax <- sii_levelmax_sf16_993
    testparams$aggregatesuffix <- "_other"

    intresultA <- ggsolvencyii:::fn_structure_expansion(testparams)
    intresultB <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = intresultA, data = testdata_ggplotformat)
    intresultB_group2 <- intresultB[intresultB$group == 2, ]

    testparams$maxscrvalue <- ggsolvencyii:::fn_maxscrvalue(data = testdata_ggplotformat, params = testparams)
    testparams$tocenter <- FALSE
    testparams$plotdetails <- ggsolvencyii:::fn_constructionplotdetails(structure = testparams$structure)

    intresultC <- ggsolvencyii:::fn_cornerpoints(df = intresultB_group2, siiparams = testparams)

    testparams$rotationdescription  <- NULL
    testparams$rotationdegrees  <- NULL

    testresultA <- ggsolvencyii:::fn_rotation(df = intresultC, siiparams = testparams)

    testparams$rotationdegrees  <- 45
    testresultB <- ggsolvencyii:::fn_rotation(df = intresultC, siiparams = testparams)

    testparams$rotationdescription  <- "operational"
    testparams$rotationdegrees  <- NULL
    testresultC <- ggsolvencyii:::fn_rotation(df = intresultC, siiparams = testparams)

    testparams$rotationdescription  <- "life_other"
    testparams$rotationdegrees  <- NULL
    testresultD <- ggsolvencyii:::fn_rotation(df = intresultC, siiparams = testparams)

    testparams$rotationdescription  <- "life_other"
    testparams$rotationdegrees  <- -10
    testresultE <- ggsolvencyii:::fn_rotation(df = intresultC, siiparams = testparams)


## toevoegen foutafhandeling als er een groepering is en de rotationdescription niet meer in het dataframe zit.




# test_that("fn_rotation" ,{
# expect_equal( testresultA, TRUE)
# })



rm(testdata)
rm(testdata_ggplotformat)
# rm(testdata_add)
# rm(teststructure)
# rm(teststructure_corrupt)
rm(testparams)

rm(intresultA)
rm(intresultB)

rm(testresultA)
# rm(testresultB); rm(testresultBa); rm(testresultBb)
# rm(testresultC); rm(testresultCa); rm(testresultCb)
# rm(testresultD)
# rm(testresultE)
# rm(testresultF)
# rm(testresultG)
# rm(testresultH)
# rm(testresultJ)

# rm(expectedA)
# rm(expectedB)
# rm(expectedC)
# rm(expectedD)
# rm(expectedE)
# rm(expectedF)
# rm(expectedG)
# rm(expectedH)
# rm(expectedJ)
