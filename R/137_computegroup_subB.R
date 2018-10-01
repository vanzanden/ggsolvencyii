## functions in this file =============================================== =====
##
## main:
##    fn_circlepoints
##    fn_squarepoints
## small:
##    fn_sqXP
##    fn_sqYP
##    fn_sqDegseq
## ====================================================================== =====


## fn_circlepoints ======================================================= =====
#' fn_circlepoints
#'
#' @param ri the  inner radius of the circle segment
#' @param ro the outer radius of the circle segment
#' @param db degrees beginning of section (compaswise: 0 degrees is north, 90 degrees is east)
#' @param de degrees end of section
#' @param plottype "circle" of "outer", the former only requiring a ro
#' @param indication11 dummy text
#' @param indication13 dummy text
#' @param stepsize default value = 0.5, as of now no calls to this function override this default. the stepsize in degrees along the inner or outer lines,
#'
#' @return a dataframe with points to be plotted, relative from (0,0) coordinates system.
#' The dataframe has 3 columns: xpoint, ypoint, outlinetype (from puntenfunctie omschrijving/description)
#' ## outlinetype are 1 through 4 and 11 and 13.
#'       type 1 : line from point defined by ri/db  to ro/db (radius outward)
#'       type 2 : line from point defined by ro/db  to ro/de (outer line of section)
#'       type 3 : line from point defined by ro/de  to ri/de (radius inward)
#'       type 4 : line from point defined by ri/de  to ri/db  outer line of section)
# ' @exportnot
#'
# ' @examples

fn_circlepoints <- function(ri, ro, db, de, plottype,
                           indication11, indication13, stepsize = 0.50) {
        if (plottype == "outer") {
          xpoint <- round(ri * cos(.5 * pi - db / 360 * 2 * pi), digits = 7)
          ypoint <- round(ri * sin(.5 * pi - db / 360 * 2 * pi), digits = 7)
          if (indication11 == FALSE) {
            outlinetype <- "1"
          } else {
            outlinetype <- "11"
          }
          df <- data.frame (xpoint = xpoint, ypoint = ypoint,
                           outlinetype = outlinetype)
          xpoint <- round(ro * cos(.5 * pi - db / 360 * 2 * pi), digits = 7)
          ypoint <- round(ro * sin(.5 * pi - db / 360 * 2 * pi), digits = 7)
          if (indication11 == TRUE) {
            outlinetype <- "11"
          } else {
            outlinetype <- "1"
          }
          df2 <- data.frame (xpoint = xpoint, ypoint = ypoint,
                            outlinetype = outlinetype)
          df <- rbind(df, df2)
        } else {
          #no point, but an empty dataframe
          xpoint <- 1 #dummy
          ypoint <- 1 # dummy
          outlinetype <- "dummy"
          df <- data.frame (xpoint = xpoint, ypoint = ypoint,
                           outlinetype = outlinetype)
          df <- df[0]
        }

      ## points along the outer edge
        degseq <- c(seq (db, de, by = stepsize), de) #
        xpoint <- round(ro * cos(.5 * pi - degseq / 360 * 2 * pi), digits = 7)
        ypoint <- round(ro * sin(.5 * pi - degseq / 360 * 2 * pi), digits = 7)
        outlinetype <- "2"
        tmp <- data.frame(xpoint = xpoint, ypoint = ypoint,
                          outlinetype = outlinetype)
        df <- rbind (df, tmp)

      ## radial line
        if (plottype == "outer") {
          xpoint <- round(ro * cos(.5 * pi - de / 360 * 2 * pi), digits = 7)
          ypoint <- round(ro * sin(.5 * pi - de / 360 * 2 * pi), digits = 7)
          if (indication13 == TRUE) {
            outlinetype <- "13"
          } else {
            outlinetype <- "3"
          }
          df <- rbind (df, cbind(xpoint, ypoint, outlinetype))
          xpoint <- round(ri * cos(.5 * pi - de / 360 * 2 * pi), digits = 7)
          ypoint <- round(ri * sin(.5 * pi - de / 360 * 2 * pi), digits = 7)
          if (indication13 == TRUE) {
            outlinetype <- "13"
          } else {
            outlinetype <- "3"
          }
          df <- rbind (df, cbind(xpoint, ypoint, outlinetype))
        } else {
          #no points
        }

    ## points along the inner edge
      if (plottype == "outer") {
        degseq <- c(seq (de, db, by = -stepsize), db) #
        xpoint <- round(ri * cos(.5 * pi - degseq / 360 * 2 * pi), digits = 7)
        ypoint <- round(ri * sin(.5 * pi - degseq / 360 * 2 * pi), digits = 7)
        outlinetype <- "4"
        tmp <- data.frame(xpoint = xpoint, ypoint = ypoint,
                          outlinetype = outlinetype)
        df <- rbind (df, tmp)
      } else {
        #no points
      }
    ## RESULTS
      polygonpoints_result <- df
      return(polygonpoints_result)
  }



