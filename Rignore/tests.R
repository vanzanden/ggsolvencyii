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


sii_debug(data_descr = sii_z_example2_data$description,
          fillcolor = sii_x_fillcolors_sf16_eng,
          edgecolor = sii_x_edgecolors_sf16_eng,
          # structure_descr = sii_structure_sf16_eng$description,
          # structure_level = sii_structure_sf16_eng$level,
          # levelmax_level =  sii_levelmax_sf16_995$level,
          # outline_levelordescr = sii_outline_sf16_eng$levelordescription
          structure = sii_structure_sf16_eng,
          # structure_level = sii_structure_sf16_eng$level,
          levelmax =  sii_levelmax_sf16_995,
          outline = sii_outline_sf16_eng
          )

sii_debug(data_descr = sii_z_example5_data$description,
          fillcolor = sii_x_fillcolors_sf16_nld,
          edgecolor = sii_x_edgecolors_sf16_nld,
          # structure_descr = sii_structure_sf16_eng$description,
          # structure_level = sii_structure_sf16_eng$level,
          # levelmax_level =  sii_levelmax_sf16_995$level,
          # outline_levelordescr = sii_outline_sf16_eng$levelordescription
          structure = sii_structure_sf16_nld,
          # structure_level = sii_structure_sf16_eng$level,
          levelmax =  sii_levelmax_sf16_995,
          outline = sii_outline_sf16_nld
          )



 ggplot2::ggplot() +
 geom_solviioutline(data = sii_z_example5_data,
   mapping = ggplot2::aes(x = tijd, y = ratio, id = id, value = waarde, description = description,
                          comparewithid = vergelijkmet),
   structuredf = sii_structure_sf16_nld,
   outlinedf = sii_outline_sf16_nld,
   color = "red", lwd = .5 ,
   rotationdescription = "leven",
   rotationdegrees = -8
   # ,
   # squared =  TRUE,

   )


