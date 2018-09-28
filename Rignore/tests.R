## tests
# testvector <- c("1","2","2","2d","3","3.01","3.01","3.01","3.01","3.01d","3.01o")

# testvector2 <- c("1","2","2","2d","3","3.01","3.01","3.01","3.01","3.01d")
# testvector <- sii_structure_sf16_eng$level
# testvector <- c("1","2.01","2.01d","3", "3d")
# testvector
# fn_determinelevels(testvector)
## expected: [1] "1"     "2"     "2d"    "3d"    "3"     "4.01d" "4.01"  "4.02d" "4.02"  "4.03d" "4.03"  "4.04d" "4.04"  "5.01d" "5.01"
# fn_determinelevels(testvector, ind_d=FALSE)
## expected: [1] "1"    "2"    "3"    "4.01" "4.02" "4.03" "4.04" "5.01"
# fn_determinelevels(testvector, ind_value = TRUE)
## expected: [1] 1.00 2.00 3.00 4.01 4.02 4.03 4.04 5.01
# fn_determinelevels(testvector, ind_integer = TRUE)
## expected: [1] 1 2 3 4 5
# fn_determinelevels(testvector, ind_onlyspecials = TRUE)
## expected: [1] "2d"    "3d"    "4.01d" "4.02d" "4.03d" "4.04d" "5.01d"
# fn_determinelevels(testvector, ind_d = FALSE, ind_onlyspecials = TRUE)
# fn_determinelevels(testvector2, ind_d = FALSE, ind_onlyspecials = TRUE)
## expected: character(0)
# rm(testvector)


