## GNU General Public License version 3 , see file LICENCE ============== = = =
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
##    GeomSiiRisksurface
##    GeomSiiRiskoutline
##    GeomSiiRiskconnection
##    geom_sii_risksurface
##    geom_sii_riskoutline
##    geom_sii_riskconnection
##    StatSiiRisksurface
##    StatSiiRiskoutline
##    StatSiiRiskconnection
##
##    stat_sii_risksurface
## small:
##
## ====================================================================== =====
## tip:
## casing of names of geoms and stats is important:
## exported geom_xxx_yy_zzzz requires a GeomXxxYyZzzz
##  see ggplot2:::camelize
## ====================================================================== =====

## helpfull link
## https://www.rdocumentation.org/packages/ggplot2/versions/2.2.1/topics/ggplot2-ggproto


## GeomSiiRisksurface =================================================== =====
GeomSiiRisksurface        <- ggplot2::ggproto(
                                        "_class" = "GeomSiiRisksurface",
                                        "_inherit" = ggplot2::GeomPolygon
                                      )
## GeomSiiRiskoutline =================================================== =====
GeomSiiRiskoutline <- ggplot2::ggproto(
                                        "_class" = "GeomSiiRiskoutline",
                                        "_inherit" = ggplot2::GeomPath
                                      )
## GeomSiiRiskconnection ================================================ =====
GeomSiiRiskconnection <- ggplot2::ggproto(
                                            "_class" = "GeomSiiRiskconnection",
                                            "_inherit" = ggplot2::GeomSegment
                                          )

## geom_sii_risksurface ================================================= =====
#' geom_sii_risksurface
#'
#' returns a ggplot2 object with filled, concentric circle(part)s, defined by the values in a hierarchy of levels.
#'
#' @param mapping required aes(thetics) : x (i.e. time, longitude), y (i.e SCR ratio, lattitude), id, description (), value
#' @param data  the dataset in tidyverse format (column 'description' as a factor). see examples in \code{\link{sii_z_ex2_data}} or \code{\link{sii_z_ex3_data}}
#' @param stat  default stat is statsii_risksurface, combinations with other stat's are not tested
#' @param position standard ggplot function
#' @param na.rm standard ggplot function
#' @param show.legend standard ggplot function
#' @param inherit.aes standard ggplot function
#'
#' @param structuredf (dataframe: default = \code{\link{sii_structure_sf16_eng}})\cr A representation of the buildup from individual risks to the SCR. columns are \enumerate{\item description (chr),\item  level (chr),\item  childlevel (chr)}. In the standard formula structure, SCR has level 1, with childlevel 2. This means it consists of all datalines with level == 2, ie. "BSCR", "operational" and "Adjustment-LACDT". lines in the dataset with a suffix "d" behind the levelnumber are diversification items. As of now these are not used in any calculation. the values in column "description" in the dataset need to match the description in this file. The package contains also a file \code{\link{sii_structure_sf16_nld}} with Dutch terms in description column.
#'
#' @param levelmax (integer or dataframe, default = 99)\cr a positive integer or a dataframe with columns 'level' and 'levelmax'. \cr The maximum amount of items in a certain level to be plotted. The smallest items are combined to one item. In the case level consisting of 7 items has a levelmax of 5 this results in 4 separate items and one grouped item. \cr
#'   For a less detailed plot \code{\link{sii_levelmax_sf16_995}} and \code{\link{sii_levelmax_sf16_993}} are present in the package where the components of market, life, non-life, health are combined in 5 or 3 items.
#' @param aggregatesuffix (string, default = "_other")\cr When a certain level contains more items than specified by levelmax  the smallest items are combined. The description is of the name of the one higher level (lower number) with a suffix
#' @param maxscrvalue (optional, double, default = NULL)\cr
#'   the scale of the different plot elements is is by default measured to the largest level 1 element (i.e. SCR) in the dataset, this can be overridden by this parameter for example when combining several plots
#' @param scalingx (optional, positive value ,default = 1)\cr for plots where units in x and y are different in magnitude distortion can occur. This parameter scales only in x-direction
#' @param scalingy (optional, positive value ,default = 1)\cr for plots where units in x and y are different in magnitude distortion can occur. This parameter scales only in y-direction
#' @param rotationdescription (optional, string, default = NULL)\cr default the orientation of the lower level (higher number) circles is based on the structure. When this parameter is not NULL then the circles are rotated in such a way that the indicated item lies in the "north-east" part of the circle.
#' @param rotationdegrees (optional, integer, -360 to 360, default = NULL)\cr when given, the fixed amount of degrees (positive is clockwise) of which each item is rotated (as in a compass, -90 is a quarter rotation anti-clockwise), additive to possible rotation to description
#' @param squared (optional, boolean, default = FALSE)\cr when set to TRUE plot returns a square representation. Compared with a circle representation of the same data the heigth and width of the square are smaller than the radius of the circle. Segments which fall in the corner parts of the square are smaller than equalsized part which fall in the vertical or horizontal parts of the square.
#' @param plotdetails a table with columns 'levelordescription' and 'surface', indicating which circle elements to plot. When no table is provided all segments are plotted. example 3 shows how to combine geom_sii_risksurface and geom_sii_riskoutline by using using table \code{\link{sii_z_ex3_plotdetails}}. geom_sii_riskoutline uses other columns in the same table
#' @param ... ellipsis, a standard R parameter
#'
#' @import ggplot2
#' @importFrom dplyr mutate
#'
#' @return a ggplot object
#' @export
#'
# ' @examples dummy

