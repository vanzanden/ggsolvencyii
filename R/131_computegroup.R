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
##    fn_computegroup (data,siiparams,...)
##    fn_geomsiidatatopoints (df,maxscrvalue,fullstructure,rotationdegrees,rotationdescription,plotdetails,purpose)
## small:
##    fn_transform_plotdetails (df)
##
## ====================================================================== =====



## fn_computegroup ======================================================= =====
#' fn_computegroup
#'
#' @inheritParams fn_maxscrvalue
# ' @param data dummy text
#' @param scales dummy text
#' @param siiparams The (adjusted) geom parameterset, forwarded to lower level functions as siiparams
#'
#' @return a dataframe which contains transformed or enriched data, usable for plotting
# ' @exportnot
#'
# ' @examples

fn_computegroup <- function(data, scales, siiparams) {
      ## parameters in this function
        ## none
      ## CALL ##
        d_out <- fn_geomsiidatatopoints( df = data,
                                      siiparams = siiparams
                                    )
      ## fn_geomsiidatatopoints returns a list with
      ##  $df (and possible other elements)
      ## return results
        return(d_out)
    }


## fn_geomsiidatatopoints ================================================== =====
#' fn_geomsiidatatopoints
#'
#' @param df dummy text
#' @param siiparams dummy text
#'
#' @importFrom dplyr select
#' @importFrom tidyr spread
#'
#' @return a list with one item 'df' (data.frame)
# ' @exportnot
#'
# ' @examples

fn_geomsiidatatopoints <- function(df, siiparams) {
  ## parameters in this function
    squared <- siiparams$squared
    plotdetails <- siiparams$plotdetails
    purpose <- siiparams$purpose
  ## CALL ##
    ## results in a dataframe
    cornerpoints_intresult <- fn_cornerpoints(df = df,
                                             siiparams = siiparams)
    ## ri, ro, db, de are determined
  ## CALL ##
    rotation_intresult <- fn_rotation(df = cornerpoints_intresult,
                                     siiparams = siiparams)
    if (squared == TRUE) {
      ## CALL ##
        circleorsquare_intresult <- fn_squareconversion(df = rotation_intresult)
    } else {
      circleorsquare_intresult <- rotation_intresult
    }

    counter_polyorder <- 1
  ## CALL ##
    ## results in a list with $df and (updated) $counter_polyorder
    step5_intresult <- fn_polygonpoints(df = circleorsquare_intresult,
                                siiparams = siiparams,
                                counter_polyorder = counter_polyorder
                                      )

    counter_polyorder  <- step5_intresult$counter_polyorder
        step5_result <- step5_intresult$df


## ***************************************************************************************************************************
    if (purpose == "surfaces" ) {
       ## CALL ##
      plotdetails_trans <- fn_transform_plotdetails(plotdetails, outline = FALSE, surface = TRUE)
    }
    if (purpose == "outline" ) {
       ## CALL ##
      plotdetails_trans <- fn_transform_plotdetails(plotdetails, outline = TRUE, surface = FALSE)
    }

  ## first: draw is TRUE or FALSE where
  ## explicitly set to T or F for a certain description.
      plotdetails_trans_description <- dplyr::rename(plotdetails_trans,
                                        description = levelordescription)

    if (purpose == "surfaces" ) {
      t1 <- merge(x = step5_result, y = plotdetails_trans_description, by = c("description"), all.x = TRUE)
    }
    if (purpose == "outline" ) {
      t1 <- merge(x = step5_result, y = plotdetails_trans_description, by = c("description", "outlinetype"), all.x = TRUE)
    }
    step5_defined1 <- t1[!is.na(t1$draw), ]
        step5_undefined <- t1[is.na(t1$draw), ]
    step5_undefined <- dplyr::select(step5_undefined, -draw)

    ## for the undefined fraction (contents of step5_undefined) a second step is to see
    ## if a T or F is set for a certain level
    plotdetails_trans_level <- dplyr::rename(plotdetails_trans,
                                      level = levelordescription )
    if (purpose == "surfaces" ) {
      t1 <- merge(x = step5_undefined, y = plotdetails_trans_level, by = c("level"), all.x = TRUE)
    }
    if (purpose == "outline" ) {
      t1 <- merge(x = step5_undefined, y = plotdetails_trans_level, by = c("level", "outlinetype"), all.x = TRUE)
    }
    step5_result <- rbind(step5_defined1, t1)
    step5_result <- step5_result[step5_result$draw == TRUE, ]
    step5_result <- step5_result[!is.na(step5_result$draw), ]
## ***************************************************************************************************************************

    # if (siiparams$purpose == "surfaces" ) {
    #   ## do nothing
    # } else {
    #   ## CALL ##
    #       plotdetails_trans <- fn_transform_plotdetails(siiparams$plotdetails, outline = TRUE, surface = FALSE)
    #
    #
    #
    #
    #
    #     ## first: draw is TRUE or FALSE where
    #     ## explicitly set to T or F for a certain description.
    #       plotdetails_trans_description <- dplyr::rename(plotdetails_trans,
    #                                         description = levelordescription)
    #       t1 <- merge(x = step5_result,
    #                   y = plotdetails_trans_description,
    #                   by = c("description", "outlinetype"),
    #                   all.x = TRUE)
    #       step5_defined1 <- t1[!is.na(t1$draw), ]
    #       step5_undefined <- t1[is.na(t1$draw), ]
    #       step5_undefined <- dplyr::select(step5_undefined, -draw)
    #       ## for the undefined fraction a second step is to see
    #       ## if a T or F is set for a certain level
    #       plotdetails_trans_level <- dplyr::rename(plotdetails_trans,
    #                                         level = levelordescription )
    #       t1 <- merge(x = step5_undefined, y = plotdetails_trans_level,
    #                   by = c("level", "outlinetype"), all.x = TRUE)
    #       step5_result <- rbind(step5_defined1, t1)
    #       step5_result <- step5_result[step5_result$draw == TRUE, ]
    #       step5_result <- step5_result[!is.na(step5_result$draw), ]
    #   }

## ***************************************************************************************************************************

    step5_result <- as.data.frame(step5_result[with(step5_result,
                                  order(id,
                                        -ordering_3,
                                        -group,
                                        polyorder)), ])




  ## RESULTS
    solviipolygon <- list(df = step5_result)
    return(solviipolygon)
}


