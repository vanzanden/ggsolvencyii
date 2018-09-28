## sii_structure_sf16_eng ====================================================== =====
#' sii_structure_sf16_eng
#'
#' a standard formula structure (as of 2016), with descriptions in English.
#'
#' @docType data
#'
#' @source determined based on specification of EIOPA standard formula Solvency II structure. \cr
#' \cr import from accompanying excel:\cr
#' \code{
#'  sii_structure_sf16_eng <- \cr readxl::read_xlsx(path = "xls/preparingtables.xlsx",\cr
#'                                              sheet = "struct_sf16_eng",\cr
#'                                              col_types = c(rep("text", 3),rep("skip", 5)))\cr
#'  }
#'
#' @format A data frame with columns:
#' \describe{
#'           \item{description}{string: the name of the component}
#'           \item{level}{string with format 'level(numeric)' [<point> 'sublevel'] ['d'] \cr with d indicating diversification}
#'           \item{childlevel}{string, same format as level, indicating the level of which the components combine into this level }
#'          }
#'
#' @examples
#' sii_structure_sf16_eng
"sii_structure_sf16_eng"

## sii_structure_sf16_nld ====================================================== =====
#' sii_structure_sf16_nld
#'
#' a standard formula structure (as of 2016), with descriptions in Dutch.
#'
#' @docType data
#'
#' @source determined based on specification of EIOPA standard formula Solvency II structure. \cr
#' \cr import from accompanying excel:\cr
#' \code{
#' sii_structure_sf16_nld <- \cr readxl::read_xlsx(path = "xls/preparingtables.xlsx",\cr
#'                                              sheet = "struct_sf16_nld",\cr
#'                                              col_types = c(rep("text", 3), rep("skip", 5)))
#'  }
#'
#' @format A data frame with columns:
#' \describe{
#'           \item{description}{string: the name of the component}
#'           \item{level}{string with format 'level(numeric)' [<point> 'sublevel'] ['d'] \cr with d indicating diversification}
#'           \item{childlevel}{string, same format as level, indicating the level of which the components combine into this level }
#'          }
#'
#' @examples
#' sii_structure_sf16_nld
"sii_structure_sf16_nld"



## sii_levelmax_sf16_995 ======================================================= =====
#' sii_levelmax_sf16_995
#'
#' maximum number of items in a level, 99 items for levels 1-3 (SCR, BSCR/OR/ADJ, Market/life/... risks) and 5 items for lowerlevel risk (equity/longevity/...) in a standard formula structure.
#'
#' @docType data
#'
#' @source
#' \cr import from accompanying excel:\cr
#' \code{
#'   sii_levelmax_sf16_995 <- \cr readxl::read_xlsx(path = "xls/preparingtables.xlsx",\cr
#'                                            sheet = "levelmax_sf16_995")
#'  }
#' @format A data frame with columns:
#' \describe{
#'           \item{level}{string with format 'level(numeric)' [<point> 'sublevel'] ['d'] } with d indicating diversification
#'           \item{levelmax}{integer \ code indicating the total number of components to be shown in a level, consisting of the x-1 largest components and the remaining components combined in one other}
#'          }
#'
#'
#' @examples
#' sii_levelmax_sf16_995
"sii_levelmax_sf16_995"

## sii_levelmax_sf16_993 ======================================================= =====
#' sii_levelmax_sf16_993
#'
#' maximum number of items in a level, 99 items for levels 1-3 (SCR, BSCR/OR/ADJ, Market/life/... risks) and 3 items for lowerlevel risk (equity/longevity/...) in a standard formula structure.
#'
#'
#' @docType data
# '
#' @source
#' \cr import from accompanying excel:\cr
#' \code{
#'   sii_levelmax_sf16_995 <- \cr readxl::read_xlsx(path = "xls/preparingtables.xlsx",\cr
#'                                            sheet = "levelmax_sf16_993")
#'  }
#'
#' @format A data frame with columns:
#' \describe{
#'           \item{level}{string with format 'level(numeric)' [<point> 'sublevel'] ['d'] } with d indicating diversification
#'           \item{levelmax}{integer \ code indicating the total number of components to be shown in a level, consisting of the x-1 largest components and the remaining components combined in one other}
#'          }
#'
#'
#' @examples
#' sii_levelmax_sf16_993
"sii_levelmax_sf16_993"

