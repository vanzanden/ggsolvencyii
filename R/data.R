## sii_structure_sf16_eng ##############
#' sii_structure_sf16_eng
#'
#' a standard formula structure (as of 2016), with descriptions in English.
#'
#' @docType data
#'
#' @source determined based on specification of EIOPA standard formula Solvency II structure. \cr
#' import from excel is straightforward:\cr
# ' \dontrun{
#' \code{
#'  sii_structure_sf16_eng<- readxl::read_xlsx("xls/preparingtables.xlsx",sheet="struct_sf16_eng", col_types=c(rep("text",3),rep("skip",5)))
#'  }
# '  }
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
#'


#
"sii_structure_sf16_eng"


## sii_levelmax_sf16_995 ##############
#' sii_levelmax_sf16_995
#'
#' tekst
# ' maximum number of items in a level, 99 items for levels 1-3 (SCR, BSCR/OR/ADJ, Market/life/... risks) and 5 items for lowerlevel risk (equity/longevity/...)
#'
# ' @docType data
# '
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

## sii_levelmax_sf16_993 ##############
#' sii_levelmax_sf16_993
#'
#' tekst
# ' maximum number of items in a level, 99 items for levels 1-3 (SCR, BSCR/OR/ADJ, Market/life/... risks) and 3 items for lowerlevel risk (equity/longevity/...)
#'
# ' @docType data
# '
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

## sii_outline_sf16_eng ##############
#' sii_outline_sf16_eng
#'
#' is a table for geom_solviioutline indicating which outlines of each circle segment should be shown, specified per level, as defined in the structure. A circle segment is defined by ri (radius inner), ro (radius outer), db (degrees beginning, based on a compas, with 0 degrees pointing up from the center) and de (degrees end)
#' named outline1 to 4 respectively. With a dataframe with columns 'levelordescription' and 'outline1', ..., 'outline 4' (default is outline_sf16_eng) for each item can be determined which lines to plot.
#'
#' @docType data
#'
#' @source determined based on specification of EIOPA standard formula Solvency II structure
#'
#' @format A data frame with columns:
#' \describe{
#'            \item{levelordescription}{string with format 'level(numeric)' <point> 'sublevel' 'd'  with d indicating diversification}
#'            \item{outline1}{logical: the radial line between ri and ro, for db }
#'            \item{outline2}{logical: the outer line between db and de, for ro }
#'            \item{outline3}{logical: the radial line between ro and ri, for de }
#'            \item{outline4}{logical: the inner line between de and db, for ri.}
#'            \item{outline11}{NOT YET IMPLEMENTED: logical: analogue to outline1, but but only for the first plotted component of that level. The components in each  level are plotted clockwise}
#'            \item{outline13}{NOT YET IMPLEMENTED: logical: analogue to outline3, but but only for the last plotted component of that level. }
#'          }
#'
#' @examples
#' sii_outline_sf16_eng
"sii_outline_sf16_eng"

## sii_z_example4_outline_exceptions ##############
#' sii_z_example4_outline_exceptions
#'
#' is a table for geom_solviioutline indicating which outlines of each circle segment should be shown, specified per level, as defined in the structure. A circle segment is defined by ri (radius inner), ro (radius outer), db (degrees beginning, based on a compas, with 0 degrees pointing up from the center) and de (degrees end). In this example file the components m_equity and l_lapse are individual described, overruling their standard level outline description
#'
#' @docType data
#'
#' @source determined based on specification of EIOPA standard formula Solvency II structure
#'
#' @format A data frame with columns:
#' \describe{
#'            \item{levelordescription}{string with format 'level(numeric)' <point> 'sublevel' 'd'  with d indicating diversification}
#'            \item{outline1}{logical: the radial line between ri and ro, for db }
#'            \item{outline2}{logical: the outer line between db and de, for ro }
#'            \item{outline3}{logical: the radial line between ro and ri, for de }
#'            \item{outline4}{logical: the inner line between de and db, for ri.}
#'            \item{outline11}{NOT YET IMPLEMENTED: logical: analogue to outline1, but but only for the FIRST plotted component of that level. The components in each  level are plotted clockwise}
#'            \item{outline13}{NOT YET IMPLEMENTED: logical: analogue to outline3, but but only for the LAST plotted component of that level. }
#'          }
#'
#' @examples
#' sii_z_example4_outline_exceptions
"sii_z_example4_outline_exceptions"

## sii_z_example1_data ##############
#' sii_z_example1_data
#'
#' example dataset, in tidyverse format, with only one instance of a limited filled sf structure.
#'
#' @docType data
#'
#' @source loosely based on public SFCR report of a medium sized dutch life insurer
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

## sii_z_example2_data ##############
#' sii_z_example2_data
#'
#' example dataset, in tidyverse format, with several instances of a completely  filled sf structure,
#'
#' @docType data
#'
#' @source loosely based on public SFCR report of a medium sized dutch life insurer
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



## sii_z_example3_structure ##############
#' sii_z_example3_structure
#'
#' a standard formula structure (as of 2016), with descriptions in English
#'
#' @docType data
#'
#' @source determined based on specification of EIOPA standard formula Solvency II structure
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


## sii_z_example3_data ##############
#' sii_z_example3_data
#'
#' example dataset, in tidyverse format, with several instances of a filled sf structure,
#'
#' @docType data
#'
#' @source based on public SFCR reports of a medium sized dutch life insurer in Oosterhout
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



## sii_z_example3_levelmax ##############
#' sii_z_example3_levelmax
#'
#' tekst
# ' maximum number of items in a level, 99 items for levels 1-3 (SCR, BSCR/OR/ADJ, Market/life/... risks) and 3 items for lowerlevel risk (equity/longevity/...)
#'
# ' @docType data
# '
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
