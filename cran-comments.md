---
title: "cran-comments"
author: "Marco van Zanden"
date: "October 13 2018"
output: html_document
---

### version 0.9.0, CRAN comments and **actions taken**
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

---

### version 0.9.0, CRAN comments and **actions taken**, 
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

## version 0.9.0, first submit, 
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
