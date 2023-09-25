#' Determines missing tiles in a challenge
#'
#' Calculates which tiles are missing from a given challenge.
#'
#' @param n, integer (1-64) indicating the challenge number
#' @return a table of counts for missing tiles in a consistent format
#'
#' @export
#' @examples
#' missing(1)
#' missing(64)
#'
missing <- function(n) {
  stopifnot(n %in% 1:64)

  # Create table of tiles in the challenge
  challenge_tiles <- subset(tiles,
                            subset = type == "Challenge" & number == n &
                              !(tile == "blank"),
                            select = tile)
  ctable <- table(challenge_tiles)

  # Create table of all tiles
  nv <- c(`cross-over` = NA, `left exit` = NA, `right exit` = NA, split = NA)
  total <- replace(nv, names(nv), c(3,2,2,3))

  # Subtract challenge tiles from all tiles
  total["cross-over"] <- total["cross-over"] - ctable["cross-over"]
  total["left exit"]  <- total["left exit"]  - ctable["left exit"]
  total["right exit"] <- total["right exit"] - ctable["right exit"]
  total["split"]      <- total["split"]      - ctable["split"]

  return(total)
}