## sii_outline_sf16_eng ======================================================== =====
#' sii_outline_sf16_eng
#'
#' A table for \code{\link{geom_solviioutline}} indicating which outlines of each item should be shown, specified per level and/or description. the latter overrule the former. \cr
#' when defining an item (or the \code{squared = TRUE} transformation) 4 lines can be distinguised, a radialline going outwards, a circle segment (clockwise), a radialline going inwards, a circle segment (counterclockwise). These are numbered as outline1 to outline4.
#'
#' @docType data
#'
#' @source determined based on specification of EIOPA standard formula Solvency II structure
#' \cr import from accompanying excel:\cr
#' \code{
#'  data <- \cr readxl::read_xlsx(path = "xls/preparingtables.xlsx",\cr
#'                            sheet = "outline_sf16_eng")\cr
#'    data$levelordescription <- as.character(data$levelordescription)\cr
#'    data$outline1 <- as.logical(data$outline1)\cr
#'    data$outline2 <- as.logical(data$outline2)\cr
#'    data$outline3 <- as.logical(data$outline3)\cr
#'    data$outline4 <- as.logical(data$outline4)\cr
#'    data$outline11 <- as.logical(data$outline11)\cr
#'    data$outline13 <- as.logical(data$outline13)\cr
#'    \cr
#'    sii_outline_sf16_eng <- as.data.frame(data)\cr
#' }
#'
#' @format A data frame with columns:
#' \describe{
#'            \item{levelordescription}{string with format 'level(numeric)' <point> 'sublevel' 'd'  with d indicating diversification}
#'            \item{outline1}{boolean (logical): the radial line between ri and ro, for db }
#'            \item{outline2}{boolean (logical): the outer line between db and de, for ro }
#'            \item{outline3}{boolean (logical): the radial line between ro and ri, for de }
#'            \item{outline4}{boolean (logical): the inner line between de and db, for ri.}
#'            \item{outline11}{NOT YET IMPLEMENTED: boolean (logical): analogue to outline1, but but only for the first plotted component of that level. The components in each  level are plotted clockwise}
#'            \item{outline13}{NOT YET IMPLEMENTED: boolean (logical): analogue to outline3, but but only for the last plotted component of that level. }
#'          }
#'
#' @examples
#' sii_outline_sf16_eng
"sii_outline_sf16_eng"


## sii_outline_sf16_nld ======================================================== =====
#' sii_outline_sf16_nld
#'
#' A table for \code{\link{geom_solviioutline}} indicating which outlines of each item should be shown, specified per level and/or description. the latter overrule the former. \cr
#' when defining an item (or the \code{squared = TRUE} transformation) 4 lines can be distinguised, a radialline going outwards, a circle segment (clockwise), a radialline going inwards, a circle segment (counterclockwise). These are numbered as outline1 to outline4.
#'
#' @docType data
#'
#' @source determined based on specification of EIOPA standard formula Solvency II structure
#' \cr import from accompanying excel:\cr
#' \code{
#'  data <- \cr readxl::read_xlsx(path = "xls/preparingtables.xlsx",\cr
#'                            sheet = "outline_sf16_nld")\cr
#'    data$levelordescription <- as.character(data$levelordescription)\cr
#'    data$outline1 <- as.logical(data$outline1)\cr
#'    data$outline2 <- as.logical(data$outline2)\cr
#'    data$outline3 <- as.logical(data$outline3)\cr
#'    data$outline4 <- as.logical(data$outline4)\cr
#'    data$outline11 <- as.logical(data$outline11)\cr
#'    data$outline13 <- as.logical(data$outline13)\cr
#'    \cr
#'    sii_outline_sf16_eng <- as.data.frame(data)\cr
#' }
#'
#' @format A data frame with columns:
#' \describe{
#'            \item{levelordescription}{string with format 'level(numeric)' <point> 'sublevel' 'd'  with d indicating diversification}
#'            \item{outline1}{boolean (logical): the radial line between ri and ro, for db }
#'            \item{outline2}{boolean (logical): the outer line between db and de, for ro }
#'            \item{outline3}{boolean (logical): the radial line between ro and ri, for de }
#'            \item{outline4}{boolean (logical): the inner line between de and db, for ri.}
#'            \item{outline11}{NOT YET IMPLEMENTED: boolean (logical): analogue to outline1, but but only for the first plotted component of that level. The components in each  level are plotted clockwise}
#'            \item{outline13}{NOT YET IMPLEMENTED: boolean (logical): analogue to outline3, but but only for the last plotted component of that level. }
#'          }
#'
#' @examples
#' sii_outline_sf16_nld
"sii_outline_sf16_nld"




