## functions in this file =============================================== =====
##
## main:
##    fn_setupdata_surfaces
##    fn_structure_expansion
##    fn_structure_data_integration
## small:
##    fn_determinelevels
##    fn_add_ind_show
##
## ====================================================================== =====

## fn_setupdata_surfaces ================================================= =====
#' fn_setupdata_surfaces
#'
#' @inheritParams fn_maxscrvalue
#'
#' @return an adjusted version of input dataframe data

fn_setupdata_surfaces <- function(data, params) {
        expandedstructure <- fn_structure_expansion(params = params
                                                     )

        structureanddata <- fn_structure_data_integration(expandedstructure = expandedstructure,
                                                    data = data)
      ## tbv ordering of legenda
        levelordering <- as.list(expandedstructure$description)
        structureanddata$description <- factor(structureanddata$description, levels = levelordering)
        if ('fill' %in% colnames(structureanddata)) {
            if (structureanddata$description[1] == structureanddata$fill[1]) {
              structureanddata$fill <- factor(structureanddata$fill, levels = levelordering)
          }
        }
        if ('colour' %in% colnames(structureanddata)) {
          if (structureanddata$description[1] == structureanddata$colour[1]) {
            structureanddata$colour <- factor(structureanddata$colour, levels = levelordering)
          }
        }



        data_out <- structureanddata
      ## return results
        return(data_out)
    }

## fn_structure_expansion =============================================== =====
#' fn_structure_expansion takes the structure dataframe and enriches it with additional lines for accumulation
#'
#' @inheritParams fn_maxscrvalue
#'
#' @importFrom magrittr %>%
#'
#' @return a dataframe

