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
## sii_debug ============================================================ =====
#' sii_debug
#'
#' assists in finding level or description mismatches in a set parameter(tables)
#'
#' @param data_descr (no default) the vector 'description' from the data
#' @param structure (no default) the structure dataframe
#' @param levelmax (optional, no default): the levelmax dataframe, when not filled the expanded structure assumes levelmax was set to 99 for all levels.
#' @param plotdetails (optional, no default): the plotdetails dataframe
#' @param fillcolors (optional, no default): fillcolor parameter (list with items "description" = "color" where color can be a name, #hexcode or other )
#' @param edgecolors (optional, no default): edgecolor parameter (list with items "description" = "color" where color can be a name, #hexcode or other )
#' @param aggregatesuffix (optional, default = "_other"):
#'
#' @return prints two comparison tables and puts them in $debug_description and $debug_level
#' @export
#'
# ' @examples
sii_debug <- function(data_descr,
                          structure = ggesolvencii::sii_structure_sf16_eng,
                          aggregatesuffix = "other",
                          levelmax = NULL,
                          plotdetails = NULL,
                          fillcolors = NULL,
                          edgecolors = NULL
                      )
{
  ## preparation to make parameter(list) to call fn_structure_expansion
    debugparams <- NULL
    debugparams$structuredf <- structure
    debugparams$levelmax <- levelmax
    if (is.null(levelmax)) {debugparams$levelmax <- 99}
    debugparams$aggregatesuffix <- aggregatesuffix
    ## CALL
    struct2 <- fn_structure_expansion(debugparams)

  ## retreiving descriptions from inputted parameters
    d_d <- levels(data_descr)
      d_d_df <- as.data.frame(d_d)
      d_d_df$data <- "present"
      descr <- d_d

    s_d <- unique(structure$description)
      s_d_df <- as.data.frame(s_d)
      s_d_df$structure <- "present"
      descr <- c(descr, s_d)

    s2_d <- unique(struct2$description)
      s2_d_df <- as.data.frame(s2_d)
      s2_d_df$enrichedstructure <- "present"
      descr <- c(descr, s2_d)

    blnplotdetails <- FALSE
    if (!is.null(plotdetails)) {
      blnplotdetails <- TRUE
      p_d <- unique(plotdetails$levelordescription)
      p_d_df <- as.data.frame(p_d)
      p_d_df$plotdetails <- "present";
      descr <- c(descr, p_d)
    }
    blnfillcolors <- FALSE
    if (!is.null(fillcolors)) {
      blnfillcolors <- TRUE
      f_d <- names(fillcolors) ;
      f_d_df <- as.data.frame(f_d) ;
      f_d_df$fillcolor <- "present";
      descr <- c(descr, f_d)
    }
    blnedgecolors <- FALSE
    if (!is.null(edgecolors)) {
      blnedgecolors <- TRUE
      e_d <- names(edgecolors) ;
      e_d_df <- as.data.frame(e_d) ;
      e_d_df$edgecolor <- "present";
      descr <- c(descr, e_d)
    }

    descr <- unique(descr) ;
    descr_df <- as.data.frame(descr)

  ## merging into a result table
                         m1 <- merge(x = descr_df, y = d_d_df, by.x = c("descr"), by.y = c("d_d"),  all.x = TRUE)
                         m1 <- merge(x = m1,       y = s_d_df, by.x = c("descr"), by.y = c("s_d"),  all.x = TRUE)
                         m1 <- merge(x = m1,      y = s2_d_df, by.x = c("descr"), by.y = c("s2_d"), all.x = TRUE)
    if (blnplotdetails) {m1 <- merge(x = m1,       y = p_d_df, by.x = c("descr"), by.y = c("p_d"),  all.x = TRUE)}
    if (blnfillcolors)  {m1 <- merge(x = m1,       y = f_d_df, by.x = c("descr"), by.y = c("f_d"),  all.x = TRUE)}
    if (blnedgecolors)  {m1 <- merge(x = m1,       y = e_d_df, by.x = c("descr"), by.y = c("e_d"),  all.x = TRUE)}

  ## retreiving levels from inputted parameters
    s_l <- unique(struct2$level) ;s_l_df <- as.data.frame(s_l) ; s_l_df$structure <- "present"; lvl <- s_l
    blnlevel <- FALSE
    if (!is.null(levelmax)) {
      if (length(levelmax) > 1) {
        blnlevel <- TRUE
        l_l <- unique(as.character(levelmax$level)) ;l_l_df <- as.data.frame(l_l) ; l_l_df$levelmax <- "present"; lvl <- c(lvl, l_l)
      } else {}
    }
    if (blnplotdetails) {
      p_l <- unique(plotdetails$levelordescription) ;
      p_l_df <- as.data.frame(p_l) ;
      p_l_df$plotdetails <- "present";
      lvl <- c(lvl, p_l)
    }
    lvl <- unique(lvl) ; lvl_df <- as.data.frame(lvl)

  ## merging into a result table
                         m2 <- merge(x = lvl_df, y = s_l_df, by.x = c("lvl"), by.y = c("s_l"), all.x = TRUE)
    if (blnlevel )      {m2 <- merge(x = m2,     y = l_l_df, by.x = c("lvl"), by.y = c("l_l"), all.x = TRUE)}
    if (blnplotdetails) {m2 <- merge(x = m2,     y = p_l_df, by.x = c("lvl"), by.y = c("p_l"), all.x = TRUE)}

  ## combining two result tables in one result list
    result <- NULL
    result$debug_description <- m1
    result$debug_level <- m2
     return(result)
}

## ====================================================================== =====
