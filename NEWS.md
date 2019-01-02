
# ggsolvencyii development


## version 0.1.2, January 2019 

- correction of typos in 'description' in data and structure files of example 6 (Internal model) 
- correcting CRAN- link title OF vignettes
- adapting as result of changes in packages on which ggsolvencyii depends:
    - devtools version 2.x : code from devtools::use_data() to usethis::use_data() 
    - dplyr version 0.8.0 (release planned feb 1,2019) : 
    
      "Functions like n(), row_number() ... that are typically used in dplyr verbs must now be imported when used in packages and scripts, otherwise the error Error in n() : could not find function "n" will appear."


## version 0.1.1, November 2018 

- function 'sii_debug' renamed to 'sii_debug_geom' in preparation of possible further solvencyii functions

- testing:
    - changing from informal testing to formal testing ('testthat') 
    - improving error handling
    - implementing code_coverage code (in travis) and badge to `README`
    - implementing appveyor code and badge 

- documentation, 
    - several typos corrected
    - vignette `coding overview` is not a placeholder anymore
    - removing vignettes `geom_sii_risksurface`, `geom_sii_riskoutline`, `geom_sii_riskconnection`
    - removing internal functions from the pdf

- preparation for version 0.2.0
    - preparatory lines for parameters `relalpha`  and `tocenter`)
    
- backtesting
    - Depends: R (>= 3.4.0) (was >= 3.5.0)

## version 0.1.0, October 2018

initial release, see how much interest this package attracts before further development and documentation.

