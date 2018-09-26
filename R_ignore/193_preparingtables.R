## sii_structure_sf16_eng # # #######################################################
  sii_structure_sf16_eng<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="struct_sf16_eng", col_types=c(rep("text",3),rep("skip",5)))
  sii_structure_sf16_eng
  devtools::use_data(sii_structure_sf16_eng,overwrite = TRUE)
  rm(sii_structure_sf16_eng)

## sii_dummydata_sf16_eng # # #######################################################
  # sii_dummydata_sf16_eng<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="struct_sf16_eng", col_types=c("text",rep("skip",3),rep("numeric",2),rep("skip",2)))
  # sii_dummydata_sf16_eng
  # devtools::use_data(sii_dummydata_sf16_eng,overwrite = TRUE)
  # rm(sii_dummydata_sf16_eng)

## sii_outline_sf16_eng   # # #######################################################
  outline_sf16_eng<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="outline_sf16_eng")
    outline_sf16_eng$levelordescription <- as.character(outline_sf16_eng$levelordescription)
    outline_sf16_eng$outline1 <- as.logical(outline_sf16_eng$outline1)
    outline_sf16_eng$outline2 <- as.logical(outline_sf16_eng$outline2)
    outline_sf16_eng$outline3 <- as.logical(outline_sf16_eng$outline3)
    outline_sf16_eng$outline4 <- as.logical(outline_sf16_eng$outline4)
    outline_sf16_eng$outline11 <- as.logical(outline_sf16_eng$outline11)
    outline_sf16_eng$outline13 <- as.logical(outline_sf16_eng$outline13)

  sii_outline_sf16_eng <- as.data.frame(outline_sf16_eng)
  sii_outline_sf16_eng
  devtools::use_data(sii_outline_sf16_eng,overwrite = TRUE)
      ## test for tidyverse transformation
      tidyr::gather(data = sii_outline_sf16_eng, key = outlinetype , value = drawoutline, -levelordescription)
  rm(outline_sf16_eng)
  rm(sii_outline_sf16_eng)

## sii_outline_sf16_eng_exceptions #########################################################
## sii_z_example4_outline_exceptions #########################################################
  outline_sf16_eng_exceptions<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="outline_sf16_eng_exceptions")
  outline_sf16_eng_exceptions$levelordescription <- as.character(outline_sf16_eng_exceptions$levelordescription)
  outline_sf16_eng_exceptions$outline1 <- as.logical(outline_sf16_eng_exceptions$outline1)
  outline_sf16_eng_exceptions$outline2 <- as.logical(outline_sf16_eng_exceptions$outline2)
  outline_sf16_eng_exceptions$outline3 <- as.logical(outline_sf16_eng_exceptions$outline3)
  outline_sf16_eng_exceptions$outline4 <- as.logical(outline_sf16_eng_exceptions$outline4)
  outline_sf16_eng_exceptions$outline11 <- as.logical(outline_sf16_eng_exceptions$outline11)
  outline_sf16_eng_exceptions$outline13 <- as.logical(outline_sf16_eng_exceptions$outline13)
  ## to new naming convention
  sii_z_example4_outline_exceptions <- as.data.frame(outline_sf16_eng_exceptions)
  sii_z_example4_outline_exceptions
  devtools::use_data(sii_z_example4_outline_exceptions,overwrite = TRUE)
  ## test for tidyverse transformation
  tidyr::gather(data = sii_z_example4_outline_exceptions, key = outlinetype , value = drawoutline, -levelordescription)
  rm(outline_sf16_eng_exceptions)
  rm(sii_z_example4_outline_exceptions)


## sii_levelmax_sf16_995  # # #######################################################
  sii_levelmax_sf16_995<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="levelmax_sf16_995")
  sii_levelmax_sf16_995
  devtools::use_data(sii_levelmax_sf16_995,overwrite = TRUE)
  rm(sii_levelmax_sf16_995)

## sii_levelmax_sf16_993  # # #######################################################
  sii_levelmax_sf16_993<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="levelmax_sf16_993")
  sii_levelmax_sf16_993
  devtools::use_data(sii_levelmax_sf16_993,overwrite = TRUE)
  rm(sii_levelmax_sf16_993)



## sii_z_example1_data  # # #######################################################
  exceldf <- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="example1_sf16_eng") %>%
    tidyr::gather(key = description, value = value, -id, -time,-ratio)
  sii_z_example1_data <- data.frame(
                                      time=as.numeric(exceldf$time) ,
                                      ratio=as.numeric(exceldf$ratio),
                                      description=exceldf$description,   # it has to be a factor !!
                                      value=as.numeric(exceldf$value),
                                      id=exceldf$id #,
                                      # comparewithid=exceldf$comparewithid
                                      )
  sii_z_example1_data
  devtools::use_data(sii_z_example1_data,overwrite = TRUE)
  rm(exceldf)
  rm(sii_example1_data)

## sii_z_example2_data  # # ######################################################
  exceldf <- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="example2_sf16_eng")  %>%
                   tidyr::gather(key = description, value = value,-id,-time,-ratio,-comparewithid)
  sii_z_example2_data <- data.frame(
                                      time=as.numeric(exceldf$time) ,
                                      ratio=as.numeric(exceldf$ratio),
                                      description=exceldf$description,   # it has to be a factor !!
                                      value=as.numeric(exceldf$value),
                                      id=exceldf$id ,
                                      comparewithid=exceldf$comparewithid
                                    )
  sii_z_example2_data
  devtools::use_data(sii_z_example2_data,overwrite = TRUE)
  rm(exceldf)
  rm(sii_z_example2_data)

##########################################################################################################
##  e x a m p l e 3
##########################################################################################################
## sii_z_example3_structure # # #######################################################
  sii_z_example3_structure<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="ex3_struct", col_types=c(rep("text",3),rep("skip",2)))
  sii_z_example3_structure
  devtools::use_data(sii_z_example3_structure,overwrite = TRUE)
  rm(sii_z_example3_structure)

## sii_z_example3_data  # # ######################################################

  exceldf <- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="ex3_data")  %>%
    tidyr::gather(key = description, value = value,-id,-time,-ratio,-comparewithid)
  sii_z_example3_data <- data.frame(
                                    time=as.numeric(exceldf$time) ,
                                    ratio=as.numeric(exceldf$ratio),
                                    description=exceldf$description,   # it has to be a factor !!
                                    value=as.numeric(exceldf$value),
                                    id=exceldf$id ,
                                    comparewithid=exceldf$comparewithid
                                    )
  sii_z_example3_data
  devtools::use_data(sii_z_example3_data,overwrite = TRUE)
  rm(exceldf)
  rm(sii_z_example3_data)

  ## sii_z_example3_levelmax  # # #######################################################
  exceldf<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="ex3_levelmax")
  sii_z_example3_levelmax <- exceldf
   sii_z_example3_levelmax <- data.frame(
                                      level=as.character(exceldf$level),
                                        levelmax=as.numeric(exceldf$levelmax)
                                        )
  sii_z_example3_levelmax
  devtools::use_data(sii_z_example3_levelmax,overwrite = TRUE)
  rm(sii_z_example3_levelmax)
