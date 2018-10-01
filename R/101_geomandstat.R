## functions in this file =============================================== =====
##
## main:
##    GeomSolvii
##    GeomSolviioutline
##    GeomSsolviiconnection
##    geom_solvii
##    geom_solviioutline
##    geom_solviiconnection
##    StatSolvii
##    StatSolviioutline
##    StatSolviiconnection
##
##    stat_solvii
## small:
##
## ====================================================================== =====

## helpfull link
## https://www.rdocumentation.org/packages/ggplot2/versions/2.2.1/topics/ggplot2-ggproto


## GeomSolvii =========================================================== =====
GeomSolvii        <- ggplot2::ggproto(
                                        "_class" = "GeomSolvii",
                                        "_inherit" = ggplot2::GeomPolygon
                                      )
## GeomSolviioutline ==================================================== =====
GeomSolviioutline <- ggplot2::ggproto(
                                        "_class" = "GeomSolviioutline",
                                        "_inherit" = ggplot2::GeomPath
                                      )
## GeomSolviiconnection ================================================= =====
GeomSolviiconnection <- ggplot2::ggproto(
                                            "_class" = "GeomSolviiconnection",
                                            "_inherit" = ggplot2::GeomSegment
                                          )

## geom_solvii ========================================================== =====
#' geom_solvii
#'
#' returns a ggplot2 object with filled, concentric circle(part)s, defined by the values of a hierarchy of levels.
#'
#' @param mapping required aes(thetics) : x (i.e. time, longitude), y (i.e SCR ratio, lattitude), id, description (), value
#' @param data  the dataset in tidyverse format (column 'description' as a factor). see examples in \code{\link{sii_z_example2_data}} or \code{\link{sii_z_example1_data}}
#' @param stat  default stat is statSolvii, combinations with other stat's are not tested
#' @param position standard ggplot function
#' @param na.rm standard ggplot function
#' @param show.legend standard ggplot function
#' @param inherit.aes standard ggplot function
#'
#' @param structuredf (dataframe: default = \code{\link{sii_structure_sf16_eng}})\cr A representation of the buildup from individual risks to the SCR. columns are \enumerate{\item description (chr),\item  level (chr),\item  childlevel (chr)}. In the standard formula structure, SCR has level 1, with childlevel 2. This means it consists of all datalines with level == 2, ie. "BSCR", "operational" and "Adjustment-LACDT". lines in the dataseet with a suffix "d" behind the levelnumber are diversifacation items. As of now these are not used in any calculation. the values in column "description" in the dataset need to match the desription in this file. The package contains also a file \code{\link{sii_structure_sf16_nld}} with Dutch terms in descripton column.
#'
#' @param levelmax (integer or dataframe, default = 99)\cr a positive integer or a dataframe with columns 'level' and 'levelmax'. \cr The maximum amount of items in a certain level to be plotted. The smallest items are combined to one item. In the case level consisting of 7 items has a levelmax of 5 this results in 4 seperate items and one grouped item. \cr
#'   For a less detailed plot \code{\link{sii_levelmax_sf16_995}} and \code{\link{sii_levelmax_sf16_993}} are present in the package where the components of market, life, non-life, health are combined in 5 or 3 items.
#' @param aggregatesuffix (string, default = "_other")\cr When a certain level contains more items than specified by levelmax  the smallest items are combined. The description is of the name of the one higher level (lower number) with a suffix
#' @param maxscrvalue (optional, double, default = NULL)\cr
#'   the scale of the different plot elements is is by default measured to the largest level 1 element (i.e. SCR) in the dataset, this can be overridden by this parameter for example when combining several plots
#' @param scalingx (optional, positive value ,default = 1)\cr for plots where units in x and y are different in magnitude distortion can occur. This parameter scales only in x-direction
#' @param scalingy (optional, positive value ,default = 1)\cr for plots where units in x and y are different in magnitude distortion can occur. This parameter scales only in y-direction
#' @param rotationdescription (optional, string, default = NULL)\cr default the orientation of the lower level (higher number) circles is based on the structure. When this parameter is not NULL then the circles are rotated in such a way that the indicated item lies in the "north-east" part of the circle.
#' @param rotationdegrees (optional, integer, -360 to 360, default = NULL)\cr when given, the fixed amount of degrees (positive is clockwise) of which each item is rotated (as in a compas, -90 is a quarter rotation anti-clockwise), additive to possible rotation to description
#' @param squared (optional, boolean, default = FALSE)\cr when set to TRUE plot returns a square representation. Compared with a circle representation of the same data the heigth and width of the square are smaller than the radius of the circle. Segments which fall in the corner parts of the square are smaller than equalsized part which fall in the vertical or horizontal parts of the square.
#' @param ... ellipsis, a standard R parameter
#'
#' @import ggplot2
#' @importFrom dplyr mutate
#'
#' @return a ggplot object
#' @export
#'
# ' @examples dummy