## sii_z_example1_data ========================================================= =====
#' sii_z_example1_data
#'
#' example dataset, in tidyverse format, with only one instance of a limited filled sf structure.
#'
#' @docType data
#'
#' @source loosely based on public SFCR report of a medium sized dutch life insurer
#' \cr import from accompanying excel:\cr
#' \code{
#'  data <- \cr readxl::read_xlsx(path = "xls/preparingtables.xlsx",\cr
#'                            sheet = "ex1_data") %>%\cr
#'            tidyr::gather(key = description,\cr
#'                          value = value,\cr
#'                          -id, -time, -ratio)\cr\cr
#'  sii_z_example1_data <- \cr data.frame(
#'                                      time = as.numeric(data$time),\cr
#'                                      ratio = as.numeric(data$ratio),\cr
#'                                      description = data$description,   # it has to be a factor !!\cr
#'                                      value = as.numeric(data$value),\cr
#'                                      id = data$id \cr
#'                                      )\cr
#'  }
#'
#' @format A data frame with columns:
#' \describe{
#'            \item{time}{numerical: a representation of an x value: x aesthetic could also be a normal numbering, or a longitude}
#'            \item{ratio}{numerical: solvency II ratio, a representation of an y value: y aesthetic could also be a lattitude}
#'            \item{description}{character: component of the structure}
#'            \item{id}{ number}
#'            \item{value}{numerical }
#'          }
#'
#' @examples
#' sii_z_example1_data
"sii_z_example1_data"

## sii_z_example2_data ========================================================= =====
#' sii_z_example2_data
#'
#' example dataset, in tidyverse format, with several instances of a completely  filled sf structure,
#'
#' @docType data
#'
#' @source loosely based on public SFCR report of a medium sized dutch life insurer
#' \cr import from accompanying excel:\cr
#' \code{
#'  data <- \cr readxl::read_xlsx(path = "xls/preparingtables.xlsx",\cr
#'                            sheet = "ex2_data") %>%\cr
#'            tidyr::gather(key = description,\cr
#'                          value = value,\cr
#'                          -id, -time, -ratio)\cr\cr
#'  sii_z_example1_data <- \cr data.frame(
#'                                      time = as.numeric(data$time),\cr
#'                                      ratio = as.numeric(data$ratio),\cr
#'                                      description = data$description,   # it has to be a factor !!\cr
#'                                      value = as.numeric(data$value),\cr
#'                                      id = data$id, \cr
#'                                      comparewithid = data$comparewithid
#'                                      )\cr
#'  }
#'
#' @format A data frame with columns:
#' \describe{
#'            \item{time}{numerical: a representation of an x value: x aesthetic could also be a normal numbering, or a longitude}
#'            \item{ratio}{numerical: solvency II ratio, a representation of an y value: y aesthetic could also be a lattitude}
#'            \item{description}{character: component of the structure}
#'            \item{id}{ number: }
#'            \item{value}{numerical: }
#'            \item{comparewithid}{numerical: }
#'          }
#'
#' @examples
#' sii_z_example2_data
"sii_z_example2_data"



## sii_z_example3_structure ==================================================== =====
#' sii_z_example3_structure
#'
#' a standard formula structure (as of 2016), with descriptions in English
#'
#' @docType data
#'
#' @source determined based on specification of EIOPA standard formula Solvency II structure
#' @source
#' \cr import from accompanying excel:\cr
#' \code{
#'   sii_z_example3_structure <- \cr  readxl::read_xlsx(path = "xls/preparingtables.xlsx",\cr
#'                                                sheet = "ex3_struct",\cr
#'                                                col_types = c(rep("text", 3),rep("skip", 2)))
#'  }
#'
#' @format A data frame with columns:
#' \describe{
#'           \item{description}{string: the name of the component, or a diversification}
#'           \item{level}{string with format 'level(numeric)' [<point> 'sublevel'] ['d'] } with d indicating diversification
#'           \item{childlevel}{string of the same format as level, indicating the level of which the components make up this item }
#'          }
#'
#' @examples
#' sii_z_example3_structure
"sii_z_example3_structure"


