leaf_rf <- randomForest(training$Species ~ training$Eccentricity + training$Elongation + training$`Aspect Ratio` + training$Solidity + training$`Stochastic Convexity` + training$`Isoperimetric Factor` + training$`Maximal Indentation Depth` + training$Lobedness + training$`Average Intensity` + training$`Average Contrast` + training$Smoothness + training$`Third moment` + training$Uniformity + training$Entropy, data = training)

leaf_rf <- randomForest(Species~., data = training , ntree = 2000)

importance(leaf_rf)

varImpPlot(leaf_rf)

pred_rf <- predict(leaf_rf, test)

tab_rf <- table(pred_rf, test$Species)

misc <-1-sum(diag(tab_rf))/sum(tab_rf)
