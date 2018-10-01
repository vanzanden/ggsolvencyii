## sii_x_fillcolors_sf16_eng =============================================== =====
sii_x_fillcolors_sf16_eng <- c("SCR"                     = "#1f78b4", #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
                              "BSCR"                     = "#48b0eb", #scr +282828
                              "operational"              = "#70d8ff", #bscr +282828
                                  "market"               = "#d95f02", #http://colorbrewer2.org/?type=qualitative&scheme=Dark2&n=7
                                  "health"               = "#4a1486", #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                  "life"                 = "#33a02c", #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
                                  "nonlife"              = "#b2df8a",   #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
                                  "cp-default"           = "#fb9a99",   #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
                                  "intangibles"          = "#fdbf6f",   #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
                                      "m_interestrate"   = "#990000", #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                      "m_equity"         = "#d7301f",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                      "m_property"       = "#ef6548",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                      "m_spread"         = "#fc8d59",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                      "m_currency"       = "#fdbb84",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                      "m_concentration"  = "#fdd49e",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                      "m_illiquidity"    = "#fef0d9",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                                          "market_other" = "#d95f02", #= market
                                      "h_CAT"            = "#cb181d", #http://colorbrewer2.org/?type=sequential&scheme=Reds&n=8
                                      "h_n_premiumres"   = "#fc9272",    #http://colorbrewer2.org/?type=sequential&scheme=Reds&n=8
                                      "h_n_lapse"        = "#fee0d2",    #http://colorbrewer2.org/?type=sequential&scheme=Reds&n=8
                                      "h_SLT"            = "#6a51a3", #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                      "h_s_mortality"    = "#dadaeb",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                      "h_s_longevity"    = "#9e9ac8",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                      "h_s_disability"   = "#bcbddc",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                      "h_s_lapse"        = "#dadaeb",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                      "h_s_expenses"     = "#efedf5",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                      "h_s_revision"     = "#fcfbfd",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                                          "h_s_other"    = "#6a51a3", # = h_slt
                                      "l_mortality"      = "#005a32",
                                      "l_longevity"      = "#238b45",
                                      "l_disability"     = "#41ab5d",
                                      "l_lapse"          = "#74c476",
                                      "l_expenses"       = "#a1d99b",
                                      "l_revision"       = "#c7e9c0",
                                      "l_CAT"            = "#edf8e9",
                                          "life_other"   = "#33a02c", #=life
                                      "n_premiumreserve" = "#000000",
                                      "n_lapse"          = "#000000",
                                      "n_CAT"            = "#000000",
                                      "non-life_other"   = "#66a61e" #=nonlife
                          )

sii_x_fillcolors_sf16_eng
  devtools::use_data(sii_x_fillcolors_sf16_eng, overwrite = TRUE)
  rm(sii_x_fillcolors_sf16_eng)

## sii_x_edgecolors_sf16_eng =============================================== =====
sii_x_edgecolors_sf16_eng <- c("SCR"                         = "#000000",
                        "BSCR"                     = "#1f78b4",
                        "operational"              = "#1f78b4",
                        "market"               = "#48b0eb",
                        "health"               = "#48b0eb",
                        "life"                 = "#48b0eb",
                        "nonlife"              = "#48b0eb",
                        "cp-default"           = "#48b0eb",
                        "intangibles"          = "#48b0eb",
                        "m_interestrate"   = "#d95f02",
                        "m_equity"         = "#d95f02",
                        "m_property"       = "#d95f02",
                        "m_spread"         = "#d95f02",
                        "m_currency"       = "#d95f02",
                        "m_concentration"  = "#d95f02",
                        "m_illiquidity"    = "#d95f02",
                        "market_other" = "#d95f02" ,
                        "h_CAT"            = "#4a1486",
                        "h_n_premiumres"   = "#4a1486",
                        "h_n_lapse"        = "#4a1486",
                        "h_SLT"            = "#4a1486",
                        "h_s_mortality"    = "#6a51a3",
                        "h_s_longevity"    = "#6a51a3",
                        "h_s_disability"   = "#6a51a3",
                        "h_s_lapse"        = "#6a51a3",
                        "h_s_expenses"     = "#6a51a3",
                        "h_s_revision"     = "#6a51a3",
                        "h_s_other"    = "#6a51a3",
                        "l_mortality"      = "#33a02c",
                        "l_longevity"      = "#33a02c",
                        "l_disability"     = "#33a02c",
                        "l_lapse"          = "#33a02c",
                        "l_expenses"       = "#33a02c",
                        "l_revision"       = "#33a02c",
                        "l_CAT"            = "#33a02c",
                        "life_other"        = "#33a02c",
                        "n_premiumreserve" = "#b2df8a",
                        "n_lapse"          = "#b2df8a",
                        "n_CAT"            = "#b2df8a",
                        "non-life_other"   = "#b2df8a"
                        )

