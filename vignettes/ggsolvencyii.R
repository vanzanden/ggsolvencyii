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

