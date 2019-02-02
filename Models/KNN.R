library(class)

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }

train_n <- as.data.frame(lapply(training[2:15], normalize))

test_n  <- as.data.frame(lapply(test[2:15], normalize))

tcontrol <- trainControl(method = "cv", number = 10)

leaf_knn<-train(Species ~ ., data = training, method = "knn", preProcess = c("center", 
                                                                             "scale"), trControl = tcontrol)

summary(leaf_knn)

tab_knn <- table(Predicted = leaf_knn, Actual = test$Species)

misc_knn <-1-sum(diag(tab_knn))/sum(tab_knn)