fn_structure_expansion <- function(params) {
        structuredf     <- params$structuredf
        levelmax        <- params$levelmax
        aggregatesuffix <- params$aggregatesuffix

        s_out <- structuredf
        ## preserve initial ordering of structure
        s_out <- dplyr::mutate(s_out, ordering_1 = 1:nrow(s_out))
        ## adding ind_d column
        s_out$ind_d <- NA
        s_out$ind_d <- grepl("d", s_out$level)
        ##making additional lines in structure for
        ## which levels are children and so are possible prone to grouping?
        ## all levels other then 1 !
        groupinglines <- fn_determinelevels(s_out$level)
        groupinglines <- groupinglines[groupinglines != "1"]
        ## description of grouping lines is deducted from description of
        ## higher level combined with aggregatesuffix
        groupinglines <- as.data.frame(groupinglines)
        colnames(groupinglines) <- "level_grouping"
        ## next line adds a column description, filled with the name of
        ## the level above the current
        groupinglines <- merge(x = groupinglines, y = s_out,
                               all.X = TRUE, by.x = "level_grouping",
                               by.y = "childlevel")
        ## populating columns
        ### can next three lines be combined ?
        groupinglines <- dplyr::select(groupinglines, description,
                                       level = level_grouping )
        groupinglines$description <- paste0(groupinglines$description,
                                            aggregatesuffix)
        groupinglines$level <- paste0(groupinglines$level, "o")
        groupinglines$childlevel <- NA
        groupinglines$ordering_1 <- NA
        groupinglines$ind_d <- FALSE
        groupinglines$ind_o <- TRUE
        ## initial location of "o"-lines is just after last item of level
        groupinglines$ordering_2 <- NULL
        for (i in 1:nrow(groupinglines)) {
          l_tmp <- gsub("o", "", groupinglines$level[i])
          s_tmp <- s_out$ordering_1[s_out$level == l_tmp]
          max_tmp <- max(s_tmp)
          groupinglines$ordering_2[i] <- max_tmp + 0.5
        }
        ## adding "o" lines to structure, reordering and renumbering
        ## preparing additional columns
        s_out$ind_o <- FALSE
        s_out$ordering_2 <- s_out$ordering_1
        ## adding
        s_out <- rbind(s_out, groupinglines)
        ## sorting and renumbering
        s_out <- s_out[order(s_out$ordering_2), ]
        s_out$ordering_2 <- 1:nrow(s_out)
        ## now to remove the lines where we know for sure no aggregation will
        ## take place, so it will not show up in legend.
        ## counting number of items for each level
        t1 <- s_out %>%
                    dplyr::group_by(level) %>%
                    dplyr::summarise(n = n())

        ## maximum of components in each level, determined by dataframe or integer

        if (length(levelmax) == 1) {
          levelmaxdf <- data.frame(level = t1$level,
                                   levelmax = rep(levelmax, nrow(t1)))
        } else {
# print(as.data.frame(levelmax))
# print(" ")
# print(data.frame(level = t1$level,levelmax = rep(99, nrow(t1))))
          levelmaxdf <- rbind(as.data.frame(levelmax),
                              data.frame(level = t1$level,
                                   levelmax = rep(99, nrow(t1))))
# print("pre deduplicate")
# print(levelmaxdf)
          levelmaxdf <- levelmaxdf[ !duplicated(levelmaxdf$level),]
# print("post deduplicate")
# print(levelmaxdf)
          # if(nrow(levelmaxdf) > levelmax) {
          #   print(paste0("parameter levelmax is expanded met levelmax = 99 for one or more levels present in the structure: ",
          #                "see 'sii_debug(data_descr = <data>$description,structure = <structure>,levelmax = <levelmax>' for a comparison"
          #               ))
        }

      ## if the levelmax of a level is smaller than the amount of lines of that
      ##  level which have a childlevel associated this gives issues. first
      ##  idea was to raise the maxlevel but this might result in a complex
      ## issue if childless levellines have higher values. It is solved in
      ## the actual grouping by an advanced ordering (not level,-value but
      ##  level, childlevel,-value)    see flag_levelmaxissue

        ## for which levels is aggregation not needed
        ## t1 columns: level, n   ;  t2 columns: level, levelmax
        t2 <- merge(x = t1, y = levelmaxdf, all.x = TRUE, by = "level" )
        t2 <- t2 %>%
                  dplyr::mutate(ind_neveraggregate = (n <= levelmax))
        todelete <- paste0(t2[t2$ind_neveraggregate == TRUE, ]$level, "o")
        s_out <- s_out[!(s_out$level %in% todelete), ]
        s_out$levelmax <- levelmaxdf$levelmax[match(s_out$level, levelmaxdf$level)]
        s_out$ordering_2 <- 1:nrow(s_out)
      ## return result
        return(s_out)
    }


## fn_determinelevels =================================================== =====
#' fn_determinelevels reduces a vector with levels to a list with unique items, possible after further selection or transformation to value
#'
#' @param vector_in a vector with levels, this function reduces it to unique values
#' @param ind_value default = FALSE: levels are returned as value. Implies that ind_d and ind_o are set to FALSE (while default is TRUE)
#' @param ind_integer default = FALSE: levels are returned as value. Implies that ind_value is set to TRUE, and hence ind_d and ind_o to FALSE
#' @param ind_d default = TRUE: xxxxd levels are included in the result
#' @param ind_o default = TRUE: xxxxo levels are included in the result
#' @param ind_onlyspecials default = FALSE: non xxxxd/xxxo levels are NOT included in the result
#'
#' @return a vector of levels, in character, numeric or integer format

