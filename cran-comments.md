---
title: "cran-comments"
author: "Marco van Zanden"
date: "November 19 2018"
output: html_document
---

### version 0.1.2, CRAN comments 
r version: 3.5.2
r studio version: 1.1.463
devtools version: 2.0.1


check_win_devel finished only with issues in vignette creating

=======




### version 0.1.1, CRAN comments 
r version: 3.5.1
r studio version: 1.1.463
devtools version: 2.0.1


check_win_devel finished without issues

=======

check_rhub - results

   http://builder.r-hub.io/status/ggsolvencyii_0.1.1.tar.gz-afc1f814186e497d826ab86042e3cc35

  checking examples ... NOTE
  Examples with CPU or elapsed time > 5s
                       user system elapsed
  geom_sii_riskoutline 8.20   0.04    8.26
  geom_sii_risksurface 5.05   0.02    5.09

0 errors √ | 0 warnings √ | 1 note x

 http://builder.r-hub.io/status/ggsolvencyii_0.1.1.tar.gz-09823e7efc7d4253a4ddd1ad6d0a45b2

failure: 
ERROR: this R is version 3.4.4, package 'ggsolvencyii' requires R >= 3.5.0

http://builder.r-hub.io/status/ggsolvencyii_0.1.1.tar.gz-50cbe90770324bc7a358b33ba7d00a79
   
* checking re-building of vignette outputs ... WARNING

4581#> Error in re-building vignettes:
4582#> ...
4583#> Warning in (function (filename = "Rplot%03d.png", width = 480, height = 480, :
4584#> unable to open connection to X11 display ''
4585#> Quitting from lines 74-75 (coding_overview.Rmd)
4586#> Error: processing vignette 'coding_overview.Rmd' failed with diagnostics:
4587#> unable to start device PNG 

this seems a local problem

==============================================================

### version 0.1.0, CRAN comments, Release to CRAN

Subject: Re: CRAN submission ggsolvencyii 0.1.0
From: Uwe Ligges 
Date: Sun, 28 Oct 2018 23:20:18 +0100

Thanks, on its way to CRAN.

Best,
Uwe Ligges

 
### version 0.1.0, CRAN comments and **actions taken**
October 19, 2018

**I reset versioning from 0.9.0 to 0.1.0.**

Thanks, please replace the semicolon by a period in "are provided; The" 
(Description text).

Please explain all acronyms (e.g. ORSA, SCR) in your Description text to 
avoid misunderstandings.

Please fix and resubmit.

Best,
Swetlana Herbrandt

**done**

#### new test build_win()
* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Marco van Zanden <git@vanzanden.nl>'

New submission

Possibly mis-spelled words in DESCRIPTION:
  IM (2:67, 10:106)
  ORSA (12:88)
  SCR (2:55, 6:125, 9:85, 12:39)
  de (9:82)

**misspelling of 'de' adjusted to 'the', (issue with branches, hence recurring problem)

Found the following (possibly) invalid URLs:
  URL: https://www.r-pkg.org/pkg/ggsolvencyii
    From: inst/doc/ggsolvencyii.html
    Status: 404
    Message: Not Found
    
** badges removed in vignette  **  
** no rerun of build_win()**



---

### version 0.9.0(versioning reset on October 19), CRAN comments and **actions taken**
October 13, 2018

Thanks, we see

Last time I wrote

"Also, pls single quote software names such as 'ggplot2' in Title and 
Description fields."

You did not do so for the Description field.

**apologies. I had used a search and replace on 'ggplot2', while Description had 'ggplot' **

Is there some reference about the method you can add in the Description 
field in the form Authors (year) <doi:.....>?

**The method is European legislation for insurance companies. **
**Description field has been changed to:**

***An implementation of 'ggplot2'-methods to present the composition of Solvency II SCR as*** 
***a series of concentric circle-parts. Solvency II (Solvency 2) is European insurance*** 
***legislation, coming in force by the delegated acts of October 10, 2014.*** ***(https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=OJ%3AL%3A2015%3A012%3ATOC).*** 
***Additional files, defining the structure of the Standard Formula (SF) method*** 
***of de SCR-calculation are provided; The structure files can be adopted for localization***
***or for insurance companies who use Internal Models (IM). Options are available for ***
***combining smaller components (i.e. risks), horizontal and vertical scaling, rotation,*** 
***and plotting only some or the circle-segments. With outlines and connectors several*** 
***SCR-compositions can be compared, for example in ORSA scenarios.***


We also see:

License components with restrictions and base license permitting such:

   GPL-3 + file LICENSE

   File 'LICENSE':

                         GNU GENERAL PUBLIC LICENSE

                            Version 3, 29 June 2007

  ...

Please do not ship the full GPL. File LICENSE is only intended for 
additional restrictions. If there are none, delete the file and its 
reference in the DESCRIPTION file.

**done**

#### new test build_win()
passed with 1 NOTE:

* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Marco van Zanden <git@vanzanden.nl>'

New submission

Possibly mis-spelled words in DESCRIPTION:
  IM (2:67, 10:106)
  ORSA (12:88)
  SCR (2:55, 6:95, 9:85, 12:39)
  de (9:82)

**misspelling of 'de' adjusted to 'the', no rerun of build_win()**

---

### version 0.9.0(versioning reset on October 19), CRAN comments and **actions taken**, 
October 12, 2018

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

## version 0.9.0 (versioning reset on October 19), first submit, 
October 11, 2018

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
