#for bagging use the exact number of variables in mtyry parameter of randomforest function
leaf_adb <- randomForest(Species~., data = training, mtyry = 14 , ntree = 2000)

varImpPlot(leaf_adb) #importance of variable

pred_ad <- predict(leaf_adb, test)

tab_ad<-table(pred_ad , test$Species)

misc <-1-sum(diag(tab_ad))/sum(tab_ad) #miscalssification error

