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
library(dplyr)
library(magrittr)
# library(ggsolvencyii)

context("vignettes")


## coding overview
## expanded    testdata <- sii_z_ex2_data

    testparams <- NULL
    testparams$structure <- sii_structure_sf16_eng
    testparams$levelmax <- sii_levelmax_sf16_995
    testparams$aggregatesuffix <- "_other"

test_that("fn_squareddegrees" ,{
 expect_silent(ggsolvencyii:::fn_structure_expansion(testparams))
})

    vignetteA <- ggsolvencyii:::fn_structure_expansion(testparams)
    vignetteA_show <- vignetteA
    vignetteA_show <- vignetteA_show[vignetteA_show$level %in% c("3","4.01","4.01d","4.01o"),]
    vignetteA_show <- dplyr::select(.data = vignetteA_show, description,level,childlevel,levelmax)
    vignetteA_show


##   comparewithid_1

    sii_z_ex1_data[sii_z_ex1_data$description == "SCR", ]

    testdata <- sii_z_ex1_data #containes comparewithid

    ## simulation of the route through ggplot
    ## only required aesthetics, comparewithid is always present in data passed to setupdata, if not filled as aesthetic it is the same as id
    testdata_ggplotformat <- dplyr::rename(testdata, x = time, y = ratio, id = id, description = description , value = value, comparewithid = comparewithid )
    ##  with connection
    testdata_ggplotformat <- dplyr::mutate(testdata_ggplotformat, group = 1)

    testparams <- NULL
    testparams$structure <- sii_z_ex1_structure
    testparams$levelmax <- sii_levelmax_sf16_995
    testparams$aggregatesuffix <- "_other"

    vignetteCa <- ggsolvencyii:::fn_setupdata_outline(data = testdata_ggplotformat, params = testparams)
    vignetteCb <- vignetteCa[vignetteCa$description ==  "SCR",c("description","id","x","y")]
    vignetteCc <- nrow(vignetteCb[vignetteCb$description ==  "SCR",])
    ##  without connection

    testdata_ggplotformat$comparewithid = testdata_ggplotformat$id
    vignetteBa <- ggsolvencyii:::fn_setupdata_outline(data = testdata_ggplotformat, params = testparams)
    vignetteBb <- vignetteBa[vignetteBa$description ==  "SCR",c("description","id","x","y")]
    vignetteBc <-nrow(vignetteBb[vignetteBb$description ==  "SCR",])

    vignetteBb
    vignetteCb


sii_z_ex1_plotdetails


