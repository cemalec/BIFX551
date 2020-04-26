#' Adding Function
#'
#' This function allows you to add two numbers together
#' @param x defult is zero
#' @param y default is zero
#'
#' @keywords add, adding, addition, numbers
#'
#' @return answer
#'
#' #' @example
#' adding(2,9)
#'
#' @export
adding <- function(x=0, y=0){
  if ((typeof(x) == "character")||(typeof(y) == "character")){
    print("Please use a valid integer")
    return()
  }
  answer <- x+y;
  return(answer)
}
