
# ggsolvencyii development


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

