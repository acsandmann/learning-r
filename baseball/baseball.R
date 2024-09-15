# baseball hitting activity

# import data
library(readr)
Baseball_Hitting_Selection <- read_csv("~/Documents/linearalgebra/Baseball_Hitting_Selection.csv")
#View(Baseball_Hitting_Selection)

# keep column 2 and 4..19
mybaseballdata <- Baseball_Hitting_Selection[, c(2, 4:19)]

# ensure data is numeric
mybaseballdata$H <- as.numeric(mybaseballdata$H)
mybaseballdata$`2B` <- as.numeric(mybaseballdata$`2B`)
mybaseballdata$`3B` <- as.numeric(mybaseballdata$`3B`)
mybaseballdata$HR <- as.numeric(mybaseballdata$HR)

# add column and manipulate data
mybaseballdata$TNB <- with(mybaseballdata, 
                           (H - `2B` - `3B` - HR) + 2 * `2B` + 3 * `3B` + 4 * HR)
# weight vector & define scores
# Assign weights to each of the 17 columns in the dataset (Age, G, PA, etc.)
weights <- c(0.05, 0.05, 0.1, 0.15, 0.2, 0.1, 0.05, 0.15, 0.1, 0.1, 0.05, 0.1, 0.05, 0.2, 0.2, 0.25, 0.3)
scores <- as.matrix(mybaseballdata[, c(1:17)]) %*% weights

# add score
mybaseballdata$Score <- scores

# sort players
mybaseballdata <- mybaseballdata[order(-mybaseballdata$Score), ]

# alternative ranking
weights_obp_slg_war <- c(0.4, 0.4, 0.2) # weights(on base, slugger, wins above replacement)
selected <- mybaseballdata[, 15:17]
selected$score <- as.matrix(selected) %*% weights_obp_slg_war

# sort
selected <- selected[order(-selected$score), ]
View(selected)

View(mybaseballdata)
print(mybaseballdata)