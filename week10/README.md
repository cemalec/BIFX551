# R Shiny
R Shiny is a package to create interactive dashboards and data exploration tools. Every Shiny application requires two parts a **user interface** (ui) and a **server** (server). The User interface outlines what the application should look like, what types of widgets should be used for inputs and outputs. The server outlines exactly how the input gets transformed into an output.

Once you install shiny, a great way to learn about how it works is to look at the built-in examples

```{r}
install.packages("shiny")
library(shiny)

runExample("01_hello")      # a histogram
runExample("02_text")       # tables and data frames
runExample("03_reactivity") # a reactive expression
runExample("04_mpg")        # global variables
runExample("05_sliders")    # slider bars
runExample("06_tabsets")    # tabbed panels
runExample("07_widgets")    # help text and submit buttons
runExample("08_html")       # Shiny app built from HTML
runExample("09_upload")     # file upload wizard
runExample("10_download")   # file download wizard
runExample("11_timer")      # an automated timer
```

You can create your own Shiny app easily from within RStudio by selecting "Shiny Web Application" from the "New File" option in the "File" menu of RStudio.
