
sii_debug(data_descr = sii_z_example3_data$description,
          structure = sii_z_example3_structure,
          levelmax = sii_z_example3_levelmax
)

sii_debug(data_descr = sii_z_example3_data$description,
          structure = sii_structure_sf16_eng,
          levelmax = sii_z_example3_levelmax
)






## test of a compact dataset in a compact structure
ggplot2::ggplot() +
  geom_solvii(data = sii_z_example3_data,
                        mapping = ggplot2::aes(x = time,
                                               y = ratio,
                                               id = id,
                                               value = value,
                                               description = description,
                                               fill = description,
                                               color = description)
                        , structuredf = sii_z_example3_structure
                        , levelmax = sii_z_example3_levelmax

              ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)



## test of a compact dataset in a full structure, geen levelmax meegegeven
ggplot2::ggplot() +
  geom_solvii(data = sii_z_example3_data,
                        mapping = ggplot2::aes(x = time,
                                               y = ratio,
                                               id = id,
                                               value = value,
                                               description = description,
                                               fill = description,
                                               color = description)
                        ,  structuredf = sii_structure_sf16_eng
                        # , geen levelmax meegegeven

              ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)


## test of a compact dataset in a full structure (levelmax = 95)
ggplot2::ggplot() +
  geom_solvii(data = sii_z_example3_data,
                        mapping = ggplot2::aes(x = time,
                                               y = ratio,
                                               id = id,
                                               value = value,
                                               description = description,
                                               fill = description,
                                               color = description)
                        , structuredf = sii_structure_sf16_eng
                        , levelmax = 95

              ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)






## test of a compact dataset in a full structure
ggplot2::ggplot() +
  geom_solvii(data = sii_z_example3_data,
                        mapping = ggplot2::aes(x = time,
                                               y = ratio,
                                               id = id,
                                               value = value,
                                               description = description,
                                               fill = description,
                                               color = description)
                        , structuredf = sii_structure_sf16_eng
                        , levelmax = sii_z_example3_levelmax

              ) +
  theme_bw() +
  scale_fill_manual(name = "Componenten",values = sii_x_fillcolors_sf16_eng) +
  scale_color_manual(name = "Componenten",values = sii_x_edgecolors_sf16_eng)

