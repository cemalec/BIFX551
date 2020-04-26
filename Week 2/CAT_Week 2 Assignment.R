#This function takes a weight in either pounds or kilos.
#The first argument is the value, the second is the starting unit

convert_weight <- function(value , unit){
  if(typeof(value)!= 'double' & typeof(value) != 'integer'){
    print('Please enter a valid integer or double as value.')
    return()
  }
  if(unit == "kilo"){
    convert_value <- value * 2.2
  }
  else if(unit == "pound"){
    convert_value <- value / 2.2
  }
  else{
    print('Please enter the unit as either kilo or pound.')
    return()
  }
  
  return(convert_value)
}

#In the dataset chickwts, the weight of chicks is measured for different feed types.
#The weight in grams were taken at six weeks for each chick.
#The data shows a pretty dramatic difference based on diet.