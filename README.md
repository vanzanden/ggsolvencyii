
<!-- README.md is generated from README.Rmd. Please edit that file -->
ggsolvencyii
============

The goal of ggsolvencyii is to show the buildup ("build-down") of the Solvency II SCR from the individual risks.

ggsolvencyii builds on ggplot-functionality and provides three geom's , and .

For troubleshooting provides an overview of present risk descriptions and levels in the data and supporting tables

Travis status
-------------

[![Travis-CI.com Build Status](https://travis-ci.com/vanzanden/ggsolvencyii.svg?branch=master)](https://travis-ci.com/vanzanden/ggsolvencyii) [![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

<!-- 
[![Build status](https://ci.appveyor.com/api/projects/status/github/vanzanden/ggsolvencyii?branch=master)](https://ci.appveyor.com/project/vanzanden/ggsolvencyii/branch/master)
[![version](http://www.r-pkg.org/badges/version/ggsolvencyii)](https://CRAN.R-project.org/package=ggsolvencii)
![cranlogs](http://cranlogs.r-pkg.org./badges/ggsolvencyii)
[![codecov](https://codecov.io/gh/vanzanden/ggsolvencyii/branch/master/graph/badge.svg)](https://codecov.io/gh/vanzanden/ggsolvencyii)
-->
<img src="vignettes/images/logo_engels_rvignettes.png" width="25%" style="display: block; margin: auto 0 auto auto;" />

Installation
------------

You can install ggsolvencyii from github with:

``` r
# install.packages("devtools")
devtools::install_github("vanzanden/ggsolvencyii")
```

Example
-------

An life insurer reports its solvency ratio following Standard Formula rules, with English names for all risks. The original data is the following:

    #> [1] 2

``` r
ggplot2::ggplot() +
  ggsolvencyii::geom_sii_risksurface(
    data = ggsolvencyii::sii_z_ex2_data,
    mapping = ggplot2::aes(x = time, y = ratio, id = id, value = value, 
                           description = description, 
                           fill = description, color = description) ) +
ggplot2::theme_bw() +
ggplot2::scale_fill_manual(name = "Risks",values =    
                             ggsolvencyii::sii_x_fillcolors_sf16_eng) +
ggplot2::scale_color_manual(name = "Risks",values =
                             ggsolvencyii::sii_x_edgecolors_sf16_eng)
```

![](README-example-1.png)

    #> [1] "scaling is based on a max (level= 1) value of 30"
