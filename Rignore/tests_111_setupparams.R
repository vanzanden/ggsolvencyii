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
## test 1
testparams <- NULL

testparams$structuredf <- sii_structure_sf16_eng
testdata <- sii_z_ex1_data

test_result <- ggsolvencyii:::fn_levelonedescription(testparams)
test_result
testparams <- NULL
testparams$levelonedescription <- test_result
test_result <- ggsolvencyii:::fn_maxscrvalue(data = testdata, params = testparams)
rm(testparams) ; rm(testdata);rm(test_result)

## test 2
testparams <- NULL

testparams$structuredf <- sii_structure_sf16_nld
testdata <- sii_z_ex5_data
testdata$value <- testdata$waarde

test_result <- ggsolvencyii:::fn_levelonedescription(testparams)
test_result
testparams <- NULL
testparams$levelonedescription <- test_result
test_result <- ggsolvencyii:::fn_maxscrvalue(data = testdata, params = testparams)
rm(testparams) ; rm(testdata);rm(test_result)



## test 3
testparams <- NULL

testparams$structuredf <- sii_z_ex3_structure
testdata <- sii_z_ex3_data

test_result <- ggsolvencyii:::fn_levelonedescription(testparams)
test_result
testparams <- NULL
testparams$levelonedescription <- test_result
test_result <- ggsolvencyii:::fn_maxscrvalue(data = testdata, params = testparams)
rm(testparams) ; rm(testdata); rm(test_result)




