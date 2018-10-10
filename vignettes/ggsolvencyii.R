## ----init,echo=FALSE,results=FALSE,warnings=FALSE,message=FALSE----------
knitr::opts_chunk$set(collapse=TRUE,comment="#>",fig.path="ggsolvencyii-")
library(ggplot2)
library(ggsolvencyii)

## ---- out.width='25%', fig.align='right', echo=FALSE, border = FALSE-----
knitr::include_graphics('images/logo_engels_rvignettes.png')

## ----gh-installation, eval = FALSE---------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("vanzanden/ggsolvencyii")
#  # or from the binary in github.com/vanzanden/ggsolvencyii/binaries/windows

## ---- showcase,  echo = FALSE, message=FALSE,fig.asp = 0.7, fig.width=5----
        testdata <- sii_z_ex1_data[sii_z_ex1_data$id <= 7,]
        testdata <- testdata[testdata$time <= 2018,]

        testparams <- NULL
        testparams$structuredf <- sii_structure_sf16_eng # sii_z_ex_structure
        testparams$fillcolors <- sii_z_ex1_fillcolors
        testparams$edgecolors <- sii_z_ex1_edgecolors
        testparams$levelmax <- 99 #sii_z_ex1_levelmax
        testparams$aggregatesuffix <- "_other"
        testparams$plotdetails <-  sii_z_ex1_plotdetails

        testmaxscrvalue = NULL # 100
        testscalingx = .22 # 0.02
        testscalingy = 1 # 0.02
        testrotationdegrees = NULL # 10 # -10 # 70
        testrotationdescription = NULL # operational #  life # l_longevity # h_s_longevity
        testsquared = FALSE # TRUE

ggplot2::ggplot() +
    ggsolvencyii::geom_sii_risksurface(
        data = testdata[testdata$id == 1, ]
                                     , mapping = ggplot2::aes(
        x = time,
        y = ratio,
        value = value,  id = id, description = description, fill = description,
        color = description
                        ),
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
        maxscrvalue =  25.7433642812936,
                        scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,
        plotdetails = NULL,
        lwd = 0.25,
        alpha = 1
        ) +
  ggplot2::theme_bw() +
  ggplot2::scale_fill_manual(name = "risks", values = testparams$fillcolors) +
  ggplot2::scale_color_manual(name = "risks", values = testparams$edgecolors) +
  ggsolvencyii::geom_sii_risksurface(data = testdata, mapping = ggplot2::aes(
        x = time,
        y = ratio,
        value = value,  id = id, description = description, fill = description, color = description
                        ),
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,
        plotdetails = testparams$plotdetails,
        lwd = 0.25,
        alpha = 1.0
        ) +
  ggsolvencyii::geom_sii_riskconnection(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,      id = id), arrow = ggplot2::arrow(angle = 10, type = "open" ), alpha = 0.15) +
  ggsolvencyii::geom_sii_riskoutline(data = testdata, mapping = ggplot2::aes(
        comparewithid = comparewithid,
        x = time,
        y = ratio,
        value = value,  id = id, description = description
                        ),
        color = "red",
        lwd = 0.25,
        alpha = 0.6,
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,
        plotdetails = testparams$plotdetails) +
  ggsolvencyii::geom_sii_risksurface(
        data = testdata,
                          mapping = ggplot2::aes(
        x = time,
        y = ratio,
        value = value,  id = id, description = description, fill = description #,
        # color = description
                        ),
                        structuredf = testparams$structuredf, levelmax = testparams$levelmax, aggregatesuffix = testparams$aggregatesuffix,
                        maxscrvalue = testmaxscrvalue, scalingx = testscalingx, scalingy = testscalingy,rotationdegrees = testrotationdegrees,
                        rotationdescription = testrotationdescription, squared = testsquared,
        plotdetails = sii_z_ex1_plotdetails2,

        alpha = 0.15,
        color = NA
                        )


## cleanup ============================================================== =====
rm(testparams) ; rm(testdata) ; rm(testmaxscrvalue); rm(testrotationdegrees);rm(testrotationdescription); rm(testscalingx); rm(testscalingy); rm(testsquared)
## ====================================================================== =====

