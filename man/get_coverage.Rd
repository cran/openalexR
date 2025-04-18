% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/openalexR-coverage.R
\name{get_coverage}
\alias{get_coverage}
\title{Get coverage of OpenAlex fields in openalexR}
\usage{
get_coverage(entity = NULL)
}
\arguments{
\item{entity}{The OA entity to inspect field coverage for. Returns
information for all fields if `NULL` (default).}
}
\value{
Data frame of field coverage information
}
\description{
Get coverage of OpenAlex fields in openalexR
}
\examples{
oa_entities()
head(get_coverage(entity = "works"))
}
\seealso{
oa_entities()
}