sii_x_edgecolors_sf16_eng
  devtools::use_data(sii_x_edgecolors_sf16_eng, overwrite = TRUE)
  rm(sii_x_edgecolors_sf16_eng)

## sii_x_fillcolors_sf16_nld =============================================== =====
sii_x_fillcolors_sf16_nld <- c("SKV"                     = "#1f78b4", #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
          "KSKV"                     = "#48b0eb", #scr +282828
          "operationeel"             = "#70d8ff", #bscr +282828
              "markt"                = "#d95f02", #http://colorbrewer2.org/?type=qualitative&scheme=Dark2&n=7
              "zorg"                 = "#4a1486", #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
              "leven"                = "#33a02c", #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
              "schade"               = "#b2df8a",   #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
              "tegenpartijkrediet"   = "#fb9a99",   #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
              "intangibles"          = "#fdbf6f",   #http://colorbrewer2.org/?type=qualitative&scheme=Paired&n=7
                  "m_rente"          = "#990000", #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                  "m_aandelen"       = "#d7301f",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                  "m_vastgoed"       = "#ef6548",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                  "m_spread"         = "#fc8d59",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                  "m_valuta"         = "#fdbb84",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                  "m_concentratie"   = "#fdd49e",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                  "m_illiquiditeit"  = "#fef0d9",   #http://colorbrewer2.org/?type=sequential&scheme=OrRd&n=7
                      "markt_other"  = "#d95f02", #= market
                  "z_CAT"            = "#cb181d", #http://colorbrewer2.org/?type=sequential&scheme=Reds&n=8
                  "z_s_premiereserve"= "#fc9272",    #http://colorbrewer2.org/?type=sequential&scheme=Reds&n=8
                  "z_s_verval"       = "#fee0d2",    #http://colorbrewer2.org/?type=sequential&scheme=Reds&n=8
                  "z_alsleven"       = "#6a51a3", #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                  "z_a_kortleven"    = "#dadaeb",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                  "z_a_langleven"    = "#9e9ac8",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                  "z_a_ao"           = "#bcbddc",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                  "z_a_verval"       = "#dadaeb",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                  "z_a_kosten"       = "#efedf5",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                  "z_a_revisie"      = "#fcfbfd",   #http://colorbrewer2.org/?type=sequential&scheme=Purples&n=8
                      "z_alsleven_other"    = "#6a51a3",# = h_slt
                  "l_kortleven"      = "#005a32",
                  "l_langleven"      = "#238b45",
                  "l_ao"             = "#41ab5d",
                  "l_verval"         = "#74c476",
                  "l_kosten"         = "#a1d99b",
                  "l_revisie"        = "#c7e9c0",
                  "l_CAT"            = "#edf8e9",
                      "leven_other"  = "#33a02c", #=life
                  "s_premiereserve"  = "#000000",
                  "s_verval"         = "#000000",
                  "s_CAT"            = "#000000",
                      "schade_other" = "#66a61e" #=nonlife
          )
sii_x_fillcolors_sf16_nld
  devtools::use_data(sii_x_fillcolors_sf16_nld, overwrite = TRUE)
  rm(sii_x_fillcolors_sf16_nld)

## sii_x_edgecolors_sf16_nld =============================================== =====
sii_x_edgecolors_sf16_nld <- c("SKV"               = "#000000",
                        "KSKV"                     = "#1f78b4",
                        "operationeel"             = "#1f78b4",
                        "markt"                    = "#48b0eb",
                        "zorg"                     = "#48b0eb",
                        "leven"                    = "#48b0eb",
                        "schade"                   = "#48b0eb",
                        "tegenpartijkrediet"       = "#48b0eb",
                        "intangibles"              = "#48b0eb",
                        "m_rente"                  = "#d95f02",
                        "m_aandelen"               = "#d95f02",
                        "m_vastgoed"               = "#d95f02",
                        "m_spread"                 = "#d95f02",
                        "m_valuta"                 = "#d95f02",
                        "m_concentratie"           = "#d95f02",
                        "m_illiquiditeit"          = "#d95f02",
                        "markt_other"              = "#d95f02" ,
                        "z_CAT"                    = "#4a1486",
                        "z_s_premiereserve"        = "#4a1486",
                        "z_s_verval"               = "#4a1486",
                        "z_alsleven"               = "#4a1486",
                        "z_a_kortleven"            = "#6a51a3",
                        "z_a_langleven"            = "#6a51a3",
                        "z_a_ao"                   = "#6a51a3",
                        "z_a_verval"               = "#6a51a3",
                        "z_a_kosten"               = "#6a51a3",
                        "z_a_revisie"              = "#6a51a3",
                        "z_alsleven_other"         = "#6a51a3",
                        "l_kortleven"              = "#33a02c",
                        "l_langleven"              = "#33a02c",
                        "l_ao"                     = "#33a02c",
                        "l_verval"                 = "#33a02c",
                        "l_kosten"                 = "#33a02c",
                        "l_revisie"                = "#33a02c",
                        "l_CAT"                    = "#33a02c",
                        "leven_other"              = "#33a02c",
                        "s_premiereserve"          = "#b2df8a",
                        "s_verval"                 = "#b2df8a",
                        "s_CAT"                    = "#b2df8a",
                        "schade_other"             = "#b2df8a"
                        )


  sii_x_edgecolors_sf16_nld
  devtools::use_data(sii_x_edgecolors_sf16_nld, overwrite = TRUE)
  rm(sii_x_edgecolors_sf16_nld)

