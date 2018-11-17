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
context("fncomputegroup")


    testdata <- sii_z_ex1_data #containes comparewithid (series 1 to 2 to 3 to 4 and 1,5,6,7 and 1,8,9,10)

    ## simulation of the route through ggplot
    # testdata_ggplotformat <- dplyr::rename(testdata, x = time, y = ratio, id = id, description = description , value = value )
    # testdata_ggplotformat <- dplyr::mutate(testdata_ggplotformat, group = id)

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

    # testparams <- NULL
    # testparams$structure = sii_structure_sf16_eng
#    testparams$structure <- sii_z_ex1_structure
    # testparams$levelmax <- sii_levelmax_sf16_993
    # testparams$aggregatesuffix <- "_other"

    # intresultA <- ggsolvencyii:::fn_structure_expansion(testparams)
    # intresultB <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = intresultA, data = testdata_ggplotformat)
    # intresultB_group2 <- intresultB[intresultB$group == 2, ]

    # testparams$maxscrvalue <- ggsolvencyii:::fn_maxscrvalue(data = testdata_ggplotformat, params = testparams)
    # testparams$tocenter <- FALSE
    # testparams$plotdetails <- ggsolvencyii:::fn_constructionplotdetails(structure = testparams$structure)

    # testscales <- NULL

    # testparams$rotationdescription  <- NULL
    # testparams$rotationdegrees  <- NULL
    # testparams$squared  <- TRUE

    # testparams$purpose  <- "surface"

    testresultAa <- ggplot2::ggplot() +
                  geom_sii_risksurface(data = testdata,
                                       mapping = ggplot2::aes(x = time, y = ratio, id = id,
                                                              description = description, value = value))
    testresultAa

    testresultAb <- ggplot2::ggplot() +
                  geom_sii_risksurface(data = testdata,
                                       mapping = ggplot2::aes(x = time, y = ratio, id = id,
                                                              description = description, value = value,
                                                              color = description, fill = description))
    testresultAb



    testresultB <- ggplot2::ggplot() + geom_sii_riskoutline(data = testdata, mapping = ggplot2::aes(x = time, y = ratio, id = id,
                                                                                description = description, value = value))
    testresultB

    testresultC <- ggplot2::ggplot() + geom_sii_riskoutline(data = testdata, mapping = ggplot2::aes(x = time, y = ratio, id = id,
                                                                                description = description, value = value,
                                                                                comparewithid = comparewithid))
    testresultC

    testresultD <- ggplot2::ggplot() + geom_sii_riskconnection(data = testdata, mapping = ggplot2::aes(x = time, y = ratio, id = id,
                                                                                comparewithid = comparewithid))
    testresultD


#
# #  test_that("fn_squareddegrees" ,{
# # expect_equal(testresultAa, TRUE)  ## ERRORED
# #  })
#
rm(testdata)
# rm(testdata_ggplotformat)
# # rm(testdata_add)
# # # rm(teststructure_corrupt)
# rm(testparams)
# #
# rm(intresultA)
# rm(intresultB)
# rm(intresultB_group2)
# rm(intresultC)
# rm(intresultD)
# rm(intresultE)
#
# rm(testresultA)
rm(testresultAa); rm(testresultAb)#; rm(testresultAc); rm(testresultAd)
rm(testresultB)#;rm(testresultBa); rm(testresultBb);
rm(testresultC)#;rm(testresultCa); rm(testresultCb);
# rm(testresultDa); rm(testresultDb); rm(testresultDc); rm(testresultDd)
# rm(testresultEa); rm(testresultEb);
# rm(testresultFa); rm(testresultFb);
# rm(testresultGa); rm(testresultGb); rm(testresultGc); rm(testresultGd)
# rm(testresultHa); rm(testresultHb);
# rm(testresultJa); rm(testresultJb);
# rm(testresultK)
# rm(testresultL)
#
# # rm(expectedA)
# # rm(expectedB)
# # rm(expectedC)
# # rm(expectedD)
# # rm(expectedE)
# # rm(expectedF)
# # rm(expectedG)
# # rm(expectedH)
# # rm(expectedJ)
