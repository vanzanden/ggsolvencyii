## functions in this file
##
## main:
##    fnCornerpoints
##    fnRotation
##    fnSquareconversion
##    fnsquareddegrees
##    fnPolygonpoints
## small:
##
## # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #



## fnCornerpoints #############################################################################################
#' fnCornerpoints
#'
#' @param df a dataframe
#' @param siiparams dummy text
#'
#' @return a dataframe with 5 added columns (ri, ro, db, de, plottype)
#'
#' @importFrom dplyr mutate
#'
# ' @exportnot
#'
# ' @examples

fnCornerpoints <- function(df, siiparams) {
    maxscrvalue         <- siiparams$maxscrvalue

    t1 <- df  %>%
            dplyr::mutate(ri = NA, ro = NA, db = NA, de = NA, plottype = NA)

    t1 <- t1[t1$value > 0, ]
  ## ri : radius inner
  ## ro : radius outer
  ## db : degrees beginning of section (compaswise: 0 degrees is north)
  ## de : degrees end of section

  ## values outlinetype(assigned in function 'polygonpoints') are
  ##    1 through 4 and 11 and 13.
  ## type 1 : line from point defined by ri/db  to ro/db (radius outward)
  ## type 2 : line from point defined by ro/db  to ro/de (outer line of section)
  ## type 3 : line from point defined by ro/de  to ri/de (radius inward)
  ## type 4 : line from point defined by ri/de  to ri/db  outer line of section)

  ## types 11 and 13 are similar to 1 and 3, but indicate the outer radii of
  ## segments belonging to the same level.
    for (levelcounter in fn_determinelevels(vector_in = t1$level,
                               # ind_value = FALSE, ind_integer = FALSE,
                               ind_d = FALSE, ind_o = FALSE
                               # , ind_onlyspecials = FALSE
          ) ) {
      if (levelcounter == "1") {
        ## by definition only one instance
        t1$ri[1] <- 0
        t1$ro[1] <- sqrt(t1$value[1] / maxscrvalue)
        t1$db[1] <- 0
        t1$de[1] <- 360
        t1$plottype[1] <- "circle"
      } else {
        ## levelcounter != "1"
        linestoprocess_ind <- sub("o", "", t1$level) == levelcounter
        ## some statistics on the group
        linestoprocess <- t1[sub("o", "", t1$level) == levelcounter, ]
        numberoflinesgroup <- nrow(linestoprocess)
        sumgroup <- sum(linestoprocess$value)
        motherline <- t1[t1$childlevel == levelcounter, ]
        motherline <- motherline[!is.na(motherline$level), ]
        dbgroup <- motherline$db
        degroup <- motherline$de
        rigroup <- motherline$ro
        dbtemp <- dbgroup
        rm(linestoprocess)
        rm(motherline)
        processedlines <- 0
        for (linecounter in 1:nrow(t1) ) {
          if (linestoprocess_ind[linecounter] == TRUE) {
            processedlines <- processedlines + 1
            db <- dbtemp
            if (processedlines == numberoflinesgroup) {
              ## to avoid rounding errors
              de <- degroup #
            } else {
              de <- db + (t1$value[linecounter] / sumgroup) * (degroup - dbgroup)
            }
            dbtemp <- de
            ri <- rigroup
            ro <- sqrt( (t1$value[linecounter] / maxscrvalue) / ( (de - db) / 360))
            t1$ri[linecounter] <- ri
            rm(ri)
            t1$ro[linecounter] <- ro
            rm(ro)
            t1$db[linecounter] <- db
            rm(db)
            t1$de[linecounter] <- de
            rm(de)
            t1$plottype[linecounter] <- "outer"
          }   # else {}   ## do nothing
        }       # next linecounter
      }           # end else
    }               #next levelcounter
    result <- t1
  ## return results
    return(result)
}


## fnRotation #######################################################################################################
#' fnRotation

#' @param df  dummy text
#' @param siiparams   dummy text
#' @return a dataframe with adjusted db and de columns
#'
# ' @exportnot
#'
# ' @examples

