
# most statistics are triggered by geom-tests

testresultA = ggsolvencyii:::statistics()
sii_setoption_statistics_remind(remind = FALSE)
sii_setoption_statistics_httpfailurecounter(cnt = 49)
testresultBa = ggsolvencyii:::statistics(caller = "404notfound.csv")
testresultBb = getOption("ggsolvencyii_statistics_participate")
testresultCa = ggsolvencyii:::statistics(caller = "404notfound.csv")
testresultCb = getOption("ggsolvencyii_statistics_participate")
testresultDa = ggsolvencyii:::statistics(caller = "404notfound.csv")
testresultDb = getOption("ggsolvencyii_statistics_participate")

testresultE = sii_setoption_statistics_participate(participate = TRUE, quiet = FALSE)


test_that("statistics" ,{
expect_equal( testresultA, "done")
  expect_equal( testresultBa, "done")
  expect_true( testresultBb)
  expect_equal( testresultCa, "done")
  expect_true( testresultCb)
  expect_equal( testresultDa, "done")
  expect_false( testresultDb)
  expect_true( testresultE)
})
