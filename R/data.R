#' The tiles on the cards
#'
#' Provides details about the tiles and their slots on the cards. Slots are
#' numbered in the following way
#'            1
#'          2   3
#'        4   5   6
#'      7   8   9   10
#'
#' @format A data frame with 1280 rows and 5 variables:
#' \describe{
#'   \item{type}{type of card: Challenge or Solution}
#'   \item{number}{challenge number (1-64)}
#'   \item{slot}{slot number (1-10), see diagram above}
#'   \item{tile}{tile type (split, cross-over, right exit, left exit)}
#' }
#'
"tiles"


#' The count of marbles in each target
#'
#' Marble circuit has 8 marbles that start from 8 different gates and run
#' through the tiles to 5 targets. This provides the count of marbles for each
#' target, numbered 1 to 5 from left to right.
#'
#' @format A data frame with 640 rows and 4 variables:
#' \describe{
#'   \item{type}{type of card: Challegne or Solution}
#'   \item{number}{challenge number (1-64)}
#'   \item{target}{target number (1-5), numbered from left to right}
#'   \item{count}{the number of marbles in that target}
#' }
#'
"targets"
