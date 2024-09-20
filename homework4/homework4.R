data <- read.csv("Documents/schoolgithub/math187/homework4/characteristics.csv")

# 2
# a
patient_count <- sum(data$patient == 1)
fast_learner_count <- sum(data$fast_learner == 1)

# b
both_count <- sum(data$patient == 1 & data$fast_learner == 1)

# c
# i)
r1 <- data[1,]
r2 <- data[2,]
r4 <- data[4,]

shared_r1_r2 <- sum(r1 == r2) # r1 r2
shared_r1_r4 <- sum(r1 == r4) # r1 r4
shared_r2_r4 <- sum(r2 == r4) # r2 r4

# ii)
disagree_r1_r2 <- sum(r1 != r2) # r1 r2
disagree_r1_r4 <- sum(r1 != r4) # r1 r4
disagree_r2_r4 <- sum(r2 != r4) # r2 r4

# iii)
covered_r1_r2 <- sum((r1 + r2) > 0) # r1 r2
covered_r1_r4 <- sum((r1 + r4) > 0) # r1 r4
covered_r2_r4 <- sum((r2 + r4) > 0) # r2 r4

# 4
# a
v <- c(1, 2, 3, 4, 5)
w <- c(-1, 2, -3, 4, -5)

distance <- sqrt(sum((v - w)^2))

# b
u <- c(2, -3, 0)
x <- c(-1, 2, 2)
y <- c(-1, 1, -2)

average_vector <- (u + x + y) / 3

# c
v <- c(0, 1, 2, 3) # create a vector v
ones <- rep(1, 4) # creates a vector of all 1's
sum(ones * v) # inner product of vectors ones and v

# d
x <- c(1, 1, 2, 3, 5, 8) # creates a vector x
y <- c(-4.1, -2, 4, 0, -4, 2) # creates a vector y
sqrt(sum(x*x) + sum(y*y) + 2*sum(x*y)) # takes the square root of the sums of x^2, y^2 and 2* sum(xy)