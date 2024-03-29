% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{tiles}
\alias{tiles}
\title{The tiles on the cards}
\format{
A data frame with 1280 rows and 5 variables:
\describe{
\item{type}{type of card: Challenge or Solution}
\item{number}{challenge number (1-64)}
\item{slot}{slot number (1-10), see diagram above}
\item{tile}{tile type (split, cross-over, right exit, left exit)}
}
}
\usage{
tiles
}
\description{
Provides details about the tiles and their slots on the cards. Slots are
numbered in the following way
1
2   3
4   5   6
7   8   9   10
}
\keyword{datasets}
