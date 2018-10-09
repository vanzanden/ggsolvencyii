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
## ====================================================================== =====
## sii_structure_sf16_eng/nld , sii_edge/fillcolors_eng/nld ============= =====
  ## read data from xls==== =====
  readdata <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                                              sheet = "struct_and_colors_sf16",
                                              col_types = c(rep("text", 8)))
  readdata

  ## struct eng =========== =====
        dataset <- dplyr::select(readdata,
                                 description = description_eng,
                                 level,
                                 childlevel)
        dataset <- dataset[!is.na(dataset$description), ]
        sii_structure_sf16_eng <- dataset
        # sii_structure_sf16_eng
        devtools::use_data(sii_structure_sf16_eng, overwrite = FALSE)
        rm(sii_structure_sf16_eng) ; rm(dataset)


  ## color fill eng ======= =====
        dataset <- dplyr::select(readdata,
                                 description = description_color_eng,
                                 colorset = fill)
        dataset <- dataset[!is.na(dataset$colorset), ]
        colorset <- paste0("#",dataset$colorset)
        names(colorset) <- dataset$description
        sii_x_fillcolors_eng <- colorset
         # sii_x_fillcolors_sf16_eng
        devtools::use_data(sii_x_fillcolors_sf16_eng, overwrite = FALSE)
        rm(sii_x_fillcolors_sf16_eng) ; rm(dataset); rm(colorset)


  ## color edge eng ======= =====
        dataset <- dplyr::select(readdata,
                                 description=description_color_eng,
                                 colorset = edge)
        dataset <- dataset[!is.na(dataset$colorset), ]
        colorset <- paste0("#",dataset$colorset)
        names(colorset) <- dataset$description
        sii_x_edgecolors_sf16_eng <- colorset
        # sii_x_edgecolors_sf16_eng
        devtools::use_data(sii_x_edgecolors_sf16_eng, overwrite = FALSE)
        rm(sii_x_edgecolors_sf16_eng) ; rm(dataset); rm(colorset)

  ##   struct nld ========= =====
        dataset <- dplyr::select(readdata,
                                 description = description_nld,
                                 level,
                                 childlevel)
        dataset <- dataset[!is.na(dataset$description), ]
        sii_structure_sf16_nld <- dataset
        # sii_structure_sf16_nld
        devtools::use_data(sii_structure_sf16_nld, overwrite = FALSE)
        rm(sii_structure_sf16_nld) ; rm(dataset)

  ##   color fill nld ===== =====
        dataset <- dplyr::select(readdata,
                                 description = description_color_nld,
                                 colorset = fill)
        dataset <- dataset[!is.na(dataset$colorset), ]
        colorset <- paste0("#",dataset$colorset)
        names(colorset) <- dataset$description
        sii_x_fillcolors_sf16_nld <- colorset
        # sii_x_fillcolors_sf16_nld
        devtools::use_data(sii_x_fillcolors_sf16_nld, overwrite = FALSE)
        rm(sii_x_fillcolors_sf16_nld) ; rm(dataset); rm(colorset)

  ##   color edge nld ===== =====
        dataset <- dplyr::select(readdata,
                                 description=description_color_nld,
                                 colorset = edge)
        dataset <- dataset[!is.na(dataset$colorset), ]
        colorset <- paste0("#",dataset$colorset)
        names(colorset) <- dataset$description
        sii_x_edgecolors_sf16_nld <- colorset
        devtools::use_data(sii_x_edgecolors_sf16_nld, overwrite = FALSE)
        rm(sii_x_edgecolors_sf16_nld) ; rm(dataset); rm(colorset)

  ## last cleanup ========= =====
        rm(readdata)

## sii_levelmax_sf16_995 ================================================ =====
  sii_levelmax_sf16_995 <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                                            sheet = "levelmax_sf16_995")
  # sii_levelmax_sf16_995
  devtools::use_data(sii_levelmax_sf16_995, overwrite = FALSE)
  rm(sii_levelmax_sf16_995)

## sii_levelmax_sf16_993 ================================================ =====
  sii_levelmax_sf16_993 <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                                            sheet = "levelmax_sf16_993")
  # sii_levelmax_sf16_993
  devtools::use_data(sii_levelmax_sf16_993, overwrite = FALSE)
  rm(sii_levelmax_sf16_993)

