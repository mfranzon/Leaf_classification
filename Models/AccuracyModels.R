
rf<-confusionMatrix(pred_rf, test$Species)
svm<-confusionMatrix(pred_svm, test$Species)
lda<-confusionMatrix(tpred_lda$class, test$Species)
knn<-confusionMatrix(pred_knn, test$Species)
tree<-confusionMatrix(pred_t, test$Species)
bagging<-confusionMatrix(pred_ad, test$Species)
XGBoost<-confusionMatrix(factor(xgb_train_preds$label),factor(xgb_train_preds$max))

ModelType <- c("Random forest", "Support Vector Machine", "Linear Discriminant Analysis", "K nearest neighbor", "Tree", "Bagging", "XGBoost")  # vector containing names of models

ValidationAccuracy <- c(rf$overall[1], svm$overall[1], lda$overall[1], knn$overall[1], tree$overall[1], bagging$overall[1], XGBoost$overall[1])

Validation_missclass_Error <- 1 - ValidationAccuracy

metrics <- data.frame(ModelType, ValidationAccuracy, 
                      Validation_missclass_Error)

knitr::kable(metrics, digits = 5)

barplot(t(as.matrix(metrics[,2:3])), beside=TRUE, names.arg=metrics$ModelType, col=c("darkblue","red"),cex.names=0.7)





       