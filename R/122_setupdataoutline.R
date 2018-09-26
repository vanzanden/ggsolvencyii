## functions in this file
##
## main:
##    fnSetupdata_outline
##
## small:
##
## # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


## fnSetupdata_outline # # # # ####################################################################################
#' fnSetupdata_outline
#'
#' @param data the data send by the geom_class
#' @param params the params send by the geom_classs
#'
#' @return an adjusted version of input dataframe data
# ' @exportnot
#'
# ' @examples

fnSetupdata_outline <- function(data, params) {
  ## CALL ##
    expandedstructure <- fn_structure_expansion ( params = params)

    datacopy <- dplyr::select(data, id, x, y,
                              description, compid = comparewithid)
    dataexclxy <- dplyr::select(data, -x, -y )
    dataexclxy <- dplyr::rename(dataexclxy, compid = id)
    data <- merge(x = dataexclxy, y = datacopy,
                  all.y = TRUE,
                  by = c("compid", "description") )
    data <- data[!is.na(data$value), ]
    data$comparewithid <- 1
    data <- dplyr::select(data, -compid)
    data <- as.data.frame(data)
  ## CALL ##
    data_out <- fn_structure_data_integration(expandedstructure = expandedstructure,
                                              data = data
                                              )
  ## return results
    return(data_out)
}
