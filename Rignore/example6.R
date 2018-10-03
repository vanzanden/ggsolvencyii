## basistest regel 1, tonen resultaten
 ggplot2::ggplot() +
  geom_solvii(data = sii_z_example6_data[sii_z_example6_data$id == 1,],
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                             lwd = 0.05
               ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


 ## basistest, tonen resultaten
 ggplot2::ggplot() +
  geom_solviioutline(data = sii_z_example6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             comparewithid = comparewithid
                             ),
                             lwd = 0.05
               ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


 ## alles, default outline
 ggplot2::ggplot() +
  geom_solvii(data = sii_z_example6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                             lwd = 0.05
               ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng) +
  geom_solviioutline(data = sii_z_example6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             comparewithid = comparewithid
                             ),
                             lwd = 0.1,
                              color = "red"
               )



 ## alles, custom outline

 ggplot2::ggplot() +
  geom_solvii(data = sii_z_example6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             fill = description, color = description
                             ),
                             lwd = 0.05
                             ,color = "red"
               ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng) +
  geom_solviioutline(data = sii_z_example6_data,
               mapping = ggplot2::aes(x = time, y = ratio , id = id, value = value,
                             description = description,
                             comparewithid = comparewithid

                             ),
                             lwd = 0.05,
               outline = sii_z_example6_outline
               )