## fn_transform_plotdetails ================================================== =====
#' fn_transform_plotdetails
#'
#' @param df a dataframe with column level and some other levels
#' @param outline boolean, TRUE if calling geom is geom_sii_riskoutline , only one boolean can be set to TRUE
#' @param surface boolean, TRUE if calling geom is geom_sii_risksurface , only one boolean can be set to TRUE
#'
#' @return a tidyverse dataframe
#'
#' @importFrom tidyr gather
#'
# ' @exportnot
#'
# ' @examples

          # transforms table from human format
          # levelordescription surface outline1 ...2 ... ...4 ...11 outline13
          # 1                   TRUE     NA       TRUE     NA       ...
          #
          # into (outline == TRUE, other(s) is/are false
          # draw column is based on column 'outline'  of respective outlinetype
          # levelordescription outlinetype  draw
          # 1                   1             NA
          # 1                   2             TRUE
          # 1                   3             NA
          # into (surface == TRUE, other(s) is/are false
          # draw column is based on column 'surface'
          # levelordescription   draw
          # 1                        NA
          # 2                       TRUE
          # ..                       NA

fn_transform_plotdetails <- function(df, outline = FALSE, surface = FALSE) {
      if (outline == TRUE) {
		df <- dplyr::select(df, levelordescription, outline1, outline2, outline3, outline4, outline11, outline13)
		result <- tidyr::gather(data = df, key = outlinetype,
                                value = draw, -levelordescription)
        result$outlinetype <- gsub("[a-zA-Z]", "", result$outlinetype)
        result$outlinetype <- factor(result$outlinetype)
      ## 2do: if 11 = TRUE, THEN 1 MUST BE TRUE
      ## return results
        return(result)
	  }
	  if (surface == TRUE) {
	    df <- dplyr::select(df, levelordescription, draw = surface)
	  ## return results
	    return(df)
	  }
    }
