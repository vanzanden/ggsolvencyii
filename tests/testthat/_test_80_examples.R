
#
#
# t <- sii_debug(data_descr = sii_z_ex1_data$description,structure = sii_structure_sf16_eng,aggregatesuffix = "other", levelmax = sii_levelmax_sf16_995,plotdetails = sii_z_ex1_plotdetails, fillcolors = sii_z_ex1_fillcolors, edgecolors = sii_z_ex1_edgecolors)
# t$debug_description[37:45,]
# rbind(t$debug_level[1:13,],tail(t$debug_level,2))
#
#     testdata <- sii_z_ex1_data
#
#     testparams <- NULL
#     testparams$structuredf <- sii_z_ex1_structure
#     testparams$levelmax <- sii_z_ex1_levelmax
#     testparams$aggregatesuffix <- "_other"
#
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
#
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;test_result
#
#     rm(testparams); rm(testdata); rm(test_result)
#
#
#
#
#
#     testdata <- sii_z_ex2_data
#
#     testparams <- NULL
#     testparams$structuredf <- sii_structure_sf16_eng
#     testparams$levelmax <- sii_levelmax_sf16_993
#     testparams$aggregatesuffix <- "_other"
#
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
#
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;test_result
#
#     rm(testparams); rm(testdata); rm(test_result)
#
#
# # test ================================================================
#     testdata <- sii_z_ex3_data
#
#     testparams <- NULL
#     testparams$structuredf <- sii_structure_sf16_eng
#     testparams$levelmax <- sii_levelmax_sf16_993
#     testparams$aggregatesuffix <- "_other"
#
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
#
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;test_result
#
#     rm(testparams); rm(testdata); rm(test_result)
#
#
# ## an issue arose with a small dataset (only level 1,2,3 data), standard formula structure and levelmax (sii_structure_sf16). An issue arises when the levelmax introduces 'o'-lines on levels for which no data exists.
# ## the following is a structured test of all dataset, structure en levelmax combinations
#
# # test ================================================================
#     ## fixed parameters
#     testparams <- NULL
#     testparams$aggregatesuffix <- "_other"
#
# ## data 3, structure 3
#     testdata <- sii_z_ex3_data
#     testparams$structuredf <- sii_structure_sf16_eng
#     testparams$levelmax <- NULL
#
# sii_debug(data_descr = testdata$description,structure = testparams$structuredf,aggregatesuffix = testparams$aggregatesuffix,
#           levelmax = testparams$levelmax)
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result
#
#
#     testparams$levelmax <- 95
#
# sii_debug(data_descr = testdata$description,structure = testparams$structuredf,aggregatesuffix = testparams$aggregatesuffix,
#           levelmax = testparams$levelmax)
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result
#
#
#     testparams$levelmax <- sii_levelmax_sf16_993
#
# sii_debug(data_descr = testdata$description,structure = testparams$structuredf,aggregatesuffix = testparams$aggregatesuffix,
#           levelmax = testparams$levelmax)
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result
#
# ## data 4, structure 3
#
#     testdata <- sii_z_ex4_data
#     testparams$levelmax <- NULL
#
# sii_debug(data_descr = testdata$description,structure = testparams$structuredf,aggregatesuffix = testparams$aggregatesuffix,
#           levelmax = testparams$levelmax)
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result
#
#
#
#     testparams$levelmax <- 95
#
# sii_debug(data_descr = testdata$description,structure = testparams$structuredf,aggregatesuffix = testparams$aggregatesuffix,
#           levelmax = testparams$levelmax)
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result
#
#
#     testparams$levelmax <- sii_levelmax_sf16_993
#
# sii_debug(data_descr = testdata$description,structure = testparams$structuredf,aggregatesuffix = testparams$aggregatesuffix,
#           levelmax = testparams$levelmax)
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
# ## following line errors
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result
#
#
# ## data 3, structure 4
#
#     testdata <- sii_z_ex3_data
#     testparams$structuredf <- sii_z_ex4_structure
#     testparams$levelmax <- NULL
#
# sii_debug(data_descr = testdata$description,structure = testparams$structuredf,aggregatesuffix = testparams$aggregatesuffix,
#           levelmax = testparams$levelmax)
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result
#
#
#     testparams$levelmax <- 95
#
# sii_debug(data_descr = testdata$description,structure = testparams$structuredf,aggregatesuffix = testparams$aggregatesuffix,
#           levelmax = testparams$levelmax)
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result
#
#
#     testparams$levelmax <- sii_levelmax_sf16_993
#
# sii_debug(data_descr = testdata$description,structure = testparams$structuredf,aggregatesuffix = testparams$aggregatesuffix,
#           levelmax = testparams$levelmax)
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result
#
# ## data 3, structure 4
#     testdata <- sii_z_ex4_data
#     testparams$levelmax <- NULL
#
# sii_debug(data_descr = testdata$description,structure = testparams$structuredf,aggregatesuffix = testparams$aggregatesuffix,
#           levelmax = testparams$levelmax)
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result
#
#
#     testparams$levelmax <- 95
#
# sii_debug(data_descr = testdata$description,structure = testparams$structuredf,aggregatesuffix = testparams$aggregatesuffix,
#           levelmax = testparams$levelmax)
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result
#
#
#     testparams$levelmax <- sii_levelmax_sf16_993
#
# sii_debug(data_descr = testdata$description,structure = testparams$structuredf,aggregatesuffix = testparams$aggregatesuffix,
#           levelmax = testparams$levelmax)
# test_result <- ggsolvencyii:::fn_structure_expansion(testparams); test_result
# test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata); test_result
#
#
# ## ====================================================================== =====
#     rm(testparams) ; rm(testdata) ; rm(test_result)
# ## ====================================================================== =====
