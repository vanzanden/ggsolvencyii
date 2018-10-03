## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- out.width='35%', fig.align='right', echo=FALSE, border = FALSE-----
knitr::include_graphics('images/logo_engels.png')

## ---- fig.show='hold'----------------------------------------------------
plot(1:10)
plot(10:1)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(mtcars, 10))

## ---- echo=FALSE, results='asis'-----------------------------------------
ggplot2::ggplot() +
 ggsolvencyii::geom_solviioutline(data = ggsolvencyii::sii_z_example2_data,
  mapping = ggplot2::aes(x = time, y = ratio, id = id, value = value, description = description,
                          comparewithid = comparewithid),
    color = "red", lwd = .5 )