fnRotation <- function(df, siiparams) {
      ## parameters in this function
        rotationdescription <- siiparams$rotationdescription
        rotationdegrees <- siiparams$rotationdegrees
      ## end parameters

        if (is.null(rotationdescription)) {
          rotation_a <- 0
        } else {
          rotation_a <- 360 - df$db[df$description == rotationdescription]
          print(paste0("for id = ",
                         df$id[1],
                         " the description dependent rotation is : ",
                         rotation_a,
                         " degrees"))
        }
        if (is.null(rotationdegrees)) {
          rotation_b <- 0
        } else {
          rotation_b <- rotationdegrees
        }
        df_out <- df
        df_out$db <- df_out$db + rotation_a + rotation_b
        df_out$de <- df_out$de + rotation_a + rotation_b

      ## return results
        return(df_out)
    }

## fnSquareconversion ################################################################

#' fnSquareconversion
#'
#' @param df a dataframe with colums ri, ro, db, de
#'
#' @return the same dataframe with ri, ro, db and de converted in parameters for a square plot
# ' @export
#'
# ' @examples
fnSquareconversion <- function(df) {
        df$ri <- df$ri * (.5 * sqrt(pi))  ## factor .88
        df$ro <- df$ro * (.5 * sqrt(pi))  ## factor .88
        df$db <- apply(as.data.frame(df$db), MARGIN = 1, FUN = fnsquareddegrees)
# print(as.data.frame(df$de))
        df$de <- apply(as.data.frame(df$de), MARGIN = 1, FUN = fnsquareddegrees)
# print(as.data.frame(df$de))
      ## return results
        return(df)
    }


## fnsquareddegrees ################################################################
#' fnsquareddegrees The actual transformation of a part of a circle to the (surfacewise)  equivalent of the part of a square
#'
#' @param circledegrees (no default) an amount in degrees
#'
#' @return an amount in compass degrees
# ' @export
#'
# ' @examples

fnsquareddegrees <- function (circledegrees) {
        # squaredegrees <- circledegrees
        rmd <- circledegrees %% 45 ## rmd for remainder in degrees
        pts <- circledegrees %/% 45 ## amount of 8th parts of circle/square
        rmr <- rmd / 180 * pi ## rmr : remainder in radials
        surface <- .5 * rmr
        sq_r <- atan(surface * 8 / pi)
        squaredegrees <- 180 * (sq_r / pi) + 45 * pts
      ## return results
        return(squaredegrees)
    }

## fnPolygonpoints #######################################################################################################
#' fnPolygonpoints
#'
#' @param df  dummy text
#' @param siiparams   dummy text
#' @param counter_polyorder dummy text
#'
#' @return a list with two items (df (dataframe), counter_polyorder (numeric, updated)
#'
#' @importFrom dplyr mutate
#'
# ' @exportnot
#'
# ' @examples


fnPolygonpoints <- function (df, siiparams, counter_polyorder) {
  ## parameters in this function
    purpose <- siiparams$purpose
    squared <- siiparams$squared
  ## voorbereiden nieuwe tabel
    result <- df
    result <- result[0, ]
    for (i in 1:nrow(df)) {
      line <- df[i, ]
      if (squared == TRUE) {
        ## CALL ##
        points <- fnSquarepoints(ri = line$ri, ro = line$ro,
                                  db = line$db, de = line$de,
                                  indication11 = FALSE,
                                  indication13 = FALSE,
                                  plottype = line$plottype
                                  # , stepsize ## default value 0.5
                                  )
      } else {
        ## CALL ##
        points <- fnCirclepoints(ri = line$ri, ro = line$ro,
                                 db = line$db, de = line$de,
                                 indication11 = FALSE,
                                 indication13 = FALSE,
                                 plottype = line$plottype
                                )
      }

      ## copy baseinfo as many times as points have been made
      df1 <- line[rep(1, nrow(points)), ]
      df1$group <- (100 * line$id) + i
      if (purpose == "outline") {
        df1$group <- 10000 * line$id + 100 * i + as.numeric(points$outlinetype)
      } else {
        df1$group <- 10000 * line$id + 100 * i + 0
      }
      df1$polyorder <- seq(from = counter_polyorder + 1,
                           by = 1, length.out = nrow(points))
      counter_polyorder <- max(df1$polyorder)
      df1 <- dplyr::mutate(df1,
                           xpoint = points$xpoint,
                           ypoint = points$ypoint,
                           outlinetype = points$outlinetype)
      result <- rbind(result, df1)
      rm(line) ; rm(df1) ;rm(points)
      result <- result %>%
                      dplyr::mutate(xpoint = as.numeric(xpoint),
                                    ypoint = as.numeric(ypoint))
    } # next i
    result <- list(df = result, counter_polyorder = counter_polyorder )
  ## result
    return(result)
}