## fn_squarepoints ======================================================= =====
#' fn_squarepoints
#'
#' @param ri the (vertical) distance of center of circle to the inner edge of the segment;
#' @param ro the (vertical) distance of center of circle to the outer edge of the segment;
#' @param db degrees beginning of section (compaswise: 0 degrees is north, 90 degrees is east)
#' @param de degrees end of section
#' @param plottype "circle" of "outer", the former only requiring a ro
#' @param indication11 dummy text
#' @param indication13 dummy text
#'
#' @return a dataframe with points to be plotted, relative from (0,0) coordinates system.
#' The dataframe has 3 columns: xpoint, ypoint, outlinetype (from puntenfunctie omschrijving/description)
#' ## outlinetype are 1 through 4 and 11 and 13.
#'       type 1 : line from point defined by ri/db  to ro/db (radius outward)
#'       type 2 : line from point defined by ro/db  to ro/de (outer line of section)
#'       type 3 : line from point defined by ro/de  to ri/de (radius inward)
#'       type 4 : line from point defined by ri/de  to ri/db  outer line of section)
# ' @exportnot
#'
# ' @examples

fn_squarepoints <- function(ri, ro, db, de,
                           plottype, indication11, indication13 )  {

      ## a "radial line"
        ## determination of octants 0 to 7
        ##     (compas bearing 0-45: octant 0, 45-90: octant 1 etc )
          octant_b <- ( (db + 2 * 360) %/% 45) %% 8
          octant_e <- ( (de + 2 * 360) %/% 45) %% 8
# print(paste0("db de" , db, ", ", de))
# print(paste0("octants" , octant_b, ", ", octant_e))
        ## (beginning xpoint is calculated as :
        ##    xbsign * ri + (1-abs(xbsign) * sqrt(2*ri^2) * sin/cosin function :
        ## analog for endpoint (xesign, )
        ##       xbsign is -1/0/1, xsignB = 0 or 1,
        ##       negative values are introduced by sin/cosine function
        ## analog for xpoint/ro and ypoint/ri and ypoint/ro
          if (octant_b  == 0){xbsign <-  0 ; ybsign <-  1 }
          if (octant_b  == 1){xbsign <-  1 ; ybsign <-  0 }
          if (octant_b  == 2){xbsign <-  1 ; ybsign <-  0 }
          if (octant_b  == 3){xbsign <-  0 ; ybsign <- -1 }
          if (octant_b  == 4){xbsign <-  0 ; ybsign <- -1 }
          if (octant_b  == 5){xbsign <- -1 ; ybsign <-  0 }
          if (octant_b  == 6){xbsign <- -1 ; ybsign <-  0 }
          if (octant_b  == 7){xbsign <-  0 ; ybsign <-  1 }

          if (octant_e  == 0){xesign <-  0 ; yesign <-  1 }
          if (octant_e  == 1){xesign <-  1 ; yesign <-  0 }
          if (octant_e  == 2){xesign <-  1 ; yesign <-  0 }
          if (octant_e  == 3){xesign <-  0 ; yesign <- -1 }
          if (octant_e  == 4){xesign <-  0 ; yesign <- -1 }
          if (octant_e  == 5){xesign <- -1 ; yesign <-  0 }
          if (octant_e  == 6){xesign <- -1 ; yesign <-  0 }
          if (octant_e  == 7){xesign <-  0 ; yesign <-  1 }


# print(paste0(xsignA, xsignB, ysignA, ysignB))

        if (plottype == "outer") {
          xpoint <- fn_sqXP(vertdistance = ri, degrees = db,
                           xsign = xbsign, rounding = 7)
          ypoint <- fn_sqYP(vertdistance = ri, degrees = db,
                           ysign = ybsign, rounding = 7)
          if (indication11 == FALSE) {
            outlinetype <- "1"
          } else {
            outlinetype <- "11"
          }
          df <- data.frame(degrees = db, afstand = ri,
                           xpoint = xpoint, ypoint = ypoint,
                           outlinetype = outlinetype)
          xpoint <- fn_sqXP(vertdistance = ro, degrees = db,
                           xsign = xbsign, rounding = 7)
          ypoint <- fn_sqYP(vertdistance = ro, degrees = db,
                           ysign = ybsign, rounding = 7)
          if (indication11 == TRUE) {
            outlinetype <- "11"
          } else {
            outlinetype <- "1"
          }
          df2 <-  data.frame(degrees = db, afstand = ro,
                              xpoint = xpoint, ypoint = ypoint,
                              outlinetype = outlinetype)
          df <- rbind(df, df2)
        } else {
          #no point, but an empty dataframe
          xpoint <- 1 #dummy
          ypoint <- 1 # dummy
          outlinetype <- "dummy"
          df <- data.frame(degrees = 0, afstand = 0,
                           xpoint = xpoint, ypoint = ypoint,
                           outlinetype = outlinetype)
          df <- df[0]
        }

      ## points along the outer edge
        degseq <- fn_sqdegseq(startdegrees = db, enddegrees = de)
# print("degseq 2")
# print(degseq)
        for (degreesloop in degseq) {
          octant_loop <- ((degreesloop + 2 * 360) %/% 45) %% 8
          if (octant_loop  == 0) {xloopsign <-  0 ; yloopsign <-  1 }
          if (octant_loop  == 1) {xloopsign <-  1 ; yloopsign <-  0 }
          if (octant_loop  == 2) {xloopsign <-  1 ; yloopsign <-  0 }
          if (octant_loop  == 3) {xloopsign <-  0 ; yloopsign <- -1 }
          if (octant_loop  == 4) {xloopsign <-  0 ; yloopsign <- -1 }
          if (octant_loop  == 5) {xloopsign <- -1 ; yloopsign <-  0 }
          if (octant_loop  == 6) {xloopsign <- -1 ; yloopsign <-  0 }
          if (octant_loop  == 7) {xloopsign <-  0 ; yloopsign <-  1 }

          xpoint <- fn_sqXP(vertdistance = ro, degrees = degreesloop,
                           xsign = xloopsign, rounding = 7)
          ypoint <- fn_sqYP(vertdistance = ro, degrees = degreesloop,
                           ysign = yloopsign, rounding = 7)
          outlinetype <- "2"
          tmp <- data.frame(degrees = degreesloop, afstand = ro,
                            xpoint = xpoint, ypoint = ypoint,
                            outlinetype = outlinetype)
          df <- rbind(df, tmp)
        }

      ## radial line
        if (plottype == "outer") {
          xpoint <- fn_sqXP(vertdistance = ro, degrees = de,
                           xsign = xesign, rounding = 7)
          ypoint <- fn_sqYP(vertdistance = ro, degrees = de,
                           ysign = yesign, rounding = 7)
          if (indication13 == TRUE) {
            outlinetype <- "13"
          } else {
            outlinetype <- "3"
          }
          tmp <- data.frame(degrees = de, afstand = ro,
                            xpoint = xpoint, ypoint = ypoint,
                            outlinetype = outlinetype)
          df <- rbind (df, tmp)

          xpoint <- fn_sqXP(vertdistance = ri, degrees = de,
                           xsign = xesign, rounding = 7)
          ypoint <- fn_sqYP(vertdistance = ri, degrees = de,
                           ysign = yesign, rounding = 7)
          if (indication13 == TRUE) {
            outlinetype <- "13"
          } else {
            outlinetype <- "3"
          }
          tmp <- data.frame(degrees = de, afstand = ri, xpoint = xpoint,
                            ypoint = ypoint, outlinetype = outlinetype)
          df <- rbind(df, tmp)
        } else {
          #no points
        }

      ## points along the inner edge
        if (plottype == "outer") {
          degseq <- fn_sqdegseq(startdegrees = db,
                               enddegrees = de,
                               counterclockwise = TRUE)
# print("degseq 4")
# print(degseq)
          for (degreesloop in degseq) {
            octant_loop <- ((degreesloop + 2 * 360) %/% 45) %% 8
            if (octant_loop  == 0) {xloopsign <-  0 ; yloopsign <-  1 }
            if (octant_loop  == 1) {xloopsign <-  1 ; yloopsign <-  0 }
            if (octant_loop  == 2) {xloopsign <-  1 ; yloopsign <-  0 }
            if (octant_loop  == 3) {xloopsign <-  0 ; yloopsign <- -1 }
            if (octant_loop  == 4) {xloopsign <-  0 ; yloopsign <- -1 }
            if (octant_loop  == 5) {xloopsign <- -1 ; yloopsign <-  0 }
            if (octant_loop  == 6) {xloopsign <- -1 ; yloopsign <-  0 }
            if (octant_loop  == 7) {xloopsign <-  0 ; yloopsign <-  1 }

            xpoint <- fn_sqXP(vertdistance = ri, degrees = degreesloop,
                               xsign = xloopsign, rounding = 7)
            ypoint <- fn_sqYP(vertdistance = ri, degrees = degreesloop,
                               ysign = yloopsign, rounding = 7)
            outlinetype <- "4"
            tmp <- data.frame(degrees = degreesloop, afstand = ri,
                                xpoint = xpoint, ypoint = ypoint,
                                outlinetype = outlinetype)
              df <- rbind(df, tmp)
            }
          }
      ## RESULTS
        polygonpoints_result <- df
        return(polygonpoints_result)
    }

