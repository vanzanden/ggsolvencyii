
sii_debug(data_descr = sii_z_example7_data$description,
          structure = sii_z_example7_structure,
          outline = sii_z_example7_outline,
          levelmax = sii_z_example7_levelmax
      )



ggplot2::ggplot() +
  geom_solvii(data = sii_z_example7_data,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              ),
              structuredf =  sii_z_example7_structure,
              levelmax = 99
              ) +
  theme_bw()
+
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


exampledata <- sii_z_example7_data
exampledata$id <- 2
exampledata$comparewithid <- 1
exampledata$time <- 5
exampledata <- rbind(exampledata,sii_z_example7_data)

ggplot2::ggplot() +
  geom_solvii(data = exampledata,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,fill = description
                            ,color = description
              ),
              structuredf =  sii_z_example7_structure,
              levelmax = 99
              ) +
  theme_bw() +
  geom_solviioutline(data = exampledata,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,comparewithid = comparewithid
              ),
              structuredf =  sii_z_example7_structure,
              levelmax = 99,
              color = "red",
              lwd = 1
              ) +
  theme_bw()



ggplot2::ggplot() +
  geom_solvii(data = exampledata,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,color = description
              ),
              fill = NA,
              structuredf =  sii_z_example7_structure,
              levelmax = sii_z_example7_levelmax
              ) +
  theme_bw()

+
  geom_solviioutline(data = exampledata,
              mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value, description = description
                            ,comparewithid = comparewithid
              ),
              structuredf =  sii_z_example7_structure,
              levelmax = sii_z_example7_levelmax,
              color = "red",
              lwd = 2
              ) +
  theme_bw()

rm(exampledata)

