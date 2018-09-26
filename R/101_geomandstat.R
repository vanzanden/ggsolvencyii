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
##    Stat_solvii
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
#' @param mapping required aes(thetics) : x (i.e. time, longitude, integer), y (i.e SCR ratio, lattitude), id, description (), value
#' @param data  the dataset in tidyverse format (description as a factor)
#' @param stat  default stat is statSolvii
#' @param position standard ggplot function
#' @param na.rm standard ggplot function
#' @param show.legend standard ggplot function
#' @param inherit.aes standard ggplot function
#'
#' @param levelmax default = 99: a positive integer or a dataframe with columns 'level' and 'levelmax'. The maximum amount of items in a certain level to be plotted. The smallest items are combined
#' @param structuredf default = structure_sf_eng: a representation of the structure, columns description (chr), level (chr), childlevel (chr). description in dataset needs to match the desripton in this file. see ?structure_sf_eng
#' @param maxscrvalue default = NULL: the scale of the different plot elements, is (by surfacearea) is by default measured to the largest element, this can be overridden by this parameter
#' @param levelonedescription default = "SCR": the description of level 1, this name is needed before integration of data and structure.
#' @param aggregatesuffix default = "_other" When a certain level contains more items than specified by levelmax (an integer or dataframe (level, levelmax)) the smallest items are combined. The description is of the motherlevel with a suffix
#' @param scalingx default = 1: for plots where units in x and y are different distortion can occur. This parameter scales only in x-direction
#' @param scalingy default = 1: for plots where units in x and y are different distortion can occur. This parameter scales only in y-direction
#' @param fullstructure default = FALSE: an indication if the legend has to show all possible components of the structure, or only those present in the dataset
#' @param rotationdescription default = NULL: which item determines the rotation of the plot, so that this item is
#' @param rotationdegrees default = NULL: the fixed amount of degrees of which each item is rotated (as in a compas, -90 is a quarter rotation anti-clockwise), additive to possible rotation to description
#' @param squared default = FALSE: a boolean to indicate if the plot should return a square (squared is TRUE), or a circle (squared = FALSE)
#'
#' @param ... ellipsis, a standard R parameter
#'
#' @import ggplot2
#' @importFrom dplyr mutate
#'
#' @return a ggplot object
#' @export
#'
# ' @examples dummy

