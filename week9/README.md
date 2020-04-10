# Models in R
You will take other courses in this sequence that will better address modeling in R. However, R is a *statistical* programming language because it is explicitly designed for statistical analysis. It makes sense, therefore, to spend some time covering some of the primary methods of modeling within R. 

## T-test
We already cover [t-tests](https://github.com/cemalec/BIFX551/tree/master/week6), this is for comparing two continuous variables in that differ by some condition. A large t-statistic means that it is likely that the means of the two measurements are different.

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

### Another example: Titanic data
A lower dimensional example may illustrate what is going on here. We use a classic dataset of survival from the Titanic. There are survival rates among cabin class, sex, and age. We'll choose age to keep this as a 2x2 contingency table.

```{r}
data(Titanic) #Load titanic data, includes survival statistics of 109 children and 2092 adults
Survival_age <- as.data.frame(Titanic) #Convert to dataframe from table
                  %>% select(c('Age','Survived','Freq')) 
                  %>% group_by(Age,Survived) %>% summarize(Total = sum(Freq)) 
                  %>% pivot_wider(names_from=Survived,values_from = Total) 
                  %>% column_to_rownames('Age')

#Create synthetic data based on 109 children and 2092 adults, randomly assign whether each passenger survived.
Titanic_synth <- data.frame('Survived'=c(sample(c('No','Yes'),109,replace=TRUE), 
                                         sample(c('No','Yes'),2092,replace=TRUE)),
                            'Age'=c(rep('Child',109),rep('Adult',2092)))

#Create contingency table for synthetic data
Survival_age_synth <- Titanic_synth %>% group_by(Age,Survived) %>% summarize(Total = n()) 
                                    %>% pivot_wider(names_from=Survived,values_from = Total) 
                                    %>% column_to_rownames('Age')

```

The real data looks like this:

_   |Survived|Died|
---|---|---
Child | 57 | 52
Adult | 654 | 1458

The synthetic data looks like this:

_   |Survived|Died|
---|---|---
Child | 59 | 50
Adult | 1044 | 1048

We can see that the real data indicates a strong trend for Adults, and therefore we suspect that this contingency table is unlikely due to chance. The Chi-squared test results in a statistic of 20.005 and a p-value of 7.7e-6, and we therefore reject the null hypothesis. The Chi-squared test for the synthetic data results in a statistic of 0.52234 and a p-value of 0.47, and we therefore fail to reject the null hypothesis. This is good news, because the synthetic data is explicitly due to chance!

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
