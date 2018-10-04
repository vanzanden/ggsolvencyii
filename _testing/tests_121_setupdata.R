# tests ================================================================
testparams <- NULL

testparams$structuredf <- sii_structure_sf16_eng
testparams$levelmax <- sii_levelmax_sf16_993
testdata <- sii_z_ex2_data

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

testparams$structuredf <- sii_z_ex3_structure
testparams$levelmax <- sii_z_ex3_levelmax
testdata <- sii_z_ex3_data

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
testparams$levelmax <- sii_z_ex3_levelmax
testdata <- sii_z_ex3_data

testparams$aggregatesuffix <- "_other"

sii_debug(data_descr = testdata$description,
          structure = testparams$structuredf,
          aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax
          )

test_result <- ggsolvencyii:::fn_structure_expansion(testparams)
test_result
## testlevelordering <- as.list(test1_result$description)


test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata)
test_result
## test_result$description <-  factor(test_result$description, levels = test1levelordering )

rm(testparams) ; rm(testdata) ;rm(test_result)
## rm(test1levelordering)






# tests =======nationale nederlanden structure ==================================================
testparams <- NULL

testparams$structuredf <- sii_z_ex7_structure
testparams$levelmax <- 99
testdata <- sii_z_ex7_data

testparams$aggregatesuffix <- "_other"

sii_debug(data_descr = testdata$description,
          structure = testparams$structuredf,
          aggregatesuffix = testparams$aggregatesuffix,
          levelmax = testparams$levelmax
          )

test_result <- ggsolvencyii:::fn_structure_expansion(testparams)
test_result


test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata)
test_result

rm(testparams) ; rm(testdata) ;rm(test_result)




