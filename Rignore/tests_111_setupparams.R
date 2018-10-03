## test 1
testparams <- NULL

testparams$structuredf <- sii_structure_sf16_eng
testdata <- sii_z_example1_data

test_result <- ggsolvencyii:::fn_levelonedescription(testparams)
test_result
testparams <- NULL
testparams$levelonedescription <- test_result
test_result <- ggsolvencyii:::fn_maxscrvalue(data = testdata, params = testparams)
rm(testparams) ; rm(testdata);rm(test_result)

## test 2
testparams <- NULL

testparams$structuredf <- sii_structure_sf16_nld
testdata <- sii_z_example5_data
testdata$value <- testdata$waarde

test_result <- ggsolvencyii:::fn_levelonedescription(testparams)
test_result
testparams <- NULL
testparams$levelonedescription <- test_result
test_result <- ggsolvencyii:::fn_maxscrvalue(data = testdata, params = testparams)
rm(testparams) ; rm(testdata);rm(test_result)



## test 3
testparams <- NULL

testparams$structuredf <- sii_z_example3_structure
testdata <- sii_z_example3_data

test_result <- ggsolvencyii:::fn_levelonedescription(testparams)
test_result
testparams <- NULL
testparams$levelonedescription <- test_result
test_result <- ggsolvencyii:::fn_maxscrvalue(data = testdata, params = testparams)
rm(testparams) ; rm(testdata); rm(test_result)