## sii_z_example3_data ========================================================= =====
#' sii_z_example3_data
#'
#' example dataset, in tidyverse format, with several instances of a filled sf structure,
#'
#' @docType data
#'
#' @source based on public SFCR 2017 reports of a medium sized dutch life insurer in Oosterhout
#' \cr import from accompanying excel:\cr
#' \code{
#'  data <- \cr readxl::read_xlsx(path = "xls/preparingtables.xlsx",\cr
#'                            sheet = "ex3_data") %>%\cr
#'            tidyr::gather(key = description,\cr
#'                          value = value,\cr
#'                          -id, -time, -ratio)\cr\cr
#'  sii_z_example1_data <- \cr data.frame(
#'                                      time = as.numeric(data$time),\cr
#'                                      ratio = as.numeric(data$ratio),\cr
#'                                      description = data$description,   # it has to be a factor !!\cr
#'                                      value = as.numeric(data$value),\cr
#'                                      id = data$id, \cr
#'                                      comparewithid = data$comparewithid
#'                                      )\cr
#'  }
#'
#' @format A data frame with columns:
#' \describe{
#'            \item{time}{numerical: a representation of an x value: x aesthetic could also be a normal numbering, or a longitude}
#'            \item{ratio}{numerical: solvency II ratio, a representation of an y value: y aesthetic could also be a lattitude}
#'            \item{description}{character: component of the structure}
#'            \item{id}{ number: }
#'            \item{value}{numerical: }
#'            \item{comparewithid}{numerical: }
#'          }
#'
#' @examples
#' sii_z_example3_data
"sii_z_example3_data"



## sii_z_example3_levelmax ===================================================== =====
#' sii_z_example3_levelmax
#'
#' tekst
# ' maximum number of items in a level, 99 items for levels 1-3 (SCR, BSCR/OR/ADJ, Market/life/... risks) and 3 items for lowerlevel risk (equity/longevity/...)
#'
# ' @docType data
#'
#' @source
#' \cr import from accompanying excel:\cr
#' \code{
#'  data <- readxl::read_xlsx(path = "xls/preparingtables.xlsx",
#'                            sheet = "ex3_levelmax")
#'  sii_z_example3_levelmax <- data.frame(
#'                                        level = as.character(data$level),
#'                                        levelmax = as.numeric(data$levelmax)
#'                                        )
#' }
#'
#' @format A data frame with columns:
#' \describe{
#'           \item{level}{string with format 'level(numeric)' [<point> 'sublevel'] ['d'] } with d indicating diversification
#'           \item{levelmax}{integer \ code indicating the total number of components to be shown in a level, consisting of the x-1 largest components and the remaining components combined in one other}
#'          }
#'
#'
#' @examples
#' sii_z_example3_levelmax
"sii_z_example3_levelmax"

## sii_z_example4_outline ====================================================== =====
#' sii_z_example4_outline
#'
#' is a table for geom_solviioutline indicating which outlines of each circle segment should be shown, specified per level, as defined in the structure. A circle segment is defined by ri (radius inner), ro (radius outer), db (degrees beginning, based on a compas, with 0 degrees pointing up from the center) and de (degrees end). In this example file the components m_equity and l_lapse are individual described, overruling their standard level outline description
#'
#' @docType data
#'
#' @source determined based on specification of EIOPA standard formula Solvency II structure
#' \cr import from accompanying excel:\cr
#' \code{
#'  data <- \cr readxl::read_xlsx(path = "xls/preparingtables.xlsx",\cr
#'                            sheet = "ex4_outline")\cr
#'    data$levelordescription <- as.character(data$levelordescription)\cr
#'    data$outline1 <- as.logical(data$outline1)\cr
#'    data$outline2 <- as.logical(data$outline2)\cr
#'    data$outline3 <- as.logical(data$outline3)\cr
#'    data$outline4 <- as.logical(data$outline4)\cr
#'    data$outline11 <- as.logical(data$outline11)\cr
#'    data$outline13 <- as.logical(data$outline13)\cr
#'    \cr
#'    sii_outline_sf16_eng <- as.data.frame(data)\cr
#' }
#'
#'
#' @format A data frame with columns:
#' \describe{
#'            \item{levelordescription}{string with format 'level(numeric)' <point> 'sublevel' 'd'  with d indicating diversification}
#'            \item{outline1}{boolean (logical): the radial line between ri and ro, for db }
#'            \item{outline2}{boolean (logical): the outer line between db and de, for ro }
#'            \item{outline3}{boolean (logical): the radial line between ro and ri, for de }
#'            \item{outline4}{boolean (logical): the inner line between de and db, for ri.}
#'            \item{outline11}{NOT YET IMPLEMENTED: boolean (logical): analogue to outline1, but but only for the FIRST plotted component of that level. The components in each  level are plotted clockwise}
#'            \item{outline13}{NOT YET IMPLEMENTED: boolean (logical): analogue to outline3, but but only for the LAST plotted component of that level. }
#'          }
#'
#' @examples
#' sii_z_example4_outline
"sii_z_example4_outline"
