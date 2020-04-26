#' A Subtraction Function
#'
#' This function subtracts one number from another
#' @param x The first number
#' @param y The second number

subtraction <- function(x, y) {
  if ((typeof(x)!= 'integer') & (typeof(x) != 'double')) {
    print('Both arguments must be either integers or double.')
    return(NULL)
  } else if ((typeof(y)!= 'integer') & (typeof(y) != 'double')){
    print('Both arguments must be either integers or double.')
    return(NULL)
  }
  z <- x - y
  return(z)
}
