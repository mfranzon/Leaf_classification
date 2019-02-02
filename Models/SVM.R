tmod<-tune(svm, train.x = training[,2:15], train.y = training[,1], ranges = list(epsilon = seq(0,1,0.1), cost = 2^(2:9)))

model<- tmod$best.model

mod_svm <- svm(Species ~., training, method = "C-classification", kernel = "radial", cost = 32, gamma = 0.07) #best model

pred_svm <- predict(mod_svm, test)

tab <- table(Predicted = pred, Actual = test[,1])

misc <-1-sum(diag(tab))/sum(tab) #misclassification error

