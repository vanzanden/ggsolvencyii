## sii_debug
#' sii_debug
#'
#' assists in finding level or description mismatches in a set parameter(tables)
#'
#' @param data_descr (no default) the vector 'description' from the data
#' @param fillcolor (default = sii_x_fillcolors_sf16_eng): fillcolor parameter
#' @param edgecolor (default = sii_x_fillcolors_sf16_eng): edgecolor parameter
#' @param structure (default = sii_structure_sf16_eng) : the structure dataframe
#' @param levelmax (default = sii_levelmax_995): the levelmax dataframe
#' @param outline (default = sii_outline_sf16_eng): the outline dataframe
#'
#' @return prints two comparison tables and puts them in $debug_description and $debug_level
#' @export
#'
# ' @examples
sii_debug <- function(data_descr,
                          structure = ggesolvencii::sii_structure_sf16_eng,
                          # structure_level = ggesolvencii::sii_structure_sf16_eng$level,
                          levelmax = ggesolvencii::sii_levelmax_995,
                          # levelmax_level = ggesolvencii::sii_levelmax_995$level,
                          outline = ggesolvencii::sii_outline_sf16_eng,
                          fillcolor = ggsolvencyii::sii_x_fillcolors_sf16_eng,
                          edgecolor = ggsolvencyii::sii_x_edgecolors_sf16_eng
                          )
{
d_d <- levels(data_descr) ; d_d_df <- as.data.frame(d_d) ;d_d_df$data <- "present"
s_d <- unique(structure$description) ;s_d_df <- as.data.frame(s_d) ; s_d_df$structure <- "present"
o_d <- unique(outline$levelordescription) ; o_d_df <- as.data.frame(o_d) ; o_d_df$outline <- "present"
f_d <- names(fillcolor) ; f_d_df <- as.data.frame(f_d) ; f_d_df$fillcolor <- "present"
e_d <- names(edgecolor) ; e_d_df <- as.data.frame(e_d) ; e_d_df$edgecolor <- "present"

descr <- unique(c(d_d, s_d, o_d, f_d, e_d)) ; descr_df <- as.data.frame(descr)

m1 <- merge(x = descr_df, y = d_d_df, by.x = c("descr"), by.y = c("d_d"), all.x = TRUE)
m1 <- merge(x = m1, y = s_d_df, by.x = c("descr"), by.y = c("s_d"), all.x = TRUE)
m1 <- merge(x = m1, y = o_d_df, by.x = c("descr"), by.y = c("o_d"), all.x = TRUE)
m1 <- merge(x = m1, y = f_d_df, by.x = c("descr"), by.y = c("f_d"), all.x = TRUE)
m1 <- merge(x = m1, y = e_d_df, by.x = c("descr"), by.y = c("e_d"), all.x = TRUE)

# print("result comparison of column 'description'")
# print(m1)


s_l <- unique(structure$level) ;s_l_df <- as.data.frame(s_l) ; s_l_df$structure <- "present"
# print(s_l_df)
l_l <- unique(levelmax$level) ;l_l_df <- as.data.frame(l_l) ; l_l_df$levelmax <- "present"
# print(l_l_df)
o_l <- unique(outline$levelordescription) ; o_l_df <- as.data.frame(o_l) ; o_l_df$outline <- "present"
# print(o_l_df)
lvl <- unique(c( s_l, l_l, o_l)) ; lvl_df <- as.data.frame(lvl)
# print(lvl)
m2 <- merge(x = lvl_df, y = s_l_df, by.x = c("lvl"), by.y = c("s_l"), all.x = TRUE)
m2 <- merge(x = m2, y = l_l_df, by.x = c("lvl"), by.y = c("l_l"), all.x = TRUE)
m2 <- merge(x = m2, y = o_l_df, by.x = c("lvl"), by.y = c("o_l"), all.x = TRUE)
# print("result comparison of column 'level'")
# print(m2)

result <- NULL
result$debug_description <- m1
result$debug_level <- m2
# x <- data.frame()
# x$debug_description <- 1
# x$debug_level <- 1
## print and return results
 return(result)
}

