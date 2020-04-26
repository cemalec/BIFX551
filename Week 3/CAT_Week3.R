#Dataset from https://github.com/rmcelreath/rethinking/tree/master/data
fgs <- read.delim('fieldgoals.csv', sep = ';')
summary(fgs)
#The average player seems to make a little less than half the shots that they take.  Even the best seems to miss about a third.
fgs$FGPer <- fgs$FGM/fgs$FGA
plot(fgs$FGM ~ fgs$FGA,
     xlab = "Fieldgoal Attempts",
     ylab = 'Fieldgoals Made',
     main = 'Fieldgoals Made vs Attempts')
