set.seed(123)
ind <- sample(2, nrow(leaf), replace = T, prob = c(0.80, 0.20))

training <- leaf[ind == 1,]

test <- leaf[ind == 2,]