## sii_structure_sf16_eng =============================================== =====
  sii_structure_sf16_eng <- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
                                              sheet = "struct_sf16_eng",
                                              col_types = c(rep("text", 3), rep("skip", 5)))
  sii_structure_sf16_eng
  devtools::use_data(sii_structure_sf16_eng, overwrite = TRUE)
  rm(sii_structure_sf16_eng)

## sii_structure_sf16_nld =============================================== =====
  sii_structure_sf16_nld <- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
                                              sheet = "struct_sf16_nld",
                                              col_types = c(rep("text", 3), rep("skip", 5)))
  sii_structure_sf16_nld
  devtools::use_data(sii_structure_sf16_nld, overwrite = TRUE)
  rm(sii_structure_sf16_nld)


## sii_dummydata_sf16_eng =============================================== =====
  # sii_dummydata_sf16_eng <- readxl::read_xlsx(path = "xls/preparingtables.xlsx", sheet = "struct_sf16_eng", col_types = c("text", rep("skip", 3), rep("numeric", 2), rep("skip", 2)))
  # sii_dummydata_sf16_eng
  # devtools::use_data(sii_dummydata_sf16_eng, overwrite = TRUE)
  # rm(sii_dummydata_sf16_eng)


## sii_levelmax_sf16_995 ================================================ =====
  sii_levelmax_sf16_995<- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
                                            sheet = "levelmax_sf16_995")
  sii_levelmax_sf16_995
  devtools::use_data(sii_levelmax_sf16_995, overwrite = TRUE)
  rm(sii_levelmax_sf16_995)

## sii_levelmax_sf16_993 ================================================ =====
  sii_levelmax_sf16_993<- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
                                            sheet = "levelmax_sf16_993")
  sii_levelmax_sf16_993
  devtools::use_data(sii_levelmax_sf16_993, overwrite = TRUE)
  rm(sii_levelmax_sf16_993)

## sii_outline_sf16_eng ================================================= =====
  data <- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
                            sheet = "outline_sf16_eng")
    data$levelordescription <- as.character(data$levelordescription)
    data$outline1 <- as.logical(data$outline1)
    data$outline2 <- as.logical(data$outline2)
    data$outline3 <- as.logical(data$outline3)
    data$outline4 <- as.logical(data$outline4)
    data$outline11 <- as.logical(data$outline11)
    data$outline13 <- as.logical(data$outline13)

  sii_outline_sf16_eng <- as.data.frame(data)
  sii_outline_sf16_eng
  devtools::use_data(sii_outline_sf16_eng, overwrite = TRUE)
      ## test for tidyverse transformation
      tidyr::gather(data = sii_outline_sf16_eng, key = outlinetype, value = drawoutline, -levelordescription)
  rm(data)
  rm(sii_outline_sf16_eng)

## sii_outline_sf16_nld ================================================= =====
  data <- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
                            sheet = "outline_sf16_nld")
    data$levelordescription <- as.character(data$levelordescription)
    data$outline1 <- as.logical(data$outline1)
    data$outline2 <- as.logical(data$outline2)
    data$outline3 <- as.logical(data$outline3)
    data$outline4 <- as.logical(data$outline4)
    data$outline11 <- as.logical(data$outline11)
    data$outline13 <- as.logical(data$outline13)

  sii_outline_sf16_nld <- as.data.frame(data)
  sii_outline_sf16_nld
  devtools::use_data(sii_outline_sf16_nld, overwrite = TRUE)
      ## test for tidyverse transformation
      tidyr::gather(data = sii_outline_sf16_nld,
                    key = outlinetype,
                    value = drawoutline,
                    -levelordescription)
  rm(data)
  rm(sii_outline_sf16_nld)



