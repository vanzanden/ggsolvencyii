## functions in this file =============================================== =====
##
## main:
##    fnSetupdata_connection
##
## small:
##
## ====================================================================== =====

## fnSetupdata_connection =============================================== =====
#' fnSetupdata_connection
#'
#' @param data the data send by the geom_class, due to the simple nature of the desired plot no structure information is needed.
#'
#' @importFrom magrittr %>%
#'
#' @return an adjusted version of input dataframe data
# ' @exportnot
#'
# ' @examples

fnSetupdata_connection <- function(data) {
        df <- data
        df2 <- dplyr::select(df, id, x, y, comparewithid)
        data <- data[!duplicated(df2), ]
        datacopy <- data %>%
          dplyr::rename(compid = comparewithid) %>%
          dplyr::rename(xend = x, yend = y) %>%
          dplyr::select(compid, xend, yend, id)
        dataadj <- data %>%
          dplyr::mutate(compid = id) %>% ## mutate because id is needed later on
          dplyr::select(-id)
        data <- merge(x = dataadj, y = datacopy,
                      all.y = TRUE, by = c("compid") )
        data <- data[!is.na(data$x), ]
        data$group <- data$id
        data$comparewithid <- data$id
        data <- as.data.frame(data)
      ## return results
        return(data)
    }
