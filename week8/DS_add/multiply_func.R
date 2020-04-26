#' Multiply Function
#'
#' This function allows you to multiply two numbers together
#' @param x defult is zero
#' @param y default is zero
#'
#' @keywords multiply, multiplication, multiplying numbers
#'
#' @return answer
#'
#' @example
#' multiplying(2,9)
#'
#' @export
multiplying <- function(x=0, y=0){
  if ((typeof(x) == "character")||(typeof(y) == "character")){
    print("Please use a valid integer")
    return()
  }
  answer <- x*y;
  return(answer)
}
