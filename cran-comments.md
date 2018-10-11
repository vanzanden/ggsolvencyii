---
title: "cran-comments"
author: "Marco van Zanden"
date: "11 oktober 2018"
output: html_document
---

## version 0.9.0

devtools::release() resulted in 1 WARNING, 1 NOTE

devtools version 1.13.6

#### WARNING (1)
    * checking PDF version of manual ... WARNING
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    LaTeX errors found:
    !pdfTeX error: pdflatex (file t1-zi4r-0): Font t1-zi4r-0 at 540 not found
     ==> Fatal error occurred, no output PDF file produced!
    * checking PDF version of manual without hyperrefs or index ... OK
    * DONE
This is a local issue because.

1) testing on travis.com passed without errors

2) devtools::build_win() passed with 1 NOTE
    * checking CRAN incoming feasibility ... NOTE
    * Maintainer: 'Marco van Zanden <git@vanzanden.nl>'
        * New submission
    * ...
    * checking PDF version of manual ... OK
    * DONE
    * status: 1 NOTE

#### NOTE (1)
* checking CRAN incoming feasibility ... NOTE
* Maintainer: 'Marco van Zanden <git@vanzanden.nl>'
    * New submission

---
