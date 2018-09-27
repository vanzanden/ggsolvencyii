##   sii_structure_sf16_eng ============================================= =====
  sii_structure_sf16_eng<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="struct_sf16_eng", col_types=c(rep("text",3),rep("skip",5)))
  sii_structure_sf16_eng
  devtools::use_data(sii_structure_sf16_eng,overwrite = TRUE)
  rm(sii_structure_sf16_eng)

##   sii_structure_sf16_nld ============================================= =====
  sii_structure_sf16_nld<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="struct_sf16_nld", col_types=c(rep("text",3),rep("skip",5)))
  sii_structure_sf16_nld
  devtools::use_data(sii_structure_sf16_nld,overwrite = TRUE)
  rm(sii_structure_sf16_nld)


##   sii_dummydata_sf16_eng ==NOT ACTIVE================================= =====
  # sii_dummydata_sf16_eng<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="struct_sf16_eng", col_types=c("text",rep("skip",3),rep("numeric",2),rep("skip",2)))
  # sii_dummydata_sf16_eng
  # devtools::use_data(sii_dummydata_sf16_eng,overwrite = TRUE)
  # rm(sii_dummydata_sf16_eng)
##   sii_outline_sf16_eng =============================================== =====
  data<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="outline_sf16_eng")
    data$levelordescription <- as.character(data$levelordescription)
    data$outline1 <- as.logical(data$outline1)
    data$outline2 <- as.logical(data$outline2)
    data$outline3 <- as.logical(data$outline3)
    data$outline4 <- as.logical(data$outline4)
    data$outline11 <- as.logical(data$outline11)
    data$outline13 <- as.logical(outdataline_sf16_eng$outline13)

  sii_outline_sf16_eng <- as.data.frame(data)
  sii_outline_sf16_eng
  devtools::use_data(sii_outline_sf16_eng,overwrite = TRUE)
      ## test for tidyverse transformation
      tidyr::gather(data = sii_outline_sf16_eng, key = outlinetype , value = drawoutline, -levelordescription)
  rm(data)
  rm(sii_outline_sf16_eng)

##   sii_outline_sf16_nld =============================================== =====
  data<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="outline_sf16_nld")
  data$levelordescription <- as.character(data$levelordescription)
  data$outline1 <- as.logical(data$outline1)
  data$outline2 <- as.logical(data$outline2)
  data$outline3 <- as.logical(data$outline3)
  data$outline4 <- as.logical(data$outline4)
  data$outline11 <- as.logical(data$outline11)
  data$outline13 <- as.logical(data$outline13)

  sii_outline_sf16_nld <- as.data.frame(data)
  sii_outline_sf16_nld
  devtools::use_data(sii_outline_sf16_nld,overwrite = TRUE)
  ## test for tidyverse transformation
  tidyr::gather(data = sii_outline_sf16_nld, key = outlinetype , value = drawoutline, -levelordescription)
  rm(data)
  rm(sii_outline_sf16_nld)

##   sii_levelmax_sf16_995 ============================================== =====
  sii_levelmax_sf16_995<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="levelmax_sf16_995")
  sii_levelmax_sf16_995
  devtools::use_data(sii_levelmax_sf16_995,overwrite = TRUE)
  rm(sii_levelmax_sf16_995)

##   sii_levelmax_sf16_993 ============================================== =====
  sii_levelmax_sf16_993<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="levelmax_sf16_993")
  sii_levelmax_sf16_993
  devtools::use_data(sii_levelmax_sf16_993,overwrite = TRUE)
  rm(sii_levelmax_sf16_993)



## E X A M P L E   1 ==================================================== =====
##   sii_z_example1_data  =============================================== =====
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

## E X A M P L E   2 ==================================================== =====
##   sii_z_example2_data  =============================================== =====
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
## E X A M P L E   3 ==================================================== =====
##   sii_z_example3_structure =========================================== =====
  sii_z_example3_structure<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="ex3_struct", col_types=c(rep("text",3),rep("skip",2)))
  sii_z_example3_structure
  devtools::use_data(sii_z_example3_structure,overwrite = TRUE)
  rm(sii_z_example3_structure)

##   sii_z_example3_data ================================================ =====
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

##   sii_z_example3_levelmax ============================================ =====
  exceldf<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="ex3_levelmax")
  sii_z_example3_levelmax <- exceldf
   sii_z_example3_levelmax <- data.frame(
                                      level=as.character(exceldf$level),
                                        levelmax=as.numeric(exceldf$levelmax)
                                        )
  sii_z_example3_levelmax
  devtools::use_data(sii_z_example3_levelmax,overwrite = TRUE)
  rm(sii_z_example3_levelmax)

## E X A M P L E   4 ==================================================== =====
##   sii_z_example4_outline ============================================= =====
  data<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="ex4_outline")
  data$levelordescription <- as.character(data$levelordescription)
  data$outline1 <- as.logical(data$outline1)
  data$outline2 <- as.logical(data$outline2)
  data$outline3 <- as.logical(data$outline3)
  data$outline4 <- as.logical(data$outline4)
  data$outline11 <- as.logical(data$outline11)
  data$outline13 <- as.logical(data$outline13)
  sii_z_example4_outline <- as.data.frame(data)
  sii_z_example4_outline
  devtools::use_data(sii_z_example4_outline,overwrite = TRUE)
  ## test for tidyverse transformation
  tidyr::gather(data = sii_z_example4_outline, key = outlinetype , value = drawoutline, -levelordescription)
  rm(data)
  rm(sii_z_example4_outline)
## E X A M P L E   5 ==================================================== =====
## E X A M P L E   6 ==================================================== =====
