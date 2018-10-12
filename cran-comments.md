---
title: "cran-comments"
author: "Marco van Zanden"
date: "11 oktober 2018"
output: html_document
---

## version 0.9.0, CRAN comments and **actions taken**, 
October 12 2018

Thanks, we see:

   The Title field should be in title case. Current version is:
   'A ggplot2-plot Of Composition Of SOLVENCY II SCR: SF and IM'
   In title case that is:
   'A ggplot2-Plot of Composition of SOLVENCY II SCR: SF and IM'

**changed in 'A 'ggplot2'-Plot of Composition of Solvency II SCR: SF and IM'** 

Also, pls single quote software names such as 'ggplot2' in Title and 
Description fields.

**done**

### new test build_win()
passed with 3 NOTEs:

* checking CRAN incoming feasibility ... NOTE
* Maintainer: 'Marco van Zanden <git@vanzanden.nl>'
    * New submission

** running examples for arch 'i386' ... [20s] NOTE<p>
Examples with CPU or elapsed time > 10s<p>
                      user system elapsed<p>
geom_sii_riskoutline 10.05      0   10.12<p>
<p>
** running examples for arch 'x64' ... [20s] NOTE<p>
Examples with CPU or elapsed time > 10s<p>
                      user system elapsed<p>
geom_sii_riskoutline 10.01   0.07   10.13<p>

**one example has been outcommented, will show in man-page as a comment**


---

## version 0.9.0, first submit, 
October 11 2018

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