geom_sii_risksurface <- function(data = NULL,
                        mapping = NULL,
                        stat = "sii_risksurface",
                      ## geomspecific parameters
                        ## structure and form
                        structuredf = ggsolvencyii::sii_structure_sf16_eng,
                        squared = FALSE,
                        ## grouping
                        levelmax = 99,
                        aggregatesuffix = "_other",
                        ##
                        plotdetails = NULL,
                        ## rotation
                        rotationdegrees = NULL,
                        rotationdescription = NULL,
                        ## scaling
                        maxscrvalue = NULL,
                        scalingx = 1,
                        scalingy = 1,
                      ## other default ggplot2 parameters
                        position = "identity",
                        na.rm = FALSE,
                        show.legend = NA,
                        inherit.aes = TRUE,
                      ## internal parameters
                        ## purpose (attribution in call to ggplot::layer)
                      ## ellipsis
                        ...
                      ) {
        ggplot2::layer(data = data,
                       stat = stat,
                       geom = GeomSiiRisksurface,
                       mapping = mapping, position = position,
                       show.legend = show.legend,
                       inherit.aes = inherit.aes,
                       params = list( na.rm = na.rm,
                            ## userparams
                              levelmax = levelmax,
                              structuredf = structuredf,
                              maxscrvalue = maxscrvalue,
                              aggregatesuffix = aggregatesuffix,
                              scalingx = scalingx,
                              scalingy = scalingy,
                              rotationdegrees = rotationdegrees,
                              rotationdescription = rotationdescription,
                              squared = squared,
                              plotdetails = plotdetails,
                           ## internal params
                              purpose = "surfaces",
                           ## ellipsis
                              ...
                     )               )
    }

