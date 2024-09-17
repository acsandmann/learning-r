candy_data <- read.csv("~/Documents/schoolgithub/learning-r/homework9-17/candy-data.csv")

weights <- c(3, 2, 1, 0, 4, 0, 0, 0, 0, 0.5, 0.1, 0.7)

candy_data$score <- candy_data$chocolate * weights[1] + 
  candy_data$fruity * weights[2] + 
  candy_data$caramel * weights[3] + 
  candy_data$nougat * weights[5] + 
  candy_data$sugarpercent * weights[10] + 
  candy_data$pricepercent * weights[11] + 
  candy_data$winpercent * weights[12]

head(candy_data)

sorted_candy <- candy_data[order(-candy_data$score),]

# high n low
highest_score <- sorted_candy[1, ]
lowest_score <- sorted_candy[nrow(sorted_candy), ]

# top 10 candies
top_10_your_ranking <- head(sorted_candy, 10)

# top 10 candies based on public
top_10_public_ranking <- candy_data[order(-candy_data$winpercent),][1:10, ]
