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
##    fn_setupdata_connection
##
## small:
##
## ====================================================================== =====

## fn_setupdata_connection =============================================== =====
# ' fn_setupdata_connection
# '
# ' @param data the data send by the geom_class, due to the simple nature of the desired plot no structure information is needed.
# '
# ' @importFrom magrittr %>%
# '
# ' @return an adjusted version of input dataframe data
# ' @exportnot
# '
# ' @examples

fn_setupdata_connection <- function(data) {
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