## sii_plotdetails_sf16 ================================================= =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "plotdetails_sf16")
    data$levelordescription <- as.character(data$levelordescription)
    data$surface <- as.logical(data$surface)
    data$outline1 <- as.logical(data$outline1)
    data$outline2 <- as.logical(data$outline2)
    data$outline3 <- as.logical(data$outline3)
    data$outline4 <- as.logical(data$outline4)
    data$outline11 <- as.logical(data$outline11)
    data$outline13 <- as.logical(data$outline13)

  sii_plotdetails_sf16 <- as.data.frame(data)
  # sii_plotdetails_sf16
  devtools::use_data(sii_plotdetails_sf16, overwrite = FALSE)
      ## test for tidyverse transformation for outline
      testdata <- dplyr::select(sii_plotdetails_sf16, - surface)
      testdata <- tidyr::gather(data = testdata, key = outlinetype, value = draw, -levelordescription)
  rm(data)
  rm(testdata)
  rm(sii_plotdetails_sf16)



##  e x a m p l e  1 ==================================================== =====
## sii_z_ex1_data ======================================================= =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex1_data")
  data <- tidyr::gather(data,
                        key = description,
                        value = value,
                        -id, -time, -ratio, -comparewithid )
  sii_z_ex1_data <- data.frame(
                                      time = as.numeric(data$time),
                                      ratio = as.numeric(data$ratio),
                                      description = data$description,   # it has to be a factor !!
                                      value = as.numeric(data$value),
                                      id = data$id,
                                      comparewithid = data$comparewithid
                                      )
  # sii_z_ex1_data
  devtools::use_data(sii_z_ex1_data, overwrite = FALSE)
  rm(data)
  rm(sii_z_ex1_data)

## sii_z_ex1_structure , edge- and fillcolors============================ =====
  ## read data from xls==== =====
  readdata <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                                              sheet = "ex1_struct_and_colors",
                                              col_types = c(rep("text", 8)))
  readdata

  ## struct =============== =====
        dataset <- dplyr::select(readdata,
                                 description = description_eng,
                                 level,
                                 childlevel)
        dataset <- dataset[!is.na(dataset$description), ]
        sii_z_ex1_structure <- dataset
        # sii_z_ex1_structure
        devtools::use_data(sii_z_ex1_structure, overwrite = FALSE)
        rm(sii_z_ex1_structure) ; rm(dataset)


  ## color fill =========== =====
        dataset <- dplyr::select(readdata,
                                 description = description_color_eng,
                                 colorset = fill)
        dataset <- dataset[!is.na(dataset$colorset), ]
        colorset <- paste0("#",dataset$colorset)
        names(colorset) <- dataset$description
        sii_z_ex1_fillcolors <- colorset
        # sii_z_ex1_fillcolors
        devtools::use_data(sii_z_ex1_fillcolors, overwrite = FALSE)
        rm(sii_z_ex1_fillcolors) ; rm(dataset); rm(colorset)


  ## color edge =========== =====
        dataset <- dplyr::select(readdata,
                                 description=description_color_eng,
                                 colorset = edge)
        dataset <- dataset[!is.na(dataset$colorset), ]
        colorset <- paste0("#",dataset$colorset)
        names(colorset) <- dataset$description
        sii_z_ex1_edgecolors <- colorset
        # sii_z_ex1_edgecolors
        devtools::use_data(sii_z_ex1_edgecolors, overwrite = FALSE)
        rm(sii_z_ex1_edgecolors) ; rm(dataset); rm(colorset)


  ## last cleanup ========= =====
        rm(readdata)
## sii_z_ex1_plotdetails ================================================ =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex1_plotdetails")
    data$levelordescription <- as.character(data$levelordescription)
    data$surface <- as.logical(data$surface)
    data$outline1 <- as.logical(data$outline1)
    data$outline2 <- as.logical(data$outline2)
    data$outline3 <- as.logical(data$outline3)
    data$outline4 <- as.logical(data$outline4)
    data$outline11 <- as.logical(data$outline11)
    data$outline13 <- as.logical(data$outline13)

  sii_z_ex1_plotdetails <- as.data.frame(data)
   # sii_z_ex1_plotdetails
  devtools::use_data(sii_z_ex1_plotdetails, overwrite = FALSE)
      ## test for tidyverse transformation for outline
      testdata <- dplyr::select(sii_z_ex1_plotdetails, - surface)
      testdata <- tidyr::gather(data = testdata, key = outlinetype, value = draw, -levelordescription)
  rm(data)
  rm(testdata)
  rm(sii_z_ex1_plotdetails)
