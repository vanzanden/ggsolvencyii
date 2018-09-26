## functions in this file =============================================== =====
##
## main:
##
## small:
##    fnlevelonedescription
##    fnmaxscrvalue
## ====================================================================== =====

## fnlevelonedescription ======================================================== =====
#' fnlevelonedescription extracts the name of level 1 item from the structure
#'
#' @inheritParams fnmaxscrvalue
# '  @param params the params send by the geom_class, possible adjusted by setup_params.
#'
#' @return the value maxscrvalue, whether or not this is provided by the user
# ' @exportnot
#'
# ' @examples

fnlevelonedescription <- function(params) {
    structuredf     <- params$structuredf
    levelonedescription <- structuredf$description[structuredf$level == 1]
  ## return results
    return(levelonedescription)
}



## fnmaxscrvalue ======================================================== =====
#' fnmaxscrvalue
#' all elements in the resulting dataset are scaled to surface of value of the largest level 1 (SCR) element
#'  in the set, unless the value to be scaled to is provided as a parameter.
#'
#' @param data the data send by the geom_class, the result of the integration of user supplied data and expanded structure .
#' @param params the params send by the geom_class, possible adjusted by setup_params.
#'
#' @return the value maxscrvalue, whether or not this is provided by the user.
# ' @exportnot
#'
# ' @examples

fnmaxscrvalue <- function(data, params
                          ) {
      structuredf     <- params$structuredf
      levelonedescription <- structuredf$description[structuredf$level == 1]
      ## afleiden maxscrvalue for scaling
        if (!is.null(params$maxscrvalue)) {
          value_out <- params$maxscrvalue
          print(paste0("scaling is based on inputvalue (maxscrvalue) of ",
                       value_out))
        } else {
          value_out <- max(data$value[data$description == levelonedescription])
          # if (value_out == -Inf) {
          #   value_out <- 50
          #   print(paste0("The (default)value of variable 'levelonedescription': ",
          #                params$levelonedescription,
          #                ", is not found in the dataset. "))
          #   print(paste0("  It might be neccesary to include attribution to this parameter in the call to geom_"))
          #   print(paste0("  scaling is based on a ARBITRARY max (level= 1) value of ",
          #                value_out ))
          # } else {
            print(paste0("scaling is based on a max (level= 1) value of ",
                         value_out ))
          # }
        }
      ## return results
        return(value_out)
    }