## geom_sii_riskoutline ================================================= =====
#' geom_sii_riskoutline
#'
#'  returns a ggplot2 object with the outlines concentric circle(part)s, defined by the values in a hierarchy of levels. Used for a comparison between instances of an SCR with a match between 'id' and 'comparewithid'.
#'
#' When describing an outline of a circlepart 4 segments can be distinguised, radial line outwards, outer circle segment, radial line inwards, inner circle segment. Whether or not to plot these lines can be determined with an outline dataframe.
#' by means of the column aes()value comparewithid in the data an overlay can be made to compare two SCR representations.
#'
#' @inheritParams geom_sii_risksurface
#' @param stat  default stat is statsii_riskoutline, combinations with other stat's are not tested
#' @param mapping required aes(thetics) : 'x' (i.e. time, longitude, integer), 'y' (i.e SCR ratio, lattitude), 'id', 'description', 'value'. Optional aes is 'comparewithid'
#' @param plotdetails a table with columns 'levelordescription' and 'outline1' to 'outline4', indicating which outlines of which circle elements to plot. When no table is provided all segments are plotted. example 3 shows how to combine geom_sii_risksurface and geom_sii_riskoutline by using using table \code{\link{sii_z_ex3_plotdetails}}. geom_sii_risksurface uses another column in the same table.
#'
#' @return a ggplot object \code{\link{geom_sii_risksurface}}
#' @export
#'
#' @examples
#' ggplot2::ggplot() +
#' geom_sii_riskoutline(data = sii_z_ex2_data,
#'  mapping = ggplot2::aes(x = time, y = ratio, id = id, value = value, description = description,
#'                          comparewithid = comparewithid),
#'    color = "red", lwd = .5 )
#'
#'
#'  sii_z_ex3_plotdetails
#'
#' ggplot2::ggplot() +
#' geom_sii_riskoutline(data = sii_z_ex2_data,
#'   mapping = ggplot2::aes(x = time, y = ratio, id = id, value = value, description = description,
#'                          comparewithid = comparewithid),
#'   color = "red", lwd = .5 ,
#'   rotationdescription = "life",
#'   rotationdegrees = -8,
#'   squared =  TRUE,
#'   plotdetails = sii_z_ex3_plotdetails)
#'
#'
#'
geom_sii_riskoutline <- function(data = NULL,
                    mapping = NULL,
                    stat = "sii_riskoutline",
                  ## geomspecific parameters
                    ## structure and form
                    structuredf = ggsolvencyii::sii_structure_sf16_eng,
                    squared = FALSE,
                    ## grouping
                    levelmax = 99,
                    aggregatesuffix = "_other",
                    ##
                    plotdetails = NULL,
                    ## rotation
                    rotationdegrees = NULL,
                    rotationdescription = NULL,
                    ## scaling
                    maxscrvalue = NULL,
                    scalingx = 1,
                    scalingy = 1,
                  ## other standard ggplot parameters
                    position = "identity",
                    na.rm = FALSE,
                    show.legend = NA,
                    inherit.aes = TRUE,
                  ## internal parameters
                    ## purpose (attribution in call to ggplot::layer),
                  ## ellipsis
                    ...
                  ) {
        ggplot2::layer( data = data,
                stat = stat,
                geom = GeomSiiRiskoutline,
                mapping = mapping,
                position = position,
                show.legend = show.legend,
                inherit.aes = inherit.aes,
                params = list(  na.rm = na.rm,
                              ## userparams
                                structuredf = structuredf,
                                squared = squared,
                                levelmax = levelmax,
                                aggregatesuffix = aggregatesuffix,
                                plotdetails = plotdetails,
                                maxscrvalue = maxscrvalue,
                                scalingx = scalingx, scalingy = scalingy,
                                rotationdegrees = rotationdegrees,
                              rotationdescription = rotationdescription,
                              ## internal params
                                purpose = "outline",
                              ## ellipsis
                                ...
                        )              )
    }

## geom_sii_riskconnection ============================================== =====
#' geom_sii_riskconnection
#'
#' Plots a line between those datapoints which have a matching value in the columns 'id' and 'comparewithid'.
#'
#' @inheritParams geom_sii_risksurface
#' @param mapping required aes(thetics) : 'x' (i.e. time, longitude, integer), 'y' (i.e SCR ratio, lattitude), 'id', 'description', 'value' and also'comparewithid'
#' @param stat  default stat is statsii_riskconnection, combinations with other stat's are not tested
#'
#' @return a ggplot object
#' @export
#'
#' @examples
#' \dontrun{
#' dummy
# ' ggplot2::ggplot() +
# '   geom_sii_riskconnection(data = sii_z_ex2_data,
# '   mapping = ggplot2::aes(x=time, y=ratio, id = id,  comparewithid = comparewithid ),
# '   arrow = arrow (angle=20, type = "closed" ))
# '
# '
# '    ggplot() +
# '     geom_siiscrbuild(data= sii_z_ex2_data,
# '                 mapping = ggplot2::aes(x=time, y=ratio, id = id, value = value,
# '                               description=description,
# '                               fill = description,color = description),
# '                               lwd=.5) +
# '      ggplot2::scale_fill_manual(name = "Componenten",values = fillcolors_sf_eng) +
# '      ggplot2::scale_color_manual(name = "Componenten",values = colorcolors_sf_eng) +
# '      geom_sii_riskoutline(data= sii_z_ex2_data,
# '                         mapping = ggplot2::aes(x=time, y=ratio, id = id, value = value,
# '                         description=description, comparewithid=comparewithid),
# '                          color = "red", lwd = 0.7, alpha = 0.99 ) +
# '      geom_sii_riskconnection(data = sii_z_ex2_data,
# '                            mapping = ggplot2::aes(x=time, y=ratio, id = id,
# '                            comparewithid = comparewithid ),
# '                            arrow = arrow (angle=20, type = "closed" )
# '                            ) +
# '      ggplot2::theme_bw()
#'}


