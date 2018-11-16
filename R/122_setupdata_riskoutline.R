## GNU General Public License version 3 , see file LICENCE ============== =====
##
##    sourcefile of package 'ggsolvencyii'
##    Copyright (C) <2018>  < Marco van Zanden , git@vanzanden.nl >
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <https://www.gnu.org/licenses/>.
##
##
## functions in this file =============================================== =====
##
## main:
##    fn_setupdata_outline
##
## small:
##
## ====================================================================== =====
##
##
## fn_setupdata_outline ================================================= =====
#' fn_setupdata_outline
#'
#' @inheritParams fn_maxscrvalue
# ' @param data the data send by the geom_class
# ' @param params the params send by the geom_classs
#'
#' @return an adjusted version of input dataframe data
# ' @exportnot
#'
# ' @examples

fn_setupdata_outline <- function(data, params) {
  ## CALL ##
    expandedstructure <- fn_structure_expansion( params = params)

      ## check data: is each value in column 'description' present in the structure?,
        for (i in unique(data$description)){
          if (!i %in% expandedstructure$description){
            warning("description '", i, "', present in the data is not present in the structure. These datalines were ignored.")
            data <- data[data$description != i,]
          }
        }


    datacopy <- dplyr::select(data, id, x, y,
                              description, compid = comparewithid)
    dataexclxy <- dplyr::select(data, -x, -y )
    dataexclxy <- dplyr::rename(dataexclxy, compid = id)
    ## error catching: if comparewithid is not a subset of id then throw a warning
    comparelist <- unique(datacopy$compid)
    comparelist <- comparelist[!is.na(comparelist)]
    for (i in comparelist) {
      if (!i %in% dataexclxy$compid) {
        warning("datalines exist with 'comparewithid' = ", i, ". There are no lines with such a value in 'id': this will cause errors")
      }
    }
    ## merging
    data <- merge(x = dataexclxy, y = datacopy,
                  all.y = TRUE,
                  by = c("compid", "description") )
    data <- data[!is.na(data$value), ]
    data$comparewithid <- 1
    data <- dplyr::select(data, -compid)
    data <- as.data.frame(data)
  ## CALL ##
    data_out <- fn_structure_data_integration(
                                      expandedstructure = expandedstructure,
                                      data = data)
  ## return results
    return(data_out)
}
## ====================================================================== =====
