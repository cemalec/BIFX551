#' A Concentration Conversion Function
#'
#'A function to determine volume given target concentration. Will print volume of stock required to get to target concentration. Both concentrations must be in same units
#' @param c1 Target concentration in nM or ng/uL
#' @param v1 Target volume in uL
#' @param c2 Current concentration in nM or ng/uL
#' @keywords concentration, volume, target, dilution
#' @export
#' @examples
#' c1v1(50, 10, 300)
#' > 1.67 uL
c1v1 <- function(c1 = 0, v1 = 0, c2 = 0){
  print((c1*v1)/c2)
}