geom_sii_riskconnection <- function(data = NULL,
                                   mapping = NULL,
                                   stat = "sii_riskconnection",
                                   position = "identity",
                                   na.rm = FALSE,
                                   show.legend = NA,
                                   inherit.aes = TRUE,
                                  ## userparams
                                  ## ellipsis
                                    ...
                                  ) {
                        ggplot2::layer(data = data,
                       stat = stat,
                       geom = GeomSiiRiskconnection,
                       mapping = mapping,
                       position = position,
                       show.legend = FALSE,
                       inherit.aes = inherit.aes,
                       params = list(  na.rm = na.rm,
                                      ## userparams
                                      ## ellipsis
                                        ...
                     )               )
    }

## StatSiiRisksurface =================================================== =====
StatSiiRisksurface <- ggplot2::ggproto(
    "_class" =  "StatSiiRisksurface",
    "_inherit" = ggplot2::Stat,
    required_aes = c("id", "x", "y", "description", "value"),
    ## default_aes = ggplot2::aes(color = "black", lwd = 0.05),
  ## setup parameters ----------------------------------------- -----
    setup_params = function(data, params) {
# print( class(params$plotdetails))
        params$levelonedescription <- fn_levelonedescription(params = params)
        params$maxscrvalue         <- fn_maxscrvalue(data = data,
                                                    params = params)

        if (is.null(params$plotdetails) ) {
          params$plotdetails <- fn_constructionplotdetails(params$structure)
        }
# print("params_post")
# print( params)
        return(params)
        },

  ## setup data ----------------------------------------------- -----
    setup_data = function(data, params) {
            data_out <- fn_setupdata_surfaces(data = data,
                                             params = params)
            return(data_out)
        },

  ## compute group -------------------------------------------- -----
    compute_group = function(data,
                             scales,
                             levelmax,
                             structuredf,
                             maxscrvalue,
                             aggregatesuffix,
                             scalingx,
                             scalingy,
                             rotationdegrees,
                             rotationdescription,
                             squared,
                             plotdetails,
                             purpose,
                             ...
                            ) {
            siiparams <- list(levelmax = levelmax,
                               structuredf = structuredf,
                               maxscrvalue = maxscrvalue,
                               aggregatesuffix = aggregatesuffix,
                               scalingx = scalingx,
                               scalingy = scalingy,
                               rotationdegrees = rotationdegrees,
                               rotationdescription = rotationdescription,
                               squared = squared,
                              plotdetails = plotdetails,
                              purpose = purpose)

            df <- fn_computegroup( data = data,
                                    siiparams = siiparams,
                                    ...
                                  )
            df <- df$df
            df <- dplyr::mutate(df,
                                x_org = x,
                                y_org = y)
            df <- dplyr::mutate(df,
                                x = x + xpoint * scalingx,
                                y = y + ypoint * scalingy)
          ## return results
            return(df)
        },

  ## finish layer --------------------------------------------- -----
    finish_layer = function(data, scales, params) {
          ## combining x/y and xpoint/ypoint values and several scalings
          ## return results
            return(data)

        }
) #END ggproto