## sii_z_ex1_plotdetails2================================================ =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex1_plotdetails2")
    data$levelordescription <- as.character(data$levelordescription)
    data$surface <- as.logical(data$surface)
    data$outline1 <- as.logical(data$outline1)
    data$outline2 <- as.logical(data$outline2)
    data$outline3 <- as.logical(data$outline3)
    data$outline4 <- as.logical(data$outline4)
    data$outline11 <- as.logical(data$outline11)
    data$outline13 <- as.logical(data$outline13)

  sii_z_ex1_plotdetails2 <- as.data.frame(data)
   sii_z_ex1_plotdetails2
  devtools::use_data(sii_z_ex1_plotdetails2, overwrite = FALSE)
      ## test for tidyverse transformation for outline
      testdata <- dplyr::select(sii_z_ex1_plotdetails2, - surface)
      testdata <- tidyr::gather(data = testdata, key = outlinetype, value = draw, -levelordescription)
  rm(data)
  rm(testdata)
  rm(sii_z_ex1_plotdetails2)
## sii_z_ex1_levelmax =================================================== =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex1_levelmax")
  sii_z_ex1_levelmax <- data.frame(
                                        level = as.character(data$level),
                                        levelmax = as.numeric(data$levelmax)
                                        )
  # sii_z_ex1_levelmax
  devtools::use_data(sii_z_ex1_levelmax, overwrite = FALSE)
  rm(data)
  rm(sii_z_ex1_levelmax)

##  e x a m p l e  2 ==================================================== =====
## sii_z_ex2_data ======================================================= =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex2_data")
  data <- tidyr::gather(data,
                        key = description,
                        value = value,
                        -id, -time, -ratio)
  sii_z_ex2_data <- data.frame(
                                      time = as.numeric(data$time),
                                      ratio = as.numeric(data$ratio),
                                      description = data$description,   # it has to be a factor !!
                                      value = as.numeric(data$value),
                                      id = data$id #,
                                      # comparewithid = data$comparewithid
                                      )
  # sii_z_ex2_data
  devtools::use_data(sii_z_ex2_data, overwrite = FALSE)
  rm(data)
  rm(sii_z_ex2_data)

##  e x a m p l e  3 ==================================================== =====
## sii_z_ex3_data ======================================================= =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex3_data")
  data <-  tidyr::gather(data,
                         key = description,
                         value = value,
                         -id, -time, -ratio, -comparewithid)
  sii_z_ex3_data <- data.frame(
                                      time = as.numeric(data$time),
                                      ratio = as.numeric(data$ratio),
                                      description = data$description,   # it has to be a factor !!
                                      value = as.numeric(data$value),
                                      id = data$id,
                                      comparewithid = data$comparewithid
                                    )
   # sii_z_ex3_data
  devtools::use_data(sii_z_ex3_data, overwrite = FALSE)
  rm(data)
  rm(sii_z_ex3_data)

## sii_z_ex3_plotdetails ================================================ =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex3_plotdetails")
    data$levelordescription <- as.character(data$levelordescription)
    data$surface <- as.logical(data$surface)
    data$outline1 <- as.logical(data$outline1)
    data$outline2 <- as.logical(data$outline2)
    data$outline3 <- as.logical(data$outline3)
    data$outline4 <- as.logical(data$outline4)
    data$outline11 <- as.logical(data$outline11)
    data$outline13 <- as.logical(data$outline13)

  sii_z_ex3_plotdetails <- as.data.frame(data)
  # sii_z_ex3_plotdetails
  devtools::use_data(sii_z_ex3_plotdetails, overwrite = FALSE)
      ## test for tidyverse transformation for outline
      testdata <- dplyr::select(sii_z_ex3_plotdetails, - surface)
      testdata <- tidyr::gather(data = testdata, key = outlinetype, value = draw, -levelordescription)
  rm(data)
  rm(testdata)
  rm(sii_z_ex3_plotdetails)



