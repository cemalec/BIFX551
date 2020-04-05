# Models in R
You will take other courses in this sequence that will better address modeling in R. However, R is a *statistical* programming language because it is explicitly designed for statistical analysis. It makes sense, therefore, to spend some time covering some of the primary methods of modeling within R. 

## T-test
We already cover t-tests, this is for comparing two continuous variables in that differ by some condition. A large t-statistic means that it is likely that the means of the two measurements are different.

## Chi-squared test
The chi-squared test is typically used for factor variables. A large chi-squared statistic indicates that the counts of different factor variables are most likely not an accident. Put another way, a chi-squared statistic of zero would mean that the null hypothesis is correct and the number of factor variables appearing in a data set is due to chance.

The chisq.test in R requires that you format your input as a *contingency table*. This means that the rows are one factor variable and the columns are another, and the matrix elements are counts for each combination of factors. Here is an example of how to format such a table:

```{r}
library(tidyr)
library(dplyr)
library(tibble)
data(diamonds) #load the diamonds data set.

count_matrix <- diamonds %>% select(c(cut,color)) #Select the columns of factor variables 'cut' and 'color'
                  %>% group_by(cut,color) %>% summarize(count = n()) #Group and count the data set by 'cut' and 'color'
                  %>% pivot_wider(names_from = color,values_from = count) #Turn the color column into columns
                  %>% column_to_rownames(var="cut") #Turn the 'cut' column into rownames, could also eliminate 'cut'
```

Now you have a matrix of counts for each combination of 'color' and 'cut' from the diamonds data set. To get a chi-squared statistic

```{r}
library(stats)
Xsq <- chisq.test(count_matrix) #Using our contigency table
Xsq2 <- chisq.test(diamonds$cut,diamonds$color) #Equivalent, and frankly easier, but you might want the formatted table
```

chisq.test returns a list just like t.test. Type help(chisq.test) for a listing of all 9 attributes of chisq.test's output as well as additional options for chisq.test.

## Linear Model
Linear models are simply a regression model, in r, it is called by the lm function in the stats package.
```{r}
linear_model <- lm(formula = price ~ carat, data = diamonds)
linear_model_twovars <- lm(formula = price ~ depth + carat, data= diamonds)
linear_model_all <- lm(formula = price ~ ., data = diamonds)
linear_model_allbut <- lm(formula = price ~ . - color, data = diamonds)
```
## Logistic Model
