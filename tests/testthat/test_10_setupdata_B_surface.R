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
context("fn_setupdata_surfaces")

    testdata <- sii_z_ex1_data #containes comparewithid

    ## simulation of the route through ggplot
    ## only required aesthetics
    testdata_ggplotformat <- dplyr::rename(testdata, x = time, y = ratio, id = id, description = description , value = value )
    testdata_ggplotformat <- dplyr::mutate(testdata_ggplotformat, group = 1)

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
    testparams$structure <- sii_z_ex1_structure
    testparams$levelmax <- sii_levelmax_sf16_995
    testparams$aggregatesuffix <- "_other"

    testresultA <- ggsolvencyii:::fn_setupdata_surfaces(data = testdata_ggplotformat, params = testparams)
    # testresultA
    # str(testresultA)
    # class(testresultA)


test_that("fn_setupdata_surfaces" ,{
 expect_equal( class(testresultA), "data.frame" )
 expect_silent( ggsolvencyii:::fn_setupdata_surfaces(data = testdata_ggplotformat, params = testparams))
})

    ## adding fill-column and colour-column  to data (on description)
    testdata_ggplotformat <- dplyr::mutate(testdata_ggplotformat , fill = description)
    testdata_ggplotformat <- dplyr::mutate(testdata_ggplotformat , colour = description)
    testresultB <- ggsolvencyii:::fn_setupdata_surfaces(data = testdata_ggplotformat, params = testparams)


    ## adding rows to data with a description not in the structure
    testdata_add <- testdata_ggplotformat[testdata_ggplotformat$description == "l_mortality",]
    testdata_add$description = "l_notexisting"
    testdata_ggplotformat <- rbind(testdata_ggplotformat,testdata_add)


test_that("fn_setupdata_surfaces" ,{
expect_equal( class(testresultB), "data.frame" )
expect_warning( ggsolvencyii:::fn_setupdata_surfaces(data = testdata_ggplotformat, params = testparams),"present in the data is not present in the structure. These datalines were ignored.")
})


rm(testdata)
rm(testdata_ggplotformat)
rm(testdata_add)

rm(testparams)
rm(testresultA)
rm(testresultB)
# rm(testresultC)
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
