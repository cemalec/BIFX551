**BIFX551 Celcius to Fahrenheit coversion** 


#Function for the conversion of celcius to Fahrenheit 

CTof <- function(temp_C) {
  temp_f <- ((9/5 * temp_C) + 32)
  return(temp_f)
} 

#Upload data frame called Pressure. Pressure contains two column temperature and pressure.
pressure

  temperature | pressure
  ----------- | -----------
   |         0 | 0.0002       |     
   |        20 | 0.0012       |   
   |        40 | 0.0060       |
   |        60 | 0.0300       |
   |        80 | 0.0900       |
   |       100 | 0.2700       |
   |       120 | 0.7500       |
   |       140 | 1.8500       |
   |       160 | 4.2000       |
   |       180 | 8.8000       |
   |       200 | 17.3000      |
   |       220 | 32.1000      |
   |       240 | 57.0000      |
   |       260 | 96.0000      |
   |       280 | 157.0000     | 
   |       300 | 247.0000     | 
   |       320 | 376.0000     | 
   |       340 | 558.0000     |
   |       360 | 806.0000     |
          


#add pressure$Fahrenheit column to the pressure data frame by inputing the temperature data into the CToF function outputting Farenheit values 

pressure$Fahrenheit <- CTof(pressure$temperature)

**pressure$Fahrenheit**

**pressure**

**# final output**

  | temperature | pressure | Fahrenheit |
  | ----------- | -------- | --------- |
  |          0  |  0.0002  |     32  |
  |         20  | 0.0012   |     68  |
  |         40  | 0.0060   |     104 |
  |         60  | 0.0300   |     140 |
  |         80  | 0.0900   |     176 |
  |        100  | 0.2700   |     212 |
  |        120  | 0.7500   |     248 |
  |        140  | 1.8500   |     284 |
  |        160  | 4.2000   |     320 |
  |        180  | 8.8000   |     356 |
  |        200  | 17.3000  |     392 |
  |        220  | 32.1000  |     428 |
  |        240  | 57.0000  |     464 |
  |        260  | 96.0000  |     500 |
  |        280  | 157.0000 |     536 |
  |        300  | 247.0000 |     572 |
  |        320  | 376.0000 |     608 |
  |        340  | 558.0000 |     644 |
  |        360  |806.0000  |     680 |
