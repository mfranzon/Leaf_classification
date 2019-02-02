library(class)

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }

train_n <- as.data.frame(lapply(training[2:15], normalize))

test_n  <- as.data.frame(lapply(test[2:15], normalize))

leaf_knn <- knn(train = train_n, test = test_n, cl = trainL, k = 6)#about square root of classes

summary(leaf_knn)

tab_knn <- table(Predicted = leaf_knn, Actual = test$Species)

misc_knn <-1-sum(diag(tab_knn))/sum(tab_knn)

