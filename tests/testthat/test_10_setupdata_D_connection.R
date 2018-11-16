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
context("fn_setupdata_connection")

    testdata <- sii_z_ex1_data #containes comparewithid (series 1 to 2 to 3 to 4 and 1,5,6,7 and 1,8,9,10)

    ## simulation of the route through ggplot
    testdata_ggplotformat <- dplyr::rename(testdata, x = time, y = ratio, id = id, description = description , value = value, comparewithid = comparewithid )
    testdata_ggplotformat <- dplyr::mutate(testdata_ggplotformat, group = 1)

    ## available parameters
          # none !

    # testparams <- NULL
    testresultA <- ggsolvencyii:::fn_setupdata_connection(data = testdata_ggplotformat)
    testresultAa <- c("xend", "yend") %in% colnames(testresultA)
    testresultAa <- Reduce("==", testresultAa )
    # str(testresultA)
    # class(testresultA)


test_that("fn_setupdata_connection" ,{
 expect_equal( class(testresultA), "data.frame" )
 expect_equal( testresultAa, TRUE)
 expect_silent( ggsolvencyii:::fn_setupdata_connection(data = testdata_ggplotformat))
})

    ## what if there are lines with comparewithid referencing a not existing id, not to be expected for a connection..
    testdata_ggplotformat$comparewithid[testdata_ggplotformat$id == 3] <- 21 #was 2 in original data
    testresultB <- ggsolvencyii:::fn_setupdata_connection(data = testdata_ggplotformat)
    testresultBa <- c("xend", "yend") %in% colnames(testresultB)
    testresultBa <- Reduce("==", testresultBa )
    testresultBb <- nrow(testresultB[testresultB$id == 3,])

    ## what if there are lines with comparewithid = id, not to be expected for a connection..
    ##
    testdata_ggplotformat$comparewithid[testdata_ggplotformat$id == 3] <- 3 # was 2 in original data
    testresultC <- ggsolvencyii:::fn_setupdata_connection(data = testdata_ggplotformat)
    testresultCa <- c("xend", "yend") %in% colnames(testresultC)
    testresultCa <- Reduce("==", testresultCa )
    testresultCb <- testresultC$x[testresultC$id == 3]  == testresultC$x[testresultC$id == 3]



test_that("fn_setupdata_connection" ,{
expect_equal( class(testresultB), "data.frame" )
expect_equal( testresultBa, TRUE)
expect_equal( testresultBb, 0)
expect_equal( class(testresultC), "data.frame" )
expect_equal( testresultCa, TRUE)
expect_equal( testresultCb, TRUE)
})



rm(testdata)
rm(testdata_ggplotformat)
# rm(testdata_add)

# rm(testparams)
rm(testresultA); rm(testresultAa)
rm(testresultB); rm(testresultBa); rm(testresultBb)
rm(testresultC); rm(testresultCa); rm(testresultCb)
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
