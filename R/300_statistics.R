## GNU General Public License version 3 , see file LICENCE ============== =====
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
##
## small:
##
## ====================================================================== =====


#' statistics
#'
#' This behaviour can be switched off by means of calling " "
#' When switche on a reminder is given in regular intervals. This behaviour can also be switched off by calling " "
#' @param caller (default = "stat_usage.csv") the filename which will be downloaded, for each geom is a separate file available
#'
#' @return nothing
#'
#' @examples
#' # library(ggsolvencyii)
#' ggsolvencyii:::statistics()
#' sii_setoption_statistics_httpfailurecounter <- function(cnt = 52)
#' ggsolvencyii:::statistics(caller = "404notfound.csv")
#' sii_setoption_statistics_httpfailurecounter <- function(cnt = 0)
#' sii_setoption_statistics_participate(participate = TRUE)
statistics <- function(caller = "stat_usage.csv")
  {
    P <- getOption("ggsolvencyii_statistics_participate") # returns NULL, or the value
    if (is.null(P))
      { sii_setoption_statistics_participate(participate = TRUE, quiet = TRUE)
        P <- TRUE
        sii_setoption_statistics_remind(remind = TRUE, quiet = TRUE)
        sii_setoption_statistics_remindercounter(cnt = 0)
        sii_setoption_statistics_httpfailurecounter(cnt = 0)
      }
    R <- getOption("ggsolvencyii_statistics_remind") # returns the value
    RC <- getOption("ggsolvencyii_statistics_remindercounter") # returns the value
    FC <- getOption("ggsolvencyii_statistics_httpfailurecounter")

    if (P == TRUE)
      {
        callresult <- get_external_data(caller = caller)
         if (callresult == FALSE)
          {
            options("ggsolvencyii_statistics_httpfailurecounter" = FC + 1)
           if (FC > 50)
              {
                  P <- FALSE
                 sii_setoption_statistics_participate(participate = FALSE, quiet = TRUE)
              }
          } else
          {options("ggsolvencyii_statistics_httpfailurecounter" = 0)}
      }
    if (R == TRUE)
      {
        sii_setoption_statistics_remindercounter(cnt = RC + 1)
        if (RC %in% c(1 , 2 , 3 , 5 , 10 ,50, 100 , 200 , 500 , 1000 , 1500 , 2500)) {print("reminder: anonymous userdata is send to www.vanzanden.nl. This behaviour can be switched of by sii_setoption_statistics_participate(participate = FALSE). This reminder can be switched of with sii_setoption_statistics_remind(remind = FALSE)")}
      }
    return("done")
    }


#' sii_setoption_statistics_participate
#' sets the option to participate in anonymous user statistics, no other data is sent other than the calling geom and the IP adress
#'
#' @param participate (boolean, default = TRUE) whether to participate
#' @param quiet (boolean, default = FALSE) whether to confirm that the option is set
#'
#' @return participate
#' @export
#'
#' @examples
#' library(ggsolvencyii)
#' sii_setoption_statistics_participate()
#' sii_setoption_statistics_participate(FALSE)
#' sii_setoption_statistics_participate(participate = FALSE, quiet = FALSE)
#'
sii_setoption_statistics_participate <- function(participate = TRUE, quiet = FALSE){
  options("ggsolvencyii_statistics_participate" = participate)
  sii_setoption_statistics_httpfailurecounter() # cnt = 0
  caller = "stat_statisticsOFF.csv"
  if ( participate == TRUE) {caller = "stat_statisticsON.csv"}
  callresult <- get_external_data <- function(caller = caller)
  if (quiet == FALSE) {print(paste0("option is set: ggsolvencyii_statistics_participate is set to ",participate))}
  return(participate)
}


#' sii_setoption_statistics_remind
#' sets the option to remind that participation is set to TRUE (if that is the case) after 1,2,3,5,10,50,100,200,500,1000,1500,2500 calls
#'
#' @param remind (default = TRUE) : whether to remind that participation is set
#' @param quiet (default = FALSE) : whether to confirm that the option is set
#'
#' @return remind
#' @export
#'
#' @examples
#' library(ggsolvencyii)
#' sii_setoption_statistics_remind()
#' sii_setoption_statistics_remind(remind = FALSE)
#' sii_setoption_statistics_remind(remind = FALSE, quiet = TRUE)
#'
sii_setoption_statistics_remind <- function(remind = TRUE,  quiet = FALSE){
  options("ggsolvencyii_statistics_remind" = remind)
  caller = "reminderOFF.csv"
  if ( remind == TRUE) {caller = "stat_reminderON.csv"}
  callresult <- get_external_data <- function(caller = caller)
  if (quiet == FALSE) {print(paste0("option is set: ggsolvencyii_statistics_remind is set to ",remind))}
  return(remind)
}


#' sii_setoption_statistics_remindercounter
#'
#' @param cnt (default = 0)
#'
#' @return nothing
#'
#' @examples
#' # library(ggsolvencyii)
#' ggsolvencyii:::sii_setoption_statistics_remindercounter()
#' ggsolvencyii:::sii_setoption_statistics_remindercounter(cnt = 10)
#'
sii_setoption_statistics_remindercounter <- function(cnt = 0){
  options("ggsolvencyii_statistics_remindercounter" = cnt)
}


#' sii_setoption_statistics_httpfailurecounter
#'
#' @param cnt (default = 0) the value to be assigned to the counter
#'
#' @return nothing
#'
#' @examples
#' # library(ggsolvencyii)
#' ggsolvencyii:::sii_setoption_statistics_httpfailurecounter()
#' ggsolvencyii:::sii_setoption_statistics_httpfailurecounter(cnt = 10)
#'
sii_setoption_statistics_httpfailurecounter <- function(cnt = 0){
  options("ggsolvencyii_statistics_httpfailurecounter" = cnt)
  }




#' get_external_data makes a call to website vanzanden.nl. The only purpose is to track the usage of (parts) of the package.
#'
#' @param caller (default = "stat_usage.csv") the filename which will be downloaded, for each geom is a separate file available
#'
#' @return it returns a list: $success = TRUE/FALSE
#' @importFrom httr HEAD
#' @importFrom utils read.csv
#'
#' @examples
#' library(ggsolvencyii)
#' callresult <- ggsolvencyii:::get_external_data(caller = "stat_usage.csv")
#' callresult
get_external_data <- function(caller = "stat_usage.csv")
{
  file = paste0("http://www.vanzanden.nl/ggsolvencyii/usetracking/",caller)
  status <- httr::HEAD(file)
  # print(status$status_code)
  callresult = FALSE
  if (status$status_code == 200) {callresult <- read.csv(file)} # increasing the counter on the vanzanden.nl domain.
  return(callresult)
}




# options("ggsolvencyii_statistics_participate" = NULL)
# options("ggsolvencyii_statistics_remind" = NULL)
# options("ggsolvencyii_statistics_remindercounter" = NULL)
#
# getOption("ggsolvencyii_statistics_participate" )
# getOption("ggsolvencyii_statistics_remind" )
# getOption("ggsolvencyii_statistics_remindercounter" )
# getOption("ggsolvencyii_statistics_httpfailurecounter" )
#
#
#
#
# statistics





