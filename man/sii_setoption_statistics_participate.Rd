% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/300_statistics.R
\name{sii_setoption_statistics_participate}
\alias{sii_setoption_statistics_participate}
\title{sii_setoption_statistics_participate
sets the option to participate in anonymous user statistics, no other data is sent other than the calling geom and the IP adress}
\usage{
sii_setoption_statistics_participate(participate = TRUE, quiet = FALSE)
}
\arguments{
\item{participate}{(boolean, default = TRUE) whether to participate}

\item{quiet}{(boolean, default = FALSE) whether to confirm that the option is set}
}
\value{
participate
}
\description{
sii_setoption_statistics_participate
sets the option to participate in anonymous user statistics, no other data is sent other than the calling geom and the IP adress
}
\examples{
library(ggsolvencyii)
sii_setoption_statistics_participate()
sii_setoption_statistics_participate(FALSE)
sii_setoption_statistics_participate(participate = FALSE, quiet = FALSE)

}
