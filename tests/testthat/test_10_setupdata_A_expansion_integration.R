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
context("setup data")

    testdata <- sii_z_ex1_data #containes comparewithid

    ## simulation of the route through ggplot
    ## only required aesthetics
    testdata_ggplotformat <- dplyr::rename(testdata, x = time, y = ratio, id = id, description = description , value = value )
    testdata_ggplotformat <- dplyr::mutate(testdata_ggplotformat, group = 1)

    testparams <- NULL
    testparams$structure <- sii_z_ex1_structure
    testparams$levelmax <- 99
    testparams$aggregatesuffix <- "_other"

    testresultA <- ggsolvencyii:::fn_structure_expansion(testparams)
    # testresultA
    # # str(testresultA)
    # # colnames(testresultA)
    expectedA <- c("childlevel", "description", "ind_d",  "ind_o", "level","levelmax"  , "ordering_1", "ordering_2")



    testresultB <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = testresultA, data = testdata_ggplotformat)
    # testresult_02
    # str(testresult_02)
    # colnames(testresult_02)
    expectedB = sort(c("description", "x", "y", "value", "id",
                            "comparewithid", "group", "level", "childlevel",
                            "ordering_1", "ind_d", "ind_o", "ordering_2",
                            "levelmax", "ind_show", "ordering_3", "ordering_4"))


    testparams$levelmax <- sii_levelmax_sf16_993
    testresultC <- ggsolvencyii:::fn_structure_expansion(testparams)
    expectedC <- expectedA
    testresultD <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = testresultC, data = testdata_ggplotformat)
    expectedD <- sort(expectedB)

    ## adding a fill column (based on description) to the data
    testdata_ggplotformat <- dplyr::mutate(testdata_ggplotformat , fill = description)
    testresultE <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = testresultC, data = testdata_ggplotformat)
    expectedE <- sort(c(expectedB,"fill"))

    ## and what if  fill is based on id
    testdata_ggplotformat$fill <- testdata_ggplotformat$group
    testresultF <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = testresultC, data = testdata_ggplotformat)
    expectedF <- expectedE

    ## and what if  fill is based on bijvoorbeeld value...
    # testdata_ggplotformat$fill <- testdata_ggplotformat$value
    # testresultG <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = testresultC, data = testdata_ggplotformat)
    # expectedG <- expectedF

    ## adding a fill and colour column (based on description) to the data
    testdata_ggplotformat$fill <- testdata_ggplotformat$description
    testdata_ggplotformat <- dplyr::mutate(testdata_ggplotformat , colour = description)
    testresultH <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = testresultC, data = testdata_ggplotformat)
    expectedH <- sort(c(expectedF,"colour"))

    testdata_ggplotformat$colour <- testdata_ggplotformat$group
    testresultJ <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = testresultC, data = testdata_ggplotformat)
    expectedJ <- expectedH





test_that("structure expansion and integration" ,{
expect_equal( sort(colnames(testresultA)), expectedA )
expect_equal( nrow(testresultA), 25)
expect_silent(ggsolvencyii:::fn_structure_data_integration(expandedstructure = testresultA, data = testdata))
expect_equal(sort(colnames(testresultB)), expectedB)
expect_silent(ggsolvencyii:::fn_structure_expansion(testparams))
expect_equal(sort(colnames(testresultC)), expectedC)
expect_equal(sort(colnames(testresultD)), expectedD)
expect_equal(sort(colnames(testresultE)), expectedE)
expect_equal(sort(colnames(testresultF)), expectedF)
# expect_equal(sort(colnames(testresultG)), expectedG)
expect_equal(sort(colnames(testresultH)), expectedH)
expect_equal(sort(colnames(testresultJ)), expectedJ)
})



rm(testdata)
rm(testdata_ggplotformat)
rm(testparams)
rm(testresultA)
rm(testresultB)
rm(testresultC)
rm(testresultD)
rm(testresultE)
rm(testresultF)
# rm(testresultG)
rm(testresultH)
rm(testresultJ)

rm(expectedA)
rm(expectedB)
rm(expectedC)
rm(expectedD)
rm(expectedE)
rm(expectedF)
# rm(expectedG)
rm(expectedH)
rm(expectedJ)

#
