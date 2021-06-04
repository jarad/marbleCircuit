#' Number of tile permutations
#' 
#' Marble circuit is a puzzle game containing 10 tiles, 4 unique types, that 
#' must be placed in a particular order to obtain a desired number of marbles in 
#' each of five target spaces. There are 4 unique types of tile. 
#' This function will determine the number of unique arrangements
#' of a subset of these tiles. The user must indicate the number of each type
#' of tile. 
#' 
#' @param n a count vector indicating the number each unique tiles
#' 
#' @return the number of unique permutations
#' 
#' @author Jarad Niemi
#' 
#' @examples 
#' permutations(1)
#' permutations(rep(1,4))
#' permutations(c(3,3,2,2))
#' 
#' @export
#' 
permutations <- function(n) {
  if (any(n<0))
    stop("Elements of `n` must be positive")
  if (any(!is.wholenumber(n)))
    stop("Elements of `n` must be whole numbers")
  
  s <- sum(n)
  if (s > 10 | length(n) > 4 | any(n>3))
    warning("This is not a valid marble circuit configuration.")
  
  
  p <- lfactorial(s)
  for (i in 1:length(n)) 
    p <- p - lfactorial(n[i])
  
  return(exp(p))
}


#' Checks for whole numbers
#' 
#' @param x a numeric vector
#' 
#' @return a logical vector indicating whether the element is a whole number
#' 
#' @seealso \link{\code{permutations}}, examples in \link{\code{is.integer}}
#' 
is.wholenumber <-
  function(x, tol = .Machine$double.eps^0.5)  abs(x - round(x)) < tol