fn_determinelevels <- function(vector_in,  ind_value = FALSE,
                                ind_integer = FALSE,
                                ind_d = TRUE,
                                ind_o = TRUE,
                                ind_onlyspecials = FALSE) {
    v_out <- c(vector_in)
    ## forcing correct combinations of TRUE/FALSE for ind_... parameters
    if (ind_integer == TRUE)    { ind_value <- TRUE}
    if (ind_value == TRUE)      {
      ind_d <- FALSE
      ind_o <- FALSE
      ind_onlyspecials <- FALSE
    }
    if (ind_d == FALSE)         {v_out <- v_out[!grepl("d", v_out)] }
    if (ind_o == FALSE)         {v_out <- v_out[!grepl("o", v_out)] }
    if (ind_onlyspecials == TRUE) {
      p_1 <- v_out[grepl("d", v_out)]
      p_2 <- v_out[grepl("o", v_out)]
      v_out <- c(p_1, p_2)
    }
    if (ind_value == TRUE) {
      v_out <- as.double(v_out)
      if (ind_integer == TRUE) {v_out <- trunc(v_out) }
    }
    if (length(v_out) == 0) {
      v_out <- NULL
    } else {
      v_out <- unique(v_out)
    }
  ## return results
    return(v_out)
}



## fn_structure_data_integration ======================================== =====
#' fn_structure_data_integration combines data and expanded structure, calculation aggregated items and removing lines for which no aggregation is nessecary.
#'
#' @param expandedstructure result of fn_structure_expansion()
#' @inheritParams fn_maxscrvalue
#'
#' @importFrom magrittr %>%
#'
#' @return data