geom_solvii <- function(data = NULL,
                        mapping = NULL,
                        stat = "solvii",
                      ## geomspecific parameter
                        structuredf = ggsolvencyii::sii_structure_sf16_eng,
                        levelmax = 99,
                        aggregatesuffix = "_other",
                        maxscrvalue = NULL,
                        scalingx = 1,
                        scalingy = 1,
                        # fullstructure = FALSE, ## not an input yet
                        rotationdegrees = NULL,
                        rotationdescription = NULL,
                        squared = FALSE,
                      ## other default ggplot2 parameters
                        position = "identity",
                        na.rm = FALSE,
                        show.legend = NA,
                        inherit.aes = TRUE,
                      ## internal parameters
                        ## purpose (attribution in call to ggplot::layer)
                        ## outlinedf (attribution in call to ggplot::layer)
                      ## ellipsis
                        ...
                      ) {
        ggplot2::layer(data = data,
                       stat = stat,
                       geom = GeomSolvii,
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
                              fullstructure = FALSE,
                              rotationdegrees = rotationdegrees,
                              rotationdescription = rotationdescription,
                              squared = squared,
                           ## internal params
                              purpose = "surfaces",
                              outlinedf = NULL,
                           ## ellipsis
                              ...
                     )               )
    }

## geom_solviioutline =================================================== =====
#' geom_solviioutline
#'
#'  returns a ggplot2 object with the outlines concentric circle(part)s, defined by the values of a hierarchy of levels.
#'
#' When describing an outline of a circlepart 4 segments can be distinguised, radial line outwards, outer circle segment, radial line inwards, inner circle segment. Whether or not to plot these lines can be determined with an outline dataframe.
#' by means of the column aes()value comparewithid in the data an overlay can be made to compare two SCR representations.
#'
#' @inheritParams geom_solvii
#' @param stat  default stat is statSolviioutline, combinations with other stat's are not tested
#' @param mapping required aes(thetics) : x (i.e. time, longitude, integer), y (i.e SCR ratio, lattitude), id, description, value and comparewithid
#' @param outlinedf dummy
# ' default = \code{\link{sii_outline_sf16_eng}}: a dataframe with columns level (chr), and outline1,2,3,4,11,13 (all logical) defining which borders to plot. Outline11 and 13 are not yet implemented, meant to be a specific instance of outline1 and 3, on the edge of a 'block'. For the dutch SF structure an accompanying \code{\link{sii_outline_sf16_nld}} is provided in the package.
#'
#' @return a ggplot object \code{\link{geom_solvii}}
#' @export
#'
#' @examples
#' ggplot2::ggplot() +
#' geom_solviioutline(data = sii_z_example2_data,
#'  mapping = ggplot2::aes(x = time, y = ratio, id = id, value = value, description = description,
#'                          comparewithid = comparewithid),
#'    color = "red", lwd = .5 )
#'
#'
#'  sii_z_example4_outline
#'
#' ggplot2::ggplot() +
#' geom_solviioutline(data = sii_z_example2_data,
#'   mapping = ggplot2::aes(x = time, y = ratio, id = id, value = value, description = description,
#'                          comparewithid = comparewithid),
#'   color = "red", lwd = .5 ,
#'   rotationdescription = "life",
#'   rotationdegrees = -8,
#'   squared =  TRUE,
#'   outlinedf = sii_z_example4_outline)
#'
geom_solviioutline <- function(data = NULL,
                    mapping = NULL,
                    stat = "solviioutline",
                  ## geomspecific parameter
                    structuredf = ggsolvencyii::sii_structure_sf16_eng,
                    outlinedf = ggsolvencyii::sii_outline_sf16_eng,
                    levelmax = 99,
                    aggregatesuffix = "_other",
                    maxscrvalue = NULL,
                    scalingx = 1,
                    scalingy = 1,
                    rotationdegrees = NULL,
                    rotationdescription = NULL,
                    squared = FALSE,
                    # fullstructure = FALSE, ## not an input yet
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
                geom = GeomSolviioutline,
                mapping = mapping,
                position = position,
                show.legend = show.legend,
                inherit.aes = inherit.aes,
                params = list(  na.rm = na.rm,
                              ## userparams
                                levelmax = levelmax,
                                structuredf = structuredf,
                                outlinedf = outlinedf,
                                maxscrvalue = maxscrvalue,
                                aggregatesuffix = aggregatesuffix,
                                scalingx = scalingx,
                                scalingy = scalingy,
                                fullstructure = FALSE,
                                rotationdegrees = rotationdegrees,
                                rotationdescription = rotationdescription,
                                squared = squared,
                              ## internal params
                                purpose = "outline",
                              ## ellipsis
                                ...
                        )              )
    }