##  e x a m p l e  4 ==================================================== =====
## sii_z_ex4_structure ================================================== =====
  sii_z_ex4_structure <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                                                sheet = "ex4_struct",
                                                col_types = c(rep("text", 3),
                                                              rep("skip", 2)))
  # sii_z_ex4_structure
  devtools::use_data(sii_z_ex4_structure, overwrite = FALSE)
  rm(sii_z_ex4_structure)

## sii_z_ex4_data ======================================================= =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex4_data")
  data <- tidyr::gather(data,
                        key = description,
                        value = value,
                        -id, -time, -ratio, -comparewithid)
  sii_z_ex4_data <- data.frame(
                                    time = as.numeric(data$time),
                                    ratio = as.numeric(data$ratio),
                                    description = data$description,   # it has to be a factor !!
                                    value = as.numeric(data$value),
                                    id = data$id,
                                    comparewithid = data$comparewithid
                                    )
  # sii_z_ex4_data
  devtools::use_data(sii_z_ex4_data, overwrite = FALSE)
  rm(data)
  rm(sii_z_ex4_data)

## sii_z_ex4_levelmax =================================================== =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex4_levelmax")
  sii_z_ex4_levelmax <- data.frame(
                                        level = as.character(data$level),
                                        levelmax = as.numeric(data$levelmax)
                                        )
  # sii_z_ex4_levelmax
  devtools::use_data(sii_z_ex4_levelmax, overwrite = FALSE)
  rm(data)
  rm(sii_z_ex4_levelmax)

##  e x a m p l e  5 ==================================================== =====
##
## as of now redundant

##  e x a m p l e  6 ==================================================== =====
## sii_z_ex6_structure , edge- and fillcolors============================ =====
  ## read data from xls==== =====
  readdata <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                                              sheet = "ex6_struct_and_colors",
                                              col_types = c(rep("text", 8)))
  readdata

  ## struct eng =========== =====
        dataset <- dplyr::select(readdata,
                                 description = description_eng,
                                 level,
                                 childlevel)
        dataset <- dataset[!is.na(dataset$description), ]
        sii_z_ex6_structure <- dataset
        sii_z_ex6_structure
        devtools::use_data(sii_z_ex6_structure, overwrite = FALSE)
        rm(sii_z_ex6_structure) ; rm(dataset)


  ## color fill eng ======= =====
        dataset <- dplyr::select(readdata,
                                 description = description_color_eng,
                                 colorset = fill)
        dataset <- dataset[!is.na(dataset$colorset), ]
        colorset <- paste0("#",dataset$colorset)
        names(colorset) <- dataset$description
        sii_z_ex6_fillcolors <- colorset
        # sii_z_ex6_fillcolors
        devtools::use_data(sii_z_ex6_fillcolors, overwrite = FALSE)
        rm(sii_z_ex6_fillcolors) ; rm(dataset); rm(colorset)


  ## color edge eng ======= =====
        dataset <- dplyr::select(readdata,
                                 description=description_color_eng,
                                 colorset = edge)
        dataset <- dataset[!is.na(dataset$colorset), ]
        colorset <- paste0("#",dataset$colorset)
        names(colorset) <- dataset$description
        sii_z_ex6_edgecolors <- colorset
        # sii_z_ex6_edgecolors
        devtools::use_data(sii_z_ex6_edgecolors, overwrite = FALSE)
        rm(sii_z_ex6_edgecolors) ; rm(dataset); rm(colorset)


  ## last cleanup ========= =====
        rm(readdata)

## sii_z_ex6_data ======================================================= =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex6_data")
  data <- tidyr::gather(data,
                        key = description,
                        value = value,
                        -id, -time, -ratio, -comparewithid)
  sii_z_ex6_data <- data.frame(
                                      time = as.numeric(data$time),
                                      ratio = as.numeric(data$ratio),
                                      description = data$description,   # it has to be a factor !!
                                      value = as.numeric(data$value),
                                      id = data$id,
                                      comparewithid = data$comparewithid
                                    )
  # sii_z_ex6_data
  devtools::use_data(sii_z_ex6_data, overwrite = FALSE)
  rm(data)
  rm(sii_z_ex6_data)