fn_structure_data_integration <- function(expandedstructure,
                                           data) {
    ## columns in expandedstructure:
    ##  description(chr), level(chr), childlevel(chr),
    ##  ordering_1 (int), ind_d(lgl), ind_o(lgl), ordering_2(int)
    ## columns in data (as returned by geom_..-call)
    ## x, y, description, value, group, (comparewithid),
    ##    (PANEL), (FILLCOLOR), (COLOR), ...
    data <- dplyr::mutate(data, group = id)

    ## basis merge, this leaves "o" lines out of the picture
    d_out <- merge(x = data, y = expandedstructure,
                   all.x = TRUE, by = "description")
    d_names <- colnames(d_out)
    #d_lines <- nrow(d_out)

    ## we have to add lines for possible "o"-lines.
    ## the levels for which an "o" possibility exists
    s_t1 <- fn_determinelevels(expandedstructure$level,
                               ind_d = FALSE, ind_o = TRUE,
                               ind_onlyspecials = TRUE)
    if (!is.null(s_t1)) {
      s_t1 <- as.data.frame(s_t1)
      colnames(s_t1) <- "level"
      s_t1$leveltmp <- sub("o", "", s_t1$level)
      ## first we take a copy of basismerge, and remove each line which has
      ## an id and level equal to the next line, or for the level there will
      ## never be a need for an "o"-line
      m_t1 <- d_out
      m_t1 <- d_out[order(d_out$id, d_out$level, d_out$value), ]
      m_rows <- nrow(m_t1)
      m_counter <- m_rows
      while (m_counter >= 2 ) {
        if (m_t1$id[m_counter - 1] == m_t1$id[m_counter] & m_t1$level[m_counter - 1] == m_t1$level[m_counter] ) {
          m_t1 <- m_t1[-(m_counter - 1), ]
          m_rows <- m_rows - 1
          m_counter <- m_counter - 1
        } else {
          if (m_t1$level[m_counter] %in% s_t1$leveltmp == FALSE) {
            m_t1 <- m_t1[-(m_counter), ]
            m_rows <- m_rows - 1
            m_counter <- m_counter - 1
          } else {
            m_counter <- m_counter - 1
          }
        }
      }
      ## and check for line 1
      if (m_t1$level[1] %in% s_t1$leveltmp == FALSE) {
        m_t1 <- m_t1[-1, ]
      }

      ## next step is to fill m_t1 with correct data
      ## x, y, id, group, PANEL, comparewithid are already correct
      m_t1$level            <- paste0(m_t1$level, "o")
      m_t1$childlevel       <- NA
      m_t1$description      <- expandedstructure$description[match(m_t1$level,
                                                expandedstructure$level)]
      m_t1$value            <- 0
      m_t1$ind_d            <- FALSE
      m_t1$ind_o            <- TRUE
      m_t1$ordering_1       <- expandedstructure$ordering_1[match(m_t1$level,
                                                expandedstructure$level)]
      m_t1$ordering_2       <- expandedstructure$ordering_2[match(m_t1$level,
                                                expandedstructure$level)]
      m_t1$levelmax         <- 1

      ## COLOR and FILLCOLOR: most likely it will be connected to description,
      ## although user could have coupled it with id
      ## there might be a need to copy the properties
      ## of the smallest item of the corresponding level
      d_t2 <- d_out
      ## find smallest value for each id/level combination
      d_t2 <- d_t2  %>%
        dplyr::group_by(group, level) %>%
        dplyr::summarise(minvalue = min(value))
      d_t2 <- d_t2[d_t2$level %in% fn_determinelevels(d_t2$level,
                                                      ind_d = FALSE,
                                                      ind_o = FALSE), ]
      d_t2$tmplevel <- paste0(d_t2$level, "o")
      ## FILLCOLOR
      if ("fill" %in% d_names) {
        m_t1$fill <- NA
        if (d_out$fill[1] == d_out$description[1]) {m_t1$fill <- m_t1$description}
        if (d_out$fill[1] == d_out$group[1]) {m_t1$fill <- m_t1$group}
        if (is.na(m_t1$fill[1])) { m_t1$fill <- d_t2$fill[match(m_t1$level, d_t2$tmplevel)]}
      }
      ## COLOUR
      if ("colour" %in% d_names) {
        if (d_out$colour[1] == d_out$description[1]) {m_t1$colour <- m_t1$description}
        if (d_out$colour[1] == d_out$group[1]) {m_t1$colour <- m_t1$group}
      }
      d_out <- rbind(d_out, m_t1)
      ## reorder (id/group ascending, ordering_2 ascending)
      d_out <- d_out[order(d_out$group, d_out$ordering_2), ]
      ## and add a new ordering
      d_out$ordering_3 <- 1:nrow(d_out)

      ## actual determining if grouping is neccesary:
      ## loop over group and level, for each combination determine
      ## of grouping is neccesary,
      ## if so. calculate grouped value and mark lines to be
      ## included in final data or not
      # d_out$ind_show <- TRUE
      # d_out$ind_show[d_out$ind_d == TRUE] <- FALSE
      # d_out$ind_show[d_out$ind_o == TRUE] <- FALSE
      d_out <- fn_add_ind_show(d_out)

      ## each corepart of the nested for loop is a selection of d_out,
      ##which will be adjusted and pasted in a new dataframe: d_out2
      d_out2 <- d_out[1, ]
      d_out2 <- d_out2[0, ]

      for (g_counter in unique(d_out$group)) {
        g_lines <- d_out[d_out$group == g_counter, ]
        for (l_counter in fn_determinelevels(g_lines$level,
                                               ind_d = FALSE, ind_o = FALSE)) {
          gl_lines <- g_lines[g_lines$level == l_counter, ]
          ## only if an "o"-line exists is a further selection needed
          if (paste0(l_counter, "o") %in% g_lines$level == TRUE) {
              o_line       <- g_lines[g_lines$level == paste0(l_counter, "o"), ]
              gl_lines     <- g_lines[g_lines$level == l_counter, ]
              gl_lines_withchild <- gl_lines[!is.na(gl_lines$childlevel), ]
              gl_lines_nochild <- gl_lines[is.na(gl_lines$childlevel), ]
              count_gllines <- nrow(gl_lines)
              count_gllines_withchild <- nrow(gl_lines_withchild)
              count_gllines_nochild <- nrow(gl_lines_nochild)
              ## controle flag-C
            if (count_gllines != count_gllines_withchild + count_gllines_nochild) {
              print("error in fn_structure_data_integration, flag-C")
            }
            max_gllines  <- gl_lines$levelmax[1]
            ## geen grouping possible if no of lines without components = 0 or 1,
            ## this check should be replaced to fn_structure_expansion
            if (count_gllines_nochild <= 1 & (count_gllines_withchild + count_gllines_nochild > max_gllines)) {
              print(paste0("for level ", l_counter,
                           " for id=", g_counter,
                           " no accumulation is possible: only one levelcomponent has no childlevels, adjust parameter(dataframe) levelmax"))
              d_out2 <- rbind(d_out2, gl_lines)
            } else {
              ## flag_levelmaxissue
              if (max_gllines < count_gllines_withchild + 1) {
                max_old <- max_gllines
                max_gllines <- count_gllines_withchild + 1 ## we know count_gllines_nochild is greater or equal to 2
                  print(paste0("for level ", l_counter,
                               " for id=", g_counter,
                               " levelmax is adjusted from ", max_old,
                               " to ", max_gllines,
                               ", due to the amount of childlevels" ))
                  rm(max_old)
              }
              if (count_gllines > max_gllines) {
                gl_lines_nochild <- gl_lines_nochild[order(-gl_lines_nochild$value ), ]
                count_gllines_nochild_keep <- max_gllines - count_gllines_withchild - 1
                if (count_gllines_nochild_keep < 1) {
                  gl_lines_nochild_keep <- gl_lines_nochild[0, ]
                } else {
                  gl_lines_nochild_keep <- gl_lines_nochild[1:count_gllines_nochild_keep, ]
                }
                gl_lines_nochild_tosum <- gl_lines_nochild[count_gllines_nochild_keep +
                                                        1:(nrow(gl_lines_nochild) - count_gllines_nochild_keep), ]
                gl_lines_nochild_tosum$ind_show <- FALSE
                o_line$value <- sum(gl_lines_nochild_tosum$value)
                o_line$ind_show <- TRUE
                d_out2 <- rbind(d_out2,
                                gl_lines_withchild,
                                gl_lines_nochild_keep,
                                gl_lines_nochild_tosum,
                                o_line)
              } else {
                d_out2 <- rbind(d_out2, gl_lines)
              }
            }
          } else {
            d_out2 <- rbind(d_out2, gl_lines)
          } # end else
        } # end for
      }  ## next l_counter, next g_counter
    } else {
      ## er zijn in het geheel geen "o" rijen (dus is.null(s_t1) == TRUE)
      d_out <- fn_add_ind_show(d_out)
      d_out2 <- d_out
      d_out2 <- d_out2[order(d_out2$ordering_2), ]
      d_out2$ordering_3 <- 1:nrow(d_out2)
    }
  ## toevoegen ordering 4 maar opnieuw orderen op basis van ordering 3
    d_out2$ordering_4 <- 1:nrow(d_out2)
    d_out2b <- d_out2[order(d_out2$ordering_3), ]
    d_out2.rownames <- 1:nrow(d_out2)
    ## delete obsolete lines
    d_out2 <- d_out2[d_out2$ind_show == TRUE, ]
    d_out2 <- d_out2[d_out2$value != 0, ]
  ## return results
    return(d_out2)
}

## fn_add_ind_show ====================================================== =====
#' fn_add_ind_show
#'
#' fn_add_ind_show is a little piece that has to be added to data in either fork
#'   after the \cr "if (!is.null(s_t1))" statement to fill column ind_show
#'   for several items
#'
#' @inheritParams fn_maxscrvalue
# ' @param data an dataframe, consisting of the dataset and the expanded structure
#'
#' @return the dataframe with an added column ind_show

fn_add_ind_show <- function (data) {
        data$ind_show <- TRUE
        data$ind_show[data$ind_d == TRUE] <- FALSE
        data$ind_show[data$ind_o == TRUE] <- FALSE
      ## return results
        return(data)
    }