## geom_solviiconnection ================================================ =====
#' geom_solviiconnection
#'
#' Plots a line between those datapoints which have a value in the column 'comparewithid'.
#'
#' @inheritParams geom_solvii
#' @param mapping required aes(thetics) : x (i.e. time, longitude, integer), y (i.e SCR ratio, lattitude), id, description (), value and comparewithid
#' @param stat  default stat is statSolviiconnection, combinations with other stat's are not tested
#'
#' @return a ggplot object
#' @export
#'
#' @examples
#' \dontrun{
#' dummy
# ' ggplot2::ggplot() +
# '   geom_solviiconnection(data = sii_z_example2_data,
# '   mapping = ggplot2::aes(x=time, y=ratio, id = id,  comparewithid = comparewithid ),
# '   arrow = arrow (angle=20, type = "closed" ))
# '
# '
# '    ggplot() +
# '     geom_solvii(data= sii_z_example2_data,
# '                 mapping = ggplot2::aes(x=time, y=ratio, id = id, value = value,
# '                               description=description,
# '                               fill = description,color = description),
# '                               lwd=.5) +
# '      scale_fill_manual(name = "Componenten",values = fillcolors_sf_eng) +
# '      scale_color_manual(name = "Componenten",values = colorcolors_sf_eng) +
# '      geom_solviioutline(data= sii_z_example2_data,
# '                         mapping = ggplot2::aes(x=time, y=ratio, id = id, value = value,
# '                         description=description, comparewithid=comparewithid),
# '                          color = "red", lwd = 0.7, alpha = 0.99 ) +
# '      geom_solviiconnection(data = sii_z_example2_data,
# '                            mapping = ggplot2::aes(x=time, y=ratio, id = id,
# '                            comparewithid = comparewithid ),
# '                            arrow = arrow (angle=20, type = "closed" )
# '                            ) +
# '      theme_bw()
#'}