geom_solvii <- function(mapping = NULL,  data = NULL,
                          stat = "solvii",
                          position = "identity",
                          na.rm = FALSE,
                          show.legend = NA,
                          inherit.aes = TRUE,
                        ## geomspecific parameter
                          levelmax = 99,
                          structuredf = sii_structure_sf16_eng,
                          maxscrvalue = NULL,
                          levelonedescription = "SCR",
                          aggregatesuffix = "_other",
                          scalingx = 1,
                          scalingy = 1,
                          fullstructure = FALSE,
                          rotationdegrees = NULL,
                          rotationdescription = NULL,
                          squared = FALSE,
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
                              levelonedescription = levelonedescription,
                              aggregatesuffix = aggregatesuffix,
                              scalingx = scalingx,
                              scalingy = scalingy,
                              fullstructure = fullstructure,
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
#' @param mapping required aes(thetics) : x (i.e. time, longitude, integer), y (i.e SCR ratio, lattitude), id, description (), value
#' @param data  the dataset in tidyverse format (description as a factor)
#' @param stat  default stat is statSolvii
#' @param position standard ggplot function
#' @param na.rm standard ggplot function
#' @param show.legend standard ggplot function
#' @param inherit.aes standard ggplot function
#'
#' @param levelmax default = 99: a positive integer or a dataframe with columns 'level' and 'levelmax'. The maximum amount of items in a certain level to be plotted. The smallest items are combined
#' @param levelonedescription default = "SCR": the description of level 1, this name is needed before integration of data and structure.
#' @param structuredf default = structure_sf_eng: a representation of the structure, columns description (chr), level (chr), childlevel (chr). description in dataset needs to match the desripton in this file. see ?structure_sf_eng
#' @param outlinedf default = outline_sf: a dataframe with columns level (chr), and outline1,2,3,4,11,13 (all logical) defining which borders to plot
#' @param maxscrvalue default = NULL: the scale of the different plot elements, is (by surfacearea) is by default measured to the largest element, this can be overridden by this parameter
#' @param aggregatesuffix default = "_other" When a certain level contains more items than specified by levelmax (an integer or dataframe (level, levelmax)) the smallest items are combined. The description is of the motherlevel with a suffix
#' @param scalingx default = 1: for plots where units in x and y are different distortion can occur. This parameter scales only in x-direction
#' @param scalingy default = 1: for plots where units in x and y are different distortion can occur. This parameter scales only in y-direction
#' @param fullstructure default = FALSE: an indication if the legend has to show all possible components of the structure, or only those present in the dataset
#' @param rotationdescription default = NULL: which item determines the rotation of the plot, so that this item is
#' @param rotationdegrees default = NULL: the fixed amount of degrees of which each item is rotated (as in a compas, -90 is a quarter rotation anti-clockwise), additive to possible rotation to description
#' @param squared default = FALSE: a boolean to indicate if the plot should return a square (squared is TRUE), or a circle (squared = FALSE)
#' @param ... ellipsis
#'
#' @return a ggplot object
#' @export
#'
# ' @examples dummy

geom_solviioutline <- function(   mapping = NULL,  data = NULL,
                                  stat = "solviioutline",
                                  position = "identity",
                                  na.rm = FALSE,
                                  show.legend = NA,
                                  inherit.aes = TRUE,
                                ## geomspecific parameter
                                  levelmax = 99,
                                  structuredf = sii_structure_sf16_eng,
                                  outlinedf = sii_outline_sf16_eng,
                                  maxscrvalue = NULL,
                                  levelonedescription = "SCR",
                                  aggregatesuffix = "_other",
                                  scalingx = 1,
                                  scalingy = 1,
                                  fullstructure = FALSE,
                                  rotationdegrees = NULL,
                                  rotationdescription = NULL,
                                  squared = FALSE,
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
                                          levelonedescription = levelonedescription,
                                          aggregatesuffix = aggregatesuffix,
                                          scalingx = scalingx,
                                          scalingy = scalingy,
                                          fullstructure = fullstructure,
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
#' @param mapping required aes(thetics) : x (i.e. time, longitude, integer), y (i.e SCR ratio, lattitude), id, description (), value
#' @param data  the dataset in tidyverse format (description as a factor)
#' @param stat  default stat is statSolvii
#' @param position standard ggplot function
#' @param na.rm standard ggplot function
#' @param show.legend standard ggplot function
#' @param inherit.aes standard ggplot function
#' @param ... ellipsis
#'
#' @return a ggplot object
#' @export
#'
# ' @examples dummy

geom_solviiconnection <- function(  mapping = NULL,  data = NULL,
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
            params$maxscrvalue <- fnmaxscrvalue(data = data,
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
                             levelonedescription,
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
            siiparams <- list (levelmax = levelmax,
                               structuredf = structuredf,
                               outlinedf = outlinedf,
                               maxscrvalue = maxscrvalue,
                               levelonedescription = levelonedescription,
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
           params$maxscrvalue <- fnmaxscrvalue(data = data,
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
                              levelonedescription,
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
              siiparams <- list (levelmax = levelmax,
                               structuredf = structuredf,
                               outlinedf = outlinedf,
                               maxscrvalue = maxscrvalue,
                               levelonedescription = levelonedescription,
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

## Stat_solvii ========================================================== =====
#' Stat_solvii
#'
#' @param mapping required aes(thetics) : x (i.e. time, longitude, integer), y (i.e SCR ratio, lattitude), id, description (), value
#' @param data  the dataset in tidyverse format (description as a factor)
#' @param geom the default is geom_solvii
#' @param position standard ggplot function
#' @param show.legend standard ggplot function
#' @param inherit.aes standard ggplot function
#' @param na.rm standard ggplot function
#' @param levelmax default = 99: a positive integer or a dataframe with columns 'level' and 'levelmax'. The maximum amount of items in a certain level to be plotted. The smallest items are combined
#' @param levelonedescription default = "SCR": the description of level 1, this name is needed before integration of data and structure.
#' @param aggregatesuffix default = "_other" When a certain level contains more items than specified by levelmax (an integer or dataframe (level, levelmax)) the smallest items are combined. The description is of the motherlevel with a suffix
#' @param structuredf default = structure_sf_eng: a representation of the structure, columns description (chr), level (chr), childlevel (chr). description in dataset needs to match the desripton in this file. see ?structure_sf_eng
#' @param outlinedf default = sii_outlinedf_sf16_eng
#' @param maxscrvalue default = NULL: the scale of the different plot elements, is (by surfacearea) is by default measured to the largest element, this can be overridden by this parameter
#' @param scalingx default = 1: for plots where units in x and y are different distortion can occur. This parameter scales only in x-direction
#' @param scalingy default = 1: for plots where units in x and y are different distortion can occur. This parameter scales only in y-direction
#' @param fullstructure default = FALSE: an indication if the legend has to show all possible components of the structure, or only those present in the dataset
#' @param rotationdescription default = NULL: which item determines the rotation of the plot, so that this item is
#' @param rotationdegrees default = NULL: the fixed amount of degrees of which each item is rotated (as in a compas, -90 is a quarter rotation anti-clockwise), additive to possible rotation to description
#'
#' @param ... ellipsis
#'
#' @return a ggplot object
#' @export
#'
# ' @examples dummy

stat_solvii <- function(  mapping = NULL,
                          data = NULL,
                          geom = "solvii",
                          position = "identity",
                          show.legend = TRUE,
                          inherit.aes = TRUE,
                          na.rm = FALSE,
                        ## geomspecific parameter
                          levelmax = 99,
                          structuredf = sii_structure_sf16_eng,
                          outlinedf = sii_outline_sf16_eng,
                          maxscrvalue = NULL,
                          levelonedescription = "SCR",
                          aggregatesuffix = "_other",
                          scalingx = 1,
                          scalingy = 1,
                          fullstructure = FALSE,
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
                                      levelonedescription = levelonedescription,
                                      aggregatesuffix = aggregatesuffix,
                                      scalingx = scalingx,
                                      scalingy = scalingy,
                                      fullstructure = fullstructure,
                                      rotationdegrees = rotationdegrees,
                                      rotationdescription = rotationdescription,
                                    ## internal params
                                      outlinedf = outlinedf,
                                      purpose = "surfaces",
                                    ## ellipsis
                                      ...
                     )             )
    }  ## end of definition stat_solvii

## ====================================================================== =====