## fn_sqXP =============================================================== =====
#' fn_sqXP calculating the horizontal offset of the point, based on a reference value (vertdistance) and compass direction.
#'
#' @param vertdistance dummy text
#' @param degrees dummy text
#' @param xsign dummy text
#' @param rounding dummy text
#'
#' @return a distance

fn_sqXP <- function (vertdistance, degrees, xsign, rounding) {
    xpoint <- round(xsign * vertdistance + (1 - abs(xsign)) * sqrt(2 * vertdistance ^ 2) *
                      cos(.5 * pi - degrees / 360 * 2 * pi), digits = rounding)
   ##return results
    return(xpoint)
  }


## fn_sqYP =============================================================== =====
#' fn_sqYP calculating the vertical offset of the point, based on a reference value (vertdistance) and compass direction.
#'
#' @param vertdistance dummy text
#' @param degrees dummy text
#' @param ysign dummy text
#' @param rounding dummy text
#'
#' @return a distance


fn_sqYP <- function (vertdistance, degrees, ysign, rounding) {
       ypoint <- round(ysign * vertdistance + (1 - abs(ysign)) * sqrt(2 * vertdistance ^ 2) * sin(.5 * pi - degrees / 360 * 2 * pi), digits = rounding)
      ##return results
        return(ypoint)
    }