## StatSiiRiskoutline =================================================== =====
StatSiiRiskoutline <- ggplot2::ggproto(
    "_class" =  "StatSiiRiskoutline",
    "_inherit" = ggplot2::Stat,
    required_aes = c("id", "x", "y",
                      "description", "value", "comparewithid"),
                     # "description", "value"), #, "comparewithid"),
    # default_aex = ggplot2::aes(color = "red", lwd = 0.2),
    default_aes = ggplot2::aes(color = "red", lwd = 0.2, comparewithid = 2 ),
  ## setup parameters ----------------------------------------- -----
    setup_params = function(data, params) {

      params$levelonedescription <- fn_levelonedescription(params = params)
      params$maxscrvalue         <- fn_maxscrvalue(data = data,
                                               params = params)
      if (is.null(params$plotdetails)) {
        params$plotdetails <- fn_constructionplotdetails(params$structure)
      }
      return(params)
   },

  ## setup data ----------------------------------------------- -----
    setup_data = function(data, params) {
            if (!"comparewithid" %in% colnames(data)){
              print("comparewithid is set to reference itself")
              data$comparewithid <- data$id
            } else {
              # print("comparewithid is present in data")
            }
            data_out <- fn_setupdata_outline(data = data,
                                           params = params)
            return(data_out)
        },

  ## compute group -------------------------------------------- -----
    compute_group = function(data,
                              scales,
                              levelmax,
                              structuredf,
                              maxscrvalue,
                              aggregatesuffix,
                              scalingx,
                              scalingy,
                              rotationdegrees,
                              rotationdescription,
                              squared,
                              plotdetails,
                              purpose,
                              ...
                            ) {
              siiparams <- list(levelmax = levelmax,
                               structuredf = structuredf,
                               maxscrvalue = maxscrvalue,
                               aggregatesuffix = aggregatesuffix,
                               scalingx = scalingx,
                               scalingy = scalingy,
                               rotationdegrees = rotationdegrees,
                               rotationdescription = rotationdescription,
                               squared = squared,
                               plotdetails = plotdetails,
                               purpose = purpose)

            df <- fn_computegroup(data = data,
                                    scales = scales,
                                    siiparams = siiparams
                                  )
            df <- df$df
            df <- dplyr::mutate(df, x_org = x, y_org = y)
            df <- dplyr::mutate(df,
                                x = x + xpoint * scalingx,
                                y = y + ypoint * scalingy)
          ## return results
            return(df)
        },

  ## finish layer --------------------------------------------- -----
    finish_layer = function(data, scales, params) {
          ## return results
            return(data)
        }
) ## end of ggproto class StatSii_riskoutline


## StatSiiRiskconnection ================================================ =====
StatSiiRiskconnection <- ggplot2::ggproto(
    "_class" =  "StatSiiRiskconnection",
    "_inherit" = ggplot2::Stat,
    required_aes = c("id", "x", "y", "comparewithid"),
    # default_aes = ggplot2::aes(color = "red", lwd = 0.2),

  ## setup parameters ----------------------------------------- -----
    # setup_params = function(data,params)
    # { params <- fn_setupparams (data=data,params=params)
    #   return(params) },

  ## setup data ----------------------------------------------- -----
    setup_data = function(data, params) {
        data <- fn_setupdata_connection(data = data)
        ## return results
          return(data)
      },

  ## compute group -------------------------------------------- -----
    compute_group = function(data, scales, ...) {
        ## return results
          return(data)
      } # ,

  ## finish layer --------------------------------------------- -----
    # finish_layer = function(data,scales,params)
      # { ## return results # return(data) # }
) ## end of ggproto class StatSiiRiskconnection

## stat_sii_risksurface ================================================= =====
#' stat_sii_risksurface
#'
#' stat_sii_risksurface returns a ggplot2 object with filled, concentric circle(part)s, defined by the values of a hierarchy of levels.
#'
#' @inheritParams geom_sii_risksurface
#' @param geom the default is geom_sii_risksurface
#'
#' @return a ggplot object
#' @export
#'
# ' @examples dummy

stat_sii_risksurface <- function(mapping = NULL,
                          data = NULL,
                          geom = "sii_risksurface",
                          position = "identity",
                          show.legend = TRUE,
                          inherit.aes = TRUE,
                          na.rm = FALSE,
                        ## geomspecific parameter
                          levelmax = 99,
                          structuredf = ggsolvencyii::sii_structure_sf16_eng,
                          maxscrvalue = NULL,
                          aggregatesuffix = "_other",
                          scalingx = 1,
                          scalingy = 1,
                          rotationdegrees = NULL,
                          rotationdescription = NULL,
                          squared = FALSE,
                          plotdetails = NULL,
                        ## internal parameters
                          ## purpose (attribution in call to ggplot::layer),
                        ## ellipsis
                          ...
                        ) {
     ggplot2::layer(mapping = mapping, data = data,
                     stat = "sii_risksurface",
                     geom = geom,
                     position = position,
                     show.legend = show.legend,
                     inherit.aes = inherit.aes,
                     params = list(na.rm = na.rm,
                          ## userparams
                            levelmax = levelmax,
                            structuredf = structuredf,
                            maxscrvalue = maxscrvalue,
                            # levelonedescription = levelonedescription,
                            aggregatesuffix = aggregatesuffix,
                            scalingx = scalingx,
                            scalingy = scalingy,
                            rotationdegrees = rotationdegrees,
                            rotationdescription = rotationdescription,
                          ## internal params
                            plotdetails = plotdetails,
                            purpose = "surfaces",
                          ## ellipsis
                            ...
           )             )
    }  ## end of definition stat_solvii

## ====================================================================== =====
