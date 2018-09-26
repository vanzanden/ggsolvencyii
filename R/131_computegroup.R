## functions in this file =============================================== =====
##
## main:
##    fnComputegroup (data,siiparams,...)
##    geomsiidatatopoints (df,maxscrvalue,fullstructure,rotationdegrees,rotationdescription,outlinedf,purpose)
## small:
##    transform_outlinedf (df)
##
## ====================================================================== =====



## fnComputegroup ======================================================= =====
#' fnComputegroup
#'
#' @inheritParams fnmaxscrvalue
# ' @param data dummy text
#' @param scales dummy text
#' @param siiparams The (adjusted) geom parameterset, forwarded to lower level functions as siiparams
#'
#' @return a dataframe which containes transformed or enriched data, usable for plotting
# ' @exportnot
#'
# ' @examples

fnComputegroup <- function(data, scales, siiparams) {
      ## parameters in this function
        ## none
      ## CALL ##
        d_out <- geomsiidatatopoints( df = data,
                                      siiparams = siiparams
                                    )
      ## geomsiidatatopoints returns a list with
      ##  $df (and possible other elements)
      ## return results
        return(d_out)
    }


## geomsiidatatopoints ================================================== =====
#' geomsiidatatopoints
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

geomsiidatatopoints <- function(df, siiparams) {
  ## parameters in this function
    squared <- siiparams$squared
  ## CALL ##
    ## results in a dataframe
    cornerpoints_intresult <- fnCornerpoints(df = df,
                                             siiparams = siiparams)
    ## ri, ro, db, de are determined
  ## CALL ##
    rotation_intresult <- fnRotation(df = cornerpoints_intresult,
                                     siiparams = siiparams)
    if (squared == TRUE) {
      ## CALL ##
        circleorsquare_intresult <- fnSquareconversion(df = rotation_intresult)
    } else {
      circleorsquare_intresult <- rotation_intresult
    }

    counter_polyorder <- 1
  ## CALL ##
    ## results in a list with $df and (updated) $counter_polyorder
    step5_intresult <- fnPolygonpoints(df = circleorsquare_intresult,
                                siiparams = siiparams,
                                counter_polyorder = counter_polyorder
                                      )

    counter_polyorder  <- step5_intresult$counter_polyorder
        step5_result <- step5_intresult$df
# z_step5_intresult <<- step5_intresult

    if (siiparams$purpose == "surfaces" ){
      ## do nothing
    } else {
      ## CALL ##
          outlinedf_trans <- transform_outlinedf(siiparams$outlinedf)

          # transforms table from human format
          # levelordescription outline1 ...2 ... ...4 ...11 outline13
          # 1                   NA       TRUE     NA       ...
          #
          # into
          # levelordescription outlinetype  drawoutline
          # 1                   1             NA
          # 1                   2             TRUE
          # 1                   3             NA


        ## first: drawoutline is TRUE or FALSE where
        ## explicitly set to T or F for a certain description.
          outlinedf_trans_description <- dplyr::rename(outlinedf_trans,
                                            description = levelordescription)
          t1 <- merge(x = step5_result,
                      y = outlinedf_trans_description,
                      by = c("description", "outlinetype"),
                      all.x = TRUE)
          step5_defined1 <- t1[!is.na(t1$drawoutline), ]
          step5_undefined <- t1[is.na(t1$drawoutline), ]
          step5_undefined <- dplyr::select(step5_undefined, -drawoutline)
          ## for the undefined fraction a second step is to see
          ## if a T or F is set for a certain level
          outlinedf_trans_level <- dplyr::rename(outlinedf_trans,
                                            level = levelordescription )
          #, drawoutline_level = drawoutline)
          t1 <- merge(x = step5_undefined, y = outlinedf_trans_level,
                      by = c("level", "outlinetype"), all.x = TRUE)
          step5_result <- rbind(step5_defined1, t1)
          step5_result <- step5_result[step5_result$drawoutline == TRUE, ]
          step5_result <- step5_result[!is.na(step5_result$drawoutline), ]
      }
    step5_result <- as.data.frame(step5_result[with(step5_result,
                                  order(id,
                                        -ordering_3,
                                        -group,
                                        polyorder)), ])

  ## RESULTS
    solviipolygon <- list(df = step5_result)
    return(solviipolygon)
}


## transform_outlinedf ================================================== =====
#' transform_outlinedf
#'
#' @param df a dataframe with column level and some other levels
#'
#' @return a tidyverse dataframe
#'
#' @importFrom tidyr gather
#'
# ' @exportnot
#'
# ' @examples
transform_outlinedf <- function(df) {
        result <- tidyr::gather(data = df, key = outlinetype,
                                value = drawoutline, -levelordescription)
        result$outlinetype <- gsub("[a-zA-Z]", "", result$outlinetype)
        result$outlinetype <- factor(result$outlinetype)
      ## 2do: if 11 = TRUE, THEN 1 MUST BE TRUE
      ## return results
        return(result)
    }
