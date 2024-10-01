# Load the dataset
data <- read.csv("/Users/atticus/Documents/schoolgithub/math187/homework5/PatientSatisfaction.csv")

# a
avg_values <- colMeans(data)
print(avg_values)

# b 
demeaned_data <- sweep(data, 2, colMeans(data))
# print(demeaned_data)

# c
std_dev <- apply(demeaned_data, 2, sd)
print(std_dev)

# d
euclidean_distance <- function(row1, row2) {
  sqrt(sum((row1 - row2) ^ 2))
}

dist_1_2 <- euclidean_distance(data[1, ], data[2, ])
dist_1_3 <- euclidean_distance(data[1, ], data[3, ])
dist_1_5 <- euclidean_distance(data[1, ], data[5, ])
dist_1_10 <- euclidean_distance(data[1, ], data[10, ])

print(c("Distance between 1 and 2:", dist_1_2))
print(c("Distance between 1 and 3:", dist_1_3))
print(c("Distance between 1 and 5:", dist_1_5))
print(c("Distance between 1 and 10:", dist_1_10))

# f
standardized_data <- scale(data)

# g
patient_9_satisfaction_zscore <- standardized_data[9, "satisfaction"]
print(patient_9_satisfaction_zscore)

# h
dist_std_1_2 <- euclidean_distance(standardized_data[1, ], standardized_data[2, ])
dist_std_1_3 <- euclidean_distance(standardized_data[1, ], standardized_data[3, ])
dist_std_1_5 <- euclidean_distance(standardized_data[1, ], standardized_data[5, ])
dist_std_1_10 <- euclidean_distance(standardized_data[1, ], standardized_data[10, ])

print(c("Standardized distance between 1 and 2:", dist_std_1_2))
print(c("Standardized distance between 1 and 3:", dist_std_1_3))
print(c("Standardized distance between 1 and 5:", dist_std_1_5))
print(c("Standardized distance between 1 and 10:", dist_std_1_10))

# i want to cluster for part k
data_standardized <- scale(data)

set.seed(123) 
kmeans_result <- kmeans(data_standardized, centers = 4)

data$cluster <- kmeans_result$cluster

print(kmeans_result)

library(ggplot2)
ggplot(data, aes(x = satisfaction, y = anxiety, color = factor(cluster))) +
  geom_point() +
  labs(title = "K-means Clustering of Patient Satisfaction Data",
       x = "Satisfaction", y = "Anxiety") +
  theme_minimal()
