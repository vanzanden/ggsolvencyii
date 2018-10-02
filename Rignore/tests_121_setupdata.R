# tests ================================================================
testparams <- NULL
testparams$structuredf <- sii_structure_sf16_eng
testparams$levelmax <- sii_levelmax_sf16_993
testparams$aggregatesuffix <- "_other"
test1_result <- ggsolvencyii:::fn_structure_expansion(testparams)
test1_result
test1levelordering <- as.list(test1_result$description)


test2_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test1_result, data = sii_z_example2_data)
test2_result
test2_result$description <-  factor(test2_result$description, levels = test1levelordering )