## ---- debug, echo=FALSE, eval = FALSE------------------------------------
#  t <- sii_debug(data_descr = sii_z_ex1_data$description,structure = sii_structure_sf16_eng,aggregatesuffix = "other", levelmax = sii_levelmax_sf16_995,plotdetails = sii_z_ex1_plotdetails, fillcolors = sii_z_ex1_fillcolors, edgecolors = sii_z_ex1_edgecolors)
#  knitr::kable(t$debug_description[37:45,])
#  knitr::kable(rbind(t$debug_level[1:13,],tail(t$debug_level,2)))

## ----origdata, echo = FALSE----------------------------------------------
t <- tidyr::spread(data = sii_z_ex1_data, key = description, value = value)
t <- as.data.frame(t)
t <- t[order(t$id),]
t <- dplyr::select( t, id, time, comparewithid, ratio, SCR, dplyr::everything())
t <- t[1:3 ,1:8]
knitr::kable(x = t)

## ----tidyversedata, echo = FALSE-----------------------------------------
t <- sii_z_ex1_data[sii_z_ex1_data$id <= 3,]
t <- t[1:8 ,]
knitr::kable(x = t)

## ----colorlist, echo = FALSE---------------------------------------------
t <- sii_x_fillcolors_sf16_eng
knitr::kable(head(t))

## ----example1,  warning = FALSE,fig.asp = 0.7, fig.width=5---------------
ggplot() +
  geom_sii_risksurface(
    data = sii_z_ex1_data[sii_z_ex1_data$id == 1, ],
    mapping = aes(x = time, y = ratio, id = id, value = value, 
                           description = description, 
                           fill = description, color = description) ) +
theme_bw() +
scale_fill_manual(name = "Risks",values = sii_x_fillcolors_sf16_eng) +
scale_color_manual(name = "Risks",values = sii_x_edgecolors_sf16_eng)


## ----structuretext, eval = FALSE-----------------------------------------
#  head(sii_structure_sf16_eng, 13)

## ----structure, echo = FALSE---------------------------------------------
t <- sii_structure_sf16_eng
knitr::kable(head(t,15))

## ----levelmaxtext, eval = FALSE------------------------------------------
#  sii_levelmax_sf16_993

## ----levelmax------------------------------------------------------------
knitr::kable(head(sii_levelmax_sf16_993))

## ----examplelevelmax,  warning = FALSE, message = FALSE,fig.asp = 0.7, fig.width=5----
ggplot() +
  geom_sii_risksurface(
    data = sii_z_ex2_data,
    mapping = aes(x = time, y = ratio, id = id, value = value, 
                           description = description, 
                           fill = description, color = description),
                  levelmax = sii_levelmax_sf16_993) +
theme_bw() +
scale_fill_manual(name = "Risks",values = sii_x_fillcolors_sf16_eng) +
scale_color_manual(name = "Risks",values = sii_x_edgecolors_sf16_eng)


## ----rotationsquare, warning = FALSE, message = FALSE,fig.asp = 0.7, fig.width=5----
ggplot() +
  geom_sii_risksurface(
    data = sii_z_ex2_data,
    mapping = aes(x = time, y = ratio, id = id, value = value, 
                           description = description, 
                           fill = description, color = description),
                  squared = TRUE,
                  rotationdescription = 'm_equity',
                  rotationdegrees = -45) +
theme_bw() +
scale_fill_manual(name = "Risks",values = sii_x_fillcolors_sf16_eng) +
scale_color_manual(name = "Risks",values = sii_x_edgecolors_sf16_eng)

## ---- circlesquare, echo=FALSE, fig.asp = 1, fig.width=5-----------------
## vergelijk grootte van rond en square in een figuur =================== =====

ggplot2::ggplot() +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = 10, y = 5 , id = id, value = value
                                     ,description = description
                                    ,fill = description
                                    ,color = description
                                    ),
              # color = NA
              lwd = .75
              ,alpha = 0.6,
              show.legend = FALSE
  ) +
  geom_sii_risksurface(data = sii_z_ex2_data,
              mapping = ggplot2::aes(x = 10, y = 5 , id = id, value = value,
                            description = description
                            ,fill = description
                                        ),
              color = "black",
              lwd = .5,
              squared = TRUE,
              # rotationdegrees = 45,
              alpha = .2,
              show.legend = FALSE
   )

