## sii_debug
#' sii_debug
#'
#' assists in finding level or description mismatches in a set parameter(tables)
#'
#' @param data_descr (no default) the vector 'description' from the data
#' @param structure (no default) the structure dataframe
#' @param levelmax (optional, no default): the levelmax dataframe, when not filled the expanded structure assumes levelmax was set to 99 for all levels.
#' @param outline (optional, no default): the outline dataframe
#' @param fillcolor (optional, no default): fillcolor parameter (list with items "description" = "color" where color can be a name, #hexcode or other )
#' @param edgecolor (optional, no default): edgecolor parameter (list with items "description" = "color" where color can be a name, #hexcode or other )
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
                          outline = NULL,
                          fillcolor = NULL,
                          edgecolor = NULL
                      )
{
## preparation to make parameter(list) to call fn_structure_expansion
debugparams <- NULL
debugparams$structuredf <- structure
debugparams$levelmax <- levelmax
if (is.null(levelmax)) {debugparams$levelmax <- 99}
debugparams$aggregatesuffix <- aggregatesuffix
## call
struct2 <- fn_structure_expansion(debugparams)

## retreiving descriptions from inputted parameters
d_d <- levels(data_descr) ; d_d_df <- as.data.frame(d_d) ; d_d_df$data <- "present" ; descr <- d_d
s_d <- unique(structure$description) ;s_d_df <- as.data.frame(s_d) ; s_d_df$structure <- "present" ; descr <- c(descr, s_d)
s2_d <- unique(struct2$description) ;s2_d_df <- as.data.frame(s2_d) ; s2_d_df$enrichedstructure <- "present"
if (!is.null(outline)) {
  o_d <- unique(outline$levelordescription) ; o_d_df <- as.data.frame(o_d) ; o_d_df$outline <- "present"; descr <- c(descr, o_d)
}
if (!is.null(fillcolor)) {
  f_d <- names(fillcolor) ; f_d_df <- as.data.frame(f_d) ; f_d_df$fillcolor <- "present"; descr <- c(descr, f_d)
}
if (!is.null(edgecolor)) {
  e_d <- names(edgecolor) ; e_d_df <- as.data.frame(e_d) ; e_d_df$edgecolor <- "present"; descr <- c(descr, e_d)
}

descr <- unique(descr) ; descr_df <- as.data.frame(descr)

## merging into a result table
m1 <- merge(x = descr_df, y = d_d_df, by.x = c("descr"), by.y = c("d_d"), all.x = TRUE)
m1 <- merge(x = m1, y = s_d_df, by.x = c("descr"), by.y = c("s_d"), all.x = TRUE)
m1 <- merge(x = m1, y = s2_d_df, by.x = c("descr"), by.y = c("s2_d"), all.x = TRUE)
if (!is.null(outline)) {
  m1 <- merge(x = m1, y = o_d_df, by.x = c("descr"), by.y = c("o_d"), all.x = TRUE)
}
if (!is.null(fillcolor)) {
  m1 <- merge(x = m1, y = f_d_df, by.x = c("descr"), by.y = c("f_d"), all.x = TRUE)
}
if (!is.null(edgecolor)) {
  m1 <- merge(x = m1, y = e_d_df, by.x = c("descr"), by.y = c("e_d"), all.x = TRUE)
}

## retreiving levels from inputted parameters
s_l <- unique(struct2$level) ;s_l_df <- as.data.frame(s_l) ; s_l_df$structure <- "present"; lvl <- s_l
l_l <- unique(as.character(levelmax$level)) ;l_l_df <- as.data.frame(l_l) ; l_l_df$levelmax <- "present"; lvl <- c(lvl, l_l)
if (!is.null(outline)) {
  o_l <- unique(outline$levelordescription) ; o_l_df <- as.data.frame(o_l) ; o_l_df$outline <- "present"; lvl <- c(lvl, o_l)
}
lvl <- unique(lvl) ; lvl_df <- as.data.frame(lvl)

## merging into a result table
m2 <- merge(x = lvl_df, y = s_l_df, by.x = c("lvl"), by.y = c("s_l"), all.x = TRUE)
m2 <- merge(x = m2, y = l_l_df, by.x = c("lvl"), by.y = c("l_l"), all.x = TRUE)
if (!is.null(outline)) {
  m2 <- merge(x = m2, y = o_l_df, by.x = c("lvl"), by.y = c("o_l"), all.x = TRUE)
}

## combining two result tables in one result list
result <- NULL
result$debug_description <- m1
result$debug_level <- m2
 return(result)
}

