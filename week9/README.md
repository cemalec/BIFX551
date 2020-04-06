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

#Predict new data
predict.lm(linear_model, data.frame(carat = c(0.4,0.5,0.6,0.8))
```
The coefficients for a linear model can be displayed by linear_model$coefficients. A vector of residuals can be generated from linear_model$residuals.

## Logistic Model
Logistic models are similar to a linear model, except the data is fit to a 'logit' function instead of a linear one. Logistic models are effective for modeling a binary probability vs either a continuous or a discrete variable. The function for implementing logistic models in R is glm (generalized linear model). glm can fit several different models, including gaussian, so you must specify a family of functions as shown below.

```{r}
data(rats)

logit_model_cont <- glm(formula = status~time, data = rats, family = binomial(link = "logit"))
logit_model_disc <- glm(formula = status~sex, data = rats, family = binomial(link = "logit"))

#Predict new data, 'response' indicates to output probabilities
predict.glm(logit_model_cont, newdata= data.frame(time=c(0,10,20,30,40)),type = "response")
```

The coefficients of the continuous model represent a fit to the logistic function, a large value means a large uncertainty in the demarcation between the two categories. A negative sign indicates that the '1' category is more likely for a smaller value of the continuous variable.

The coefficients of the dicrete model represent a relative probability compared to an 'anchor' level of the factor variable. In this example, my model output 'sexm' meaning that the coefficient -3.29 is with reference to the 'm' level of the 'sex' factor variable. In this case, female rats were much more likely than male rats to be in the '0' category, or censored out of the study.