## sii_z_ex6_data2 ====================================================== =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex6_data_adapted")
  data <- tidyr::gather(data,
                        key = description,
                        value = value,
                        -id, -time, -ratio, -comparewithid)
  sii_z_ex6_data2 <- data.frame(
                                      time = as.numeric(data$time),
                                      ratio = as.numeric(data$ratio),
                                      description = data$description,   # it has to be a factor !!
                                      value = as.numeric(data$value),
                                      id = data$id,
                                      comparewithid = data$comparewithid
                                    )
  # sii_z_ex6_data2
  devtools::use_data(sii_z_ex6_data2, overwrite = FALSE)
  rm(data)
  rm(sii_z_ex6_data2)


## sii_z_ex6_levelmax =================================================== =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex6_levelmax")
  sii_z_ex6_levelmax <- data.frame(
                                        level = as.character(data$level),
                                        levelmax = as.numeric(data$levelmax)
                                        )
  # sii_z_ex6_levelmax
  devtools::use_data(sii_z_ex6_levelmax, overwrite = FALSE)
  rm(data)
  rm(sii_z_ex6_levelmax)

## sii_z_ex6_plotdetails ================================================ =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex6_plotdetails")
    data$levelordescription <- as.character(data$levelordescription)
    data$surface <- as.logical(data$surface)
    data$outline1 <- as.logical(data$outline1)
    data$outline2 <- as.logical(data$outline2)
    data$outline3 <- as.logical(data$outline3)
    data$outline4 <- as.logical(data$outline4)
    data$outline11 <- as.logical(data$outline11)
    data$outline13 <- as.logical(data$outline13)

  sii_z_ex6_plotdetails <- as.data.frame(data)
  # sii_z_ex6_plotdetails
  devtools::use_data(sii_z_ex6_plotdetails, overwrite = FALSE)
      ## test for tidyverse transformation for outline
      testdata <- dplyr::select(sii_z_ex6_plotdetails, - surface)
      testdata <- tidyr::gather(data = testdata, key = outlinetype, value = draw, -levelordescription)
  rm(data)
  rm(testdata)
  rm(sii_z_ex6_plotdetails)

##  e x a m p l e  7 ==================================================== =====
## sii_z_ex7_data ======================================================= =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex7_data")
  data <- tidyr::gather(data,
                        key = description,
                        value = waarde,
                        -id, -tijd, -ratio, -vergelijkmet)
  sii_z_ex7_data <- data.frame(
                                      tijd = as.numeric(data$tijd),
                                      ratio = as.numeric(data$ratio),
                                      description = data$description,   # it has to be a factor !!
                                      waarde = as.numeric(data$waarde),
                                      id = data$id,
                                      vergelijkmet = data$vergelijkmet
                                    )
  # sii_z_ex7_data
  devtools::use_data(sii_z_ex7_data, overwrite = FALSE)
  rm(data)
  rm(sii_z_ex7_data)

## sii_z_ex7_plotdetails ================================================ =====
  data <- readxl::read_xlsx(path = "data_helperfiles/preparingtables.xlsx",
                            sheet = "ex7_plotdetails")
    data$levelordescription <- as.character(data$levelordescription)
    data$surface <- as.logical(data$surface)
    data$outline1 <- as.logical(data$outline1)
    data$outline2 <- as.logical(data$outline2)
    data$outline3 <- as.logical(data$outline3)
    data$outline4 <- as.logical(data$outline4)
    data$outline11 <- as.logical(data$outline11)
    data$outline13 <- as.logical(data$outline13)

  sii_z_ex7_plotdetails <- as.data.frame(data)
  # sii_z_ex7_plotdetails
  devtools::use_data(sii_z_ex7_plotdetails, overwrite = FALSE)
      ## test for tidyverse transformation for outline
      testdata <- dplyr::select(sii_z_ex7_plotdetails, - surface)
      testdata <- tidyr::gather(data = testdata, key = outlinetype, value = draw, -levelordescription)
  rm(data)
  rm(testdata)
  rm(sii_z_ex7_plotdetails)

## ====================================================================== ===