geom_solviiconnection <- function(data = NULL,
                                   mapping = NULL,
                                   stat = "solviiconnection",
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
                       geom = GeomSolviiconnection,
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

## StatSolvii =========================================================== =====
StatSolvii <- ggplot2::ggproto(
    "_class" =  "StatSolvii",
    "_inherit" = ggplot2::Stat,
    required_aes = c("id", "x", "y", "description", "value"),
    default_aex = ggplot2::aes(color = "black", lwd = 0.05),
  ## setup parameters ----------------------------------------- -----
    setup_params = function(data, params) {
        params$levelonedescription <- fnlevelonedescription(params = params)
        params$maxscrvalue         <- fnmaxscrvalue(data = data,
                                                    params = params)
          return(params)
        },

  ## setup data ----------------------------------------------- -----
    setup_data = function(data, params) {
            data_out <- fnSetupdata_surfaces(data = data,
                                             params = params)
            return(data_out)
        },

  ## compute group -------------------------------------------- -----
    compute_group = function(data,
                             scales,
                             levelmax,
                             structuredf,
                             outlinedf,
                             maxscrvalue,
                             aggregatesuffix,
                             scalingx,
                             scalingy,
                             fullstructure,
                             rotationdegrees,
                             rotationdescription,
                             squared,
                             purpose,
                             ...
                            ) {
            siiparams <- list(levelmax = levelmax,
                               structuredf = structuredf,
                               outlinedf = outlinedf,
                               maxscrvalue = maxscrvalue,
                               # levelonedescription = levelonedescription,
                               aggregatesuffix = aggregatesuffix,
                               scalingx = scalingx,
                               scalingy = scalingy,
                               fullstructure = fullstructure,
                               rotationdegrees = rotationdegrees,
                               rotationdescription = rotationdescription,
                               squared = squared,
                               purpose = purpose)

            df <- fnComputegroup( data = data,
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

## StatSolviioutline ==================================================== =====
StatSolviioutline <- ggplot2::ggproto(
    "_class" =  "StatSolviioutline",
    "_inherit" = ggplot2::Stat,
    required_aes = c("id", "x", "y",
                     "description", "value", "comparewithid"),
    default_aex = ggplot2::aes(color = "red", lwd = 0.2),

  ## setup parameters ----------------------------------------- -----
    setup_params = function(data, params) {
      params$levelonedescription <- fnlevelonedescription(params = params)
      params$maxscrvalue         <- fnmaxscrvalue(data = data,
                                               params = params)
            return(params)
        },

  ## setup data ----------------------------------------------- -----
    setup_data = function(data, params) {
           data_out <- fnSetupdata_outline(data = data,
                                           params = params)
            return(data_out)
        },

  ## compute group -------------------------------------------- -----
    compute_group = function(data,
                              scales,
                              levelmax,
                              structuredf,
                              outlinedf,
                              maxscrvalue,
                              # levelonedescription,
                              aggregatesuffix,
                              scalingx,
                              scalingy,
                              fullstructure,
                              rotationdegrees,
                              rotationdescription,
                              squared,
                              purpose,
                              ...
                            ) {
              siiparams <- list(levelmax = levelmax,
                               structuredf = structuredf,
                               outlinedf = outlinedf,
                               maxscrvalue = maxscrvalue,
                               # levelonedescription = levelonedescription,
                               aggregatesuffix = aggregatesuffix,
                               scalingx = scalingx,
                               scalingy = scalingy,
                               fullstructure = fullstructure,
                               rotationdegrees = rotationdegrees,
                               rotationdescription = rotationdescription,
                               squared = squared,
                               purpose = purpose)

            df <- fnComputegroup(data = data,
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
) ## end of ggproto class statSolviioutline


## StatSolviiconnection ================================================= =====
StatSolviiconnection <- ggplot2::ggproto(
    "_class" =  "StatSolviiconnection",
    "_inherit" = ggplot2::Stat,
    required_aes = c("id", "x", "y", "comparewithid"),
    default_aex = ggplot2::aes(color = "red", lwd = 0.2),

  ## setup parameters ----------------------------------------- -----
    # setup_params = function(data,params)
    # { params <- fnSetupparams (data=data,params=params)
    #   return(params) },

  ## setup data ----------------------------------------------- -----
    setup_data = function(data, params) {
        data <- fnSetupdata_connection(data = data)
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
) ## end of ggproto class statSolviiconnection

## stat_solvii ========================================================== =====
#' stat_solvii
#'
#' stat_solvii returns a ggplot2 object with filled, concentric circle(part)s, defined by the values of a hierarchy of levels.
#'
#' @inheritParams geom_solvii
#' @param geom the default is geom_solvii
#'
#' @return a ggplot object
#' @export
#'
# ' @examples dummy

stat_solvii <- function(mapping = NULL,
                          data = NULL,
                          geom = "solvii",
                          position = "identity",
                          show.legend = TRUE,
                          inherit.aes = TRUE,
                          na.rm = FALSE,
                        ## geomspecific parameter
                          levelmax = 99,
                          structuredf = sii_structure_sf16_eng,
                          # outlinedf = sii_outline_sf16_eng,
                          maxscrvalue = NULL,
                          # levelonedescription = "SCR",
                          aggregatesuffix = "_other",
                          scalingx = 1,
                          scalingy = 1,
                          # fullstructure = FALSE,
                          rotationdegrees = NULL,
                          rotationdescription = NULL,
                        ## internal parameters
                          ## purpose (attribution in call to ggplot::layer),
                        ## ellipsis
                          ...
                        ) {
     ggplot2::layer(mapping = mapping, data = data,
                     stat = "Solvii",
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
                            # fullstructure = fullstructure,
                            rotationdegrees = rotationdegrees,
                            rotationdescription = rotationdescription,
                          ## internal params
                            outlinedf = sii_outline_sf16_eng,
                            purpose = "surfaces",
                          ## ellipsis
                            ...
           )             )
    }  ## end of definition stat_solvii

## ====================================================================== =====
