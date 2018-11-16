## GNU General Public License version 3 ================================= = = =
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
## testthat ============================================================= =====
library(ggsolvencyii)
context("small functions")

## fn_levelonedescription ----------------------- -----

      ## basic test
      testdata <- sii_z_ex2_data
      teststructure <- sii_structure_sf16_eng
      #teststructure
      testparams <- NULL
      testparams$structuredf <- teststructure
      testresultA <- ggsolvencyii:::fn_levelonedescription(testparams)

    ## ----------------- -----
      ## corrupt structure, catch an error
      teststructure <- teststructure[teststructure$level != 1,]
      teststructure
      testparams$structuredf <- teststructure

test_that("fn_levelonedescription" ,{
expect_equal( testresultA, "SCR" )
expect_equal( length(testresultA), 1 )
expect_error( ggsolvencyii:::fn_levelonedescription(testparams), "no description with level = 1 is present" )
})


## fn_maxscrvalue ------------------------------- -----

      ## basic test, maxscrvalue is not present in the params
      testparams <- NULL
      testparams$levelonedescription <- "SCR"
      testresult <- ggsolvencyii:::fn_maxscrvalue(data = testdata, params = testparams)
      # testresult

 test_that("fn_maxscrvalue (1)" ,{
 expect_equal(testresult, 30)
 expect_message(ggsolvencyii:::fn_maxscrvalue(data = testdata, params = testparams), "scaling is based on a max")
 })

      ## basic test, this version will be de standard by passing the default NULL value for maxscrvalue
      testparams$maxscrvalue <- NULL
      testresult <- ggsolvencyii:::fn_maxscrvalue(data = testdata, params = testparams)
      # testresult

 test_that("fn_maxscrvalue (2)" ,{
 expect_equal(testresult, 30)
 expect_message(ggsolvencyii:::fn_maxscrvalue(data = testdata, params = testparams), "scaling is based on a max")
 })

    ## ----------------- -----
      ## a max$scrvalue is not nULL
      testparams$maxscrvalue <- 123.45
      testresult <- ggsolvencyii:::fn_maxscrvalue(data = testdata, params = testparams)
      # testresult

test_that("fn_maxscrvalue (3)" ,{
expect_equal(testresult, 123.45)
expect_message(ggsolvencyii:::fn_maxscrvalue(data = testdata, params = testparams), "scaling is based on inputvalue")
})


## fn_determinelevels --------------------------- -----

      ## a basic test, on the structure file
      teststructure <- sii_structure_sf16_eng
      testdata <- teststructure$level
      # testdata
      testparams <- NULL

      testresultA <- ggsolvencyii:::fn_determinelevels(vector_in = testdata)
      # testresultA
      expectedA <- c("1", "2", "2d", "3d", "3", "4.01d", "4.01", "4.02d", "4.02",  "4.03d", "4.03",  "4.04d", "4.04",  "5d", "5" )

      testresultB <- ggsolvencyii:::fn_determinelevels(vector_in = testdata, ind_value = TRUE)
      # testresultB    # 1.00 2.00 3.00 4.01 4.02 4.03 4.04 5.00
      expectedB <- c(1, 2, 3, 4.01, 4.02, 4.03,  4.04, 5 )


      testresultC <- ggsolvencyii:::fn_determinelevels(vector_in = testdata, ind_value = FALSE, ind_integer = TRUE) #overwrite ind_value to TRUE
      # testresultC
      expectedC <- c(1, 2, 3, 4, 5 )

      testresultD <- ggsolvencyii:::fn_determinelevels(vector_in = testdata, ind_d = FALSE)
      # testresultD
      expectedD <- c("1", "2",  "3", "4.01",  "4.02",  "4.03",  "4.04", "5" )

      testresultE <- ggsolvencyii:::fn_determinelevels(vector_in = testdata, ind_o = FALSE)
      # testresultE
      expectedE <- c("1", "2", "2d", "3d", "3", "4.01d", "4.01", "4.02d", "4.02",  "4.03d", "4.03",  "4.04d", "4.04",  "5d", "5" )

      testresultF <- ggsolvencyii:::fn_determinelevels(vector_in = testdata, ind_onlyspecials =  TRUE)
      # testresultF
      expectedF <- c("2d", "3d", "4.01d", "4.02d", "4.03d", "4.04d", "5d" )

      testdata <- c(testdata, "4.01o", "4.02o","4.03o","5o")
      # testdata

      testresultG <- ggsolvencyii:::fn_determinelevels(vector_in = testdata, ind_onlyspecials =  TRUE)
      # testresultG
      expectedG <- c("2d", "3d", "4.01d", "4.02d", "4.03d", "4.04d", "5d","4.01o", "4.02o","4.03o","5o" )

      testdata <- c(2,3,4)

      testresultH <- ggsolvencyii:::fn_determinelevels(vector_in = testdata, ind_onlyspecials =  TRUE)
      # testresultH
      expectedH <- NULL

test_that("fn_determinelevels" ,{
expect_equal(testresultA, expectedA)
expect_equal(testresultB, expectedB)
expect_equal(testresultC, expectedC)
expect_equal(testresultD, expectedD)
expect_equal(testresultE, expectedE)
expect_equal(testresultF, expectedF)
expect_equal(testresultG, expectedG)
expect_equal(testresultH, expectedH)
})

## fn_constructionplotdetails ------------------------------- -----

      teststructure <- sii_structure_sf16_eng
      testresult <- ggsolvencyii:::fn_constructionplotdetails(teststructure)
      str(testresult)

test_that("fn_constructionplotdetails" ,{
expect_equal(colnames(testresult), c("levelordescription","surface","outline1","outline2","outline3","outline4","outline11","outline13"))
expect_equal(testresult$outline3, rep(TRUE, 38))
})




## cleaning up ========================================================== =====
rm(testdata)
rm(teststructure)
rm(testparams)


rm(testresult)
rm(testresultA)
rm(testresultB)
rm(testresultC)
rm(testresultD)
rm(testresultE)
rm(testresultF)
rm(testresultG)
rm(testresultH)

rm(expectedA)
rm(expectedB)
rm(expectedC)
rm(expectedD)
rm(expectedE)
rm(expectedF)
rm(expectedG)
rm(expectedH)



