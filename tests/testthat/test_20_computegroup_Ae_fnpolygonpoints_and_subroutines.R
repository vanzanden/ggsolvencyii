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
context("fn_polygonpoints and subroutines")

    ## fn_circlepoints
    td = data.frame(ri = c(0,1,0), ro = c(1,1.2,1) , db = c(0,10,0), de = c(90,20,360), type = c("outer", "outer", "circle"))

    i = 1
    testresultAa <- fn_circlepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], FALSE,FALSE)
    testresultAb <- fn_circlepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,FALSE)
    testresultAc <- fn_circlepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,TRUE)
    testresultAd <- fn_circlepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,TRUE)
    i = 2
    testresultBa <- fn_circlepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], FALSE,FALSE)
    testresultBb <- fn_circlepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,FALSE)
    i = 3 # circle
    testresultCa <- fn_circlepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], FALSE,FALSE)
    testresultCb <- fn_circlepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,TRUE)

    i = 1
    testresultDa <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], FALSE,FALSE)
    testresultDb <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,FALSE)
    testresultDc <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,TRUE)
    testresultDd <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,TRUE)
    i = 2
    testresultEa <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], FALSE,FALSE)
    testresultEb <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,FALSE)
    i = 3 # "circle"
    testresultFa <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], FALSE,FALSE)
    testresultFb <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,TRUE)

    td = data.frame(ri = c(0,1,0), ro = c(1,1.2,1) , db = c(74,93,185), de = c(212,12,195), type = c("outer", "outer", "outer"))
    i = 1
    testresultGa <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], FALSE,FALSE)
    testresultGb <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,FALSE)
    testresultGc <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,TRUE)
    testresultGd <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,TRUE)
    i = 2
    testresultHa <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], FALSE,FALSE)
    testresultHb <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,FALSE)
    i = 3 # "circle"
    testresultJa <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], FALSE,FALSE)
    testresultJb <- fn_squarepoints(ri = td$ri[i],ro = td$ro[i],db = td$db[i],de = td$de[i], plottype = td$type[i], TRUE,TRUE)




# test_that("fn_circlepoints" ,{
# expect_known_value(testresultA, file = "__expect_known___files", info = "test" )
# })







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

    intresultD <- ggsolvencyii:::fn_rotation(df = intresultC, siiparams = testparams)

    testparams$squared  <- TRUE

    intresultE <- ggsolvencyii:::fn_squareconversion(df = intresultD, siiparams = testparams)

    testparams$purpose  <- "surface"

    testresultK <- ggsolvencyii:::fn_polygonpoints(df = intresultE, siiparams = testparams, counter_polyorder = 1)

    testparams$purpose  <- "outline"

    testresultL <- ggsolvencyii:::fn_polygonpoints(df = intresultE, siiparams = testparams, counter_polyorder = 1)


#
# #  test_that("fn_squareddegrees" ,{
# # expect_equal(testresultAa, TRUE)  ## ERRORED
# #  })
#
rm(testdata)
rm(testdata_ggplotformat)
# rm(testdata_add)
# # rm(teststructure_corrupt)
rm(testparams)
#
rm(intresultA)
rm(intresultB)
rm(intresultB_group2)
rm(intresultC)
rm(intresultD)
rm(intresultE)
#
rm(testresultAa); rm(testresultAb); rm(testresultAc); rm(testresultAd)
rm(testresultBa); rm(testresultBb);
rm(testresultCa); rm(testresultCb);
rm(testresultDa); rm(testresultDb); rm(testresultDc); rm(testresultDd)
rm(testresultEa); rm(testresultEb);
rm(testresultFa); rm(testresultFb);
rm(testresultGa); rm(testresultGb); rm(testresultGc); rm(testresultGd)
rm(testresultHa); rm(testresultHb);
rm(testresultJa); rm(testresultJb);


rm(testresultK)
rm(testresultL)
# # rm(testresultH)
# # rm(testresultJ)
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
