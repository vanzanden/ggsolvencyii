# tests ========================================================= =====

testparams <- NULL

testparams$structuredf <- sii_structure_sf16_eng # sii_z_ex_structure
testparams$levelmax <- 99 # sii_levelmax_995 # sii_z_ex_levelmax
testparams$aggregatesuffix <- "_other"
testparams$outline <- sii_outline_sf16_eng # sii_z_ex_outline

testdata <- sii_z_ex2_data

testmaxscrvalue = NULL # 100
testscalingx = 1 # 0.02
testscalingy = 1 # 0.02
testrotationdegrees = NULL # 10 # -10 # 70
testrotationdescription = NULL # operational #  life # l_longevity # h_s_longevity
testsquared = FALSE # TRUE

                          sii_debug(data_descr = testdata$description,
                                    structure = testparams$structuredf,
                                    aggregatesuffix = testparams$aggregatesuffix,
                                    levelmax = testparams$levelmax
                          )

                          test_result <- ggsolvencyii:::fn_structure_expansion(testparams) ; test_result

                          test_result <- ggsolvencyii:::fn_structure_data_integration(expandedstructure = test_result, data = testdata) ;

                          ggplot2::ggplot() +
                          ggsolvencyii::geom_siiscrbuildup(data = testdata,
                                                    mapping = ggplot2::aes(
x = time,
y = ratio,
                                                    id = id, value = value, description = description,
                                                    fill = description, color = description),
lwd = 0.5,
                              structuredf = testparams$structuredf,
                              levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                              maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,
                              rotationdegrees = testrotationdegrees, rotationdescription = testrotationdescription,
                              squared = testsquared
                          ) +
                          ggplot2::ggplot2::theme_bw() +
                          ggplot2::ggplot2::scale_fill_manual(name = "Componenten", values = ggsolvencyii::sii_x_fillcolors_sf16_eng
                          ) +
                          ggplot2::ggplot2::scale_color_manual(name = "Componenten", values = ggsolvencyii::sii_x_edgecolors_sf16_eng
                          ) +
                          ggsolvencyii::geom_siiscroutline(data = testdata,
                                                            mapping = ggplot2::aes(
x = time,
y = ratio,
                                                            id = id, value = value, description = description, comparewithid = comparewithid),
color = "red",
lwd = 0.7,
alpha = 0.99,
                              outlinedf = testparams$outline,
                              structuredf = testparams$structuredf,
                              levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                              maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,
                              rotationdegrees = testrotationdegrees, rotationdescription = testrotationdescription,
                              squared = testsquared
                          ) +
                          ggsolvencyii::geom_siiconnection(data = testdata,
                                                              mapping = ggplot2::aes(
x = time,
y = ratio,
                                                              id = id,comparewithid = comparewithid),
                              arrow = ggplot2::arrow(angle = 20,
                                            type = "closed" )
                          )

rm(testparams) ; rm(testdata) ;rm(test_result); rm(testmaxscrvalue); rm(testrotationdegrees);rm(testrotationdescription); rm(testscalingx); rm(testscalingy); rm(testsquared)

