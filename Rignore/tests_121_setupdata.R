# tests ================================================================
testparams <- NULL

testparams$structuredf <- sii_structure_sf16_eng
testparams$levelmax <- sii_levelmax_sf16_993
testdata <- sii_z_example2_data

testparams$aggregatesuffix <- "_other"
test_result <- ggsolvencyii:::fn_structure_expansion(testparams)
test_result
## testlevelordering <- as.list(test1_result$description)


test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata)
test_result
## test_result$description <-  factor(test_result$description, levels = test1levelordering )

rm(testparams)
rm(test_result)
## rm(test1levelordering)


# tests ================================================================
testparams <- NULL

testparams$structuredf <- sii_z_example3_structure
testparams$levelmax <- sii_z_example3_levelmax
testdata <- sii_z_example3_data

testparams$aggregatesuffix <- "_other"
test_result <- ggsolvencyii:::fn_structure_expansion(testparams)
test_result
## testlevelordering <- as.list(test1_result$description)


test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata)
test_result
## test_result$description <-  factor(test_result$description, levels = test1levelordering )

rm(testparams) ; rm(testdata) ;rm(test_result)
## rm(test1levelordering)


# tests =======volledige structure, met beperkte levelmax ==================================================
testparams <- NULL

testparams$structuredf <- sii_structure_sf16_eng
testparams$levelmax <- sii_z_example3_levelmax
testdata <- sii_z_example3_data

testparams$aggregatesuffix <- "_other"
test_result <- ggsolvencyii:::fn_structure_expansion(testparams)
test_result
## testlevelordering <- as.list(test1_result$description)


test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata)
test_result
## test_result$description <-  factor(test_result$description, levels = test1levelordering )

rm(testparams) ; rm(testdata) ;rm(test_result)
## rm(test1levelordering)