## fn_sqdegseq =========================================================== =====
#' fn_sqdegseq gives a sequence of degrees based on a starting and end rotation, with al the multiples of 45 degrees within the range. If starting degrees > enddegrees then (multples of) 360 degrees are added until start degrees is smaller then enddegrees.
#'
#' @param startdegrees a startingpoint of degrees (as used in a compass)
#' @param enddegrees the endpoint of degrees (as used in a compass)
#' @param counterclockwise (bln, default = FALSE)
#' @param reset (bln, default = FALSE) if reset is True then startdegrees is reset to a number between 0 and 360, and enddegrees to a number between 0 and 720 degrees
#'
#' @return a sequence of at least two compass directions, with the multiples of 45 degrees in between the outer limits.
# ' @exportnot
#'
# ' @examples

fn_sqdegseq <- function(startdegrees, enddegrees,
                       counterclockwise = FALSE, reset= FALSE) {
    if (reset == TRUE)  {
      startdegrees <- startdegrees - 360 * (startdegrees %/% 360)
    }
    if (enddegrees < startdegrees) {
      enddegrees <- enddegrees + 360 * ( (startdegrees - enddegrees) %/% 360)
    }
    if (enddegrees < startdegrees) { enddegrees <- enddegrees + 360 }
    firstmultiple <- 45 * (startdegrees %/% 45 + 1)
    lastmultiple <-  45 * (enddegrees %/% 45 + 0)
    if (counterclockwise == FALSE) {
      if (lastmultiple < firstmultiple) {
        degseq <- c(startdegrees, enddegrees)
      } else {
        degseq <- c(startdegrees, seq(from = firstmultiple,
                                         to = lastmultiple,
                                       by = 45), enddegrees)
      }
    } else {
      if (lastmultiple < firstmultiple) {
        degseq <- c(enddegrees, startdegrees)
      } else {
        degseq <- c(enddegrees, seq(from = lastmultiple,
                                       to = firstmultiple,
                                     by = -45), startdegrees)
      }
    }
  ##return results
    return(degseq)
}