##  e x a m p l e  1 ==================================================== =====
## sii_z_example1_data ================================================== =====
  data <- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
                            sheet = "ex1_data") %>%
            tidyr::gather(key = description,
                          value = value,
                          -id, -time, -ratio)
  sii_z_example1_data <- data.frame(
                                      time = as.numeric(data$time),
                                      ratio = as.numeric(data$ratio),
                                      description = data$description,   # it has to be a factor !!
                                      value = as.numeric(data$value),
                                      id = data$id #,
                                      # comparewithid = data$comparewithid
                                      )
  sii_z_example1_data
  devtools::use_data(sii_z_example1_data, overwrite = TRUE)
  rm(data)
  rm(sii_z_example1_data)

##  e x a m p l e  2 ==================================================== =====
## sii_z_example2_data ================================================== =====
  data <- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
                            sheet = "ex2_data")  %>%
                   tidyr::gather(key = description,
                                 value = value,
                                 -id, -time, -ratio, -comparewithid)
  sii_z_example2_data <- data.frame(
                                      time = as.numeric(data$time),
                                      ratio = as.numeric(data$ratio),
                                      description = data$description,   # it has to be a factor !!
                                      value = as.numeric(data$value),
                                      id = data$id,
                                      comparewithid = data$comparewithid
                                    )
  sii_z_example2_data
  devtools::use_data(sii_z_example2_data, overwrite = TRUE)
  rm(data)
  rm(sii_z_example2_data)

##  e x a m p l e  3 ==================================================== =====
## sii_z_example3_structure ============================================= =====
  sii_z_example3_structure <- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
                                                sheet = "ex3_struct",
                                                col_types = c(rep("text", 3),
                                                              rep("skip", 2)))
  sii_z_example3_structure
  devtools::use_data(sii_z_example3_structure, overwrite = TRUE)
  rm(sii_z_example3_structure)

## sii_z_example3_data ================================================== =====
  data <- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
                            sheet = "ex3_data")  %>%
                  tidyr::gather(key = description,
                                value = value,
                                -id, -time, -ratio, -comparewithid)
  sii_z_example3_data <- data.frame(
                                    time = as.numeric(data$time),
                                    ratio = as.numeric(data$ratio),
                                    description = data$description,   # it has to be a factor !!
                                    value = as.numeric(data$value),
                                    id = data$id,
                                    comparewithid = data$comparewithid
                                    )
  sii_z_example3_data
  devtools::use_data(sii_z_example3_data, overwrite = TRUE)
  rm(data)
  rm(sii_z_example3_data)

## sii_z_example3_levelmax ============================================== =====
  data <- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
                            sheet = "ex3_levelmax")
  sii_z_example3_levelmax <- data.frame(
                                        level = as.character(data$level),
                                        levelmax = as.numeric(data$levelmax)
                                        )
  sii_z_example3_levelmax
  devtools::use_data(sii_z_example3_levelmax, overwrite = TRUE)
  rm(data)
  rm(sii_z_example3_levelmax)

##  e x a m p l e  4 ==================================================== =====
## sii_z_example4_outline =============================================== =====
  data <- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
                            sheet = "ex4_outline")
  data$levelordescription <- as.character(data$levelordescription)
  data$outline1 <- as.logical(data$outline1)
  data$outline2 <- as.logical(data$outline2)
  data$outline3 <- as.logical(data$outline3)
  data$outline4 <- as.logical(data$outline4)
  data$outline11 <- as.logical(data$outline11)
  data$outline13 <- as.logical(data$outline13)

  sii_z_example4_outline <- as.data.frame(data)
  sii_z_example4_outline
  devtools::use_data(sii_z_example4_outline, overwrite = TRUE)
  ## test for tidyverse transformation
  tidyr::gather(data = sii_z_example4_outline, key = outlinetype, value = drawoutline, -levelordescription)
  rm(data)
  rm(sii_z_example4_outline)

##  e x a m p l e  5 ==================================================== =====
## sii_z_example5_data ================================================== =====
  data <- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
                            sheet = "ex5_data")  %>%
                   tidyr::gather(key = description,
                                 value = value,
                                 -id, -tijd, -ratio, -vergelijkmet)
  sii_z_example5_data <- data.frame(
                                      tijd = as.numeric(data$tijd),
                                      ratio = as.numeric(data$ratio),
                                      description = data$description,   # it has to be a factor !!
                                      waarde = as.numeric(data$value),
                                      id = data$id,
                                      vergelijkmet = data$vergelijkmet
                                    )
  sii_z_example5_data
  devtools::use_data(sii_z_example5_data, overwrite = TRUE)
  rm(data)
  rm(sii_z_example5_data)

