leaf_rf <- randomForest(Species~., data = training , ntree = 2000)

importance(leaf_rf)

varImpPlot(leaf_rf) #importance of predictors

pred_rf <- predict(leaf_rf, test)

tab_rf <- table(pred_rf, test$Species)

misc <-1-sum(diag(tab_rf))/sum(tab_rf) #misclassification error
