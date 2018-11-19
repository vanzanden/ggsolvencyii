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
    testparams$structure <- sii_z_ex1_structure
    testparams$levelmax <- 99
    testparams$aggregatesuffix <- "_other"

test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result

test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;test_result

    rm(testparams); rm(testdata); rm(test_result)



t <- sii_debug_geom(data_descr = sii_z_ex1_data$description,structure = sii_structure_sf16_eng,aggregatesuffix = "other", levelmax = sii_levelmax_sf16_995,plotdetails = sii_z_ex1_plotdetails, fillcolors = sii_z_ex1_fillcolors, edgecolors = sii_z_ex1_edgecolors)
t$debug_description[37:45,]
rbind(t$debug_level[1:13,],tail(t$debug_level,2))

    testdata <- sii_z_ex1_data

    testparams <- NULL
    testparams$structure <- sii_z_ex1_structure
    testparams$levelmax <- sii_z_ex1_levelmax
    testparams$aggregatesuffix <- "_other"

test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result

test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;test_result

    rm(testparams); rm(testdata); rm(test_result)





    testdata <- sii_z_ex2_data

    testparams <- NULL
    testparams$structure <- sii_structure_sf16_eng
    testparams$levelmax <- sii_levelmax_sf16_993
    testparams$aggregatesuffix <- "_other"

test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result

test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;test_result

    rm(testparams); rm(testdata); rm(test_result)


# test ================================================================
    testdata <- sii_z_ex3_data

    testparams <- NULL
    testparams$structure <- sii_structure_sf16_eng
    testparams$levelmax <- sii_levelmax_sf16_993
    testparams$aggregatesuffix <- "_other"

test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result

test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;test_result

    rm(testparams); rm(testdata); rm(test_result)


## an issue arose with a small dataset (only level 1,2,3 data), standard formula structure and levelmax (sii_structure_sf16). An issue arises when the levelmax introduces 'o'-lines on levels for which no data exists.
## the following is a structured test of all dataset, structure en levelmax combinations

# test ================================================================
    ## fixed parameters
    testparams <- NULL
    testparams$aggregatesuffix <- "_other"

## data 3, structure 3
    testdata <- sii_z_ex3_data
    testparams$structure <- sii_structure_sf16_eng
    testparams$levelmax <- NULL

sii_debug_geom(data_descr = testdata$description,structure = testparams$structure,aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)
test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result


    testparams$levelmax <- 95

sii_debug_geom(data_descr = testdata$description,structure = testparams$structure,aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)
test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result


    testparams$levelmax <- sii_levelmax_sf16_993

sii_debug_geom(data_descr = testdata$description,structure = testparams$structure,aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)
test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result

## data 4, structure 3

    testdata <- sii_z_ex4_data
    testparams$levelmax <- NULL

sii_debug_geom(data_descr = testdata$description,structure = testparams$structure,aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)
test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result



    testparams$levelmax <- 95

sii_debug_geom(data_descr = testdata$description,structure = testparams$structure,aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)
test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result


    testparams$levelmax <- sii_levelmax_sf16_993

sii_debug_geom(data_descr = testdata$description,structure = testparams$structure,aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)
test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
## following line errors
test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result


## data 3, structure 4

    testdata <- sii_z_ex3_data
    testparams$structure <- sii_z_ex4_structure
    testparams$levelmax <- NULL

sii_debug_geom(data_descr = testdata$description,structure = testparams$structure,aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)
test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result


    testparams$levelmax <- 95

sii_debug_geom(data_descr = testdata$description,structure = testparams$structure,aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)
test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result


    testparams$levelmax <- sii_levelmax_sf16_993

sii_debug_geom(data_descr = testdata$description,structure = testparams$structure,aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)
test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result

## data 3, structure 4
    testdata <- sii_z_ex4_data
    testparams$levelmax <- NULL

sii_debug_geom(data_descr = testdata$description,structure = testparams$structure,aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)
test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result


    testparams$levelmax <- 95

sii_debug_geom(data_descr = testdata$description,structure = testparams$structure,aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)
test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result


    testparams$levelmax <- sii_levelmax_sf16_993

sii_debug_geom(data_descr = testdata$description,structure = testparams$structure,aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax)
test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result


## ====================================================================== =====
    rm(testparams) ; rm(testdata) ; rm(test_result)
## ====================================================================== =====
