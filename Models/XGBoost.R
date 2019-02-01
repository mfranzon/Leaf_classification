train_labs<-as.numeric(training$Species)-1

test_labs <- as.numeric(test$Species)-1

new_train <- model.matrix(~ . + 0, data = training[, -1])

new_test <- model.matrix(~ . + 0, data = test[, -1])

xgb_train<- xgb.DMatrix(data=new_train, label = train_labs)

xgb_test <- xgb.DMatrix(data = new_test, label = test_labs)

params <- list(booster = "gbtree", objective = "multi:softprob", num_class = 30, 
               eval_metric = "mlogloss")

xgbcv <- xgb.cv(params = params, data = xgb_train, nrounds =  1000, nfold = 5, 
                showsd = TRUE, stratified = TRUE, print.every.n = 10, early_stop_round = 20, 
                maximize = FALSE, prediction = TRUE)

xgb_train_preds <- data.frame(xgbcv$pred) %>% mutate(max = max.col(., ties.method = "last"), 
                                                     label = train_labs + 1)


xgb_conf_mat <- table(true = train_labs + 1, pred = xgb_train_preds$max)

classification_error <- function(conf_mat) {
  conf_mat = as.matrix(conf_mat)
  
  error = 1 - sum(diag(conf_mat)) / sum(conf_mat)
  
  return (error)
}

cat("XGB Training Classification Error Rate:", classification_error(xgb_conf_mat), "\n")

xgb_conf_mat_2 <- confusionMatrix(factor(xgb_train_preds$label),
                                  factor(xgb_train_preds$max),
                                  mode = "everything")

xgb_model <- xgb.train(params = params, data = xgb_train, nrounds = 100)

xgb_test_preds <- predict(xgb_model, newdata = xgb_test)

xgb_test_out <- matrix(xgb_test_preds, nrow = 30, ncol = length(xgb_test_preds) / 30) %>% 
  t() %>%
  data.frame() %>%
  mutate(max = max.col(., ties.method = "last"), label = test_labs + 1) 

xgb_test_out$max <- factor(xgb_test_out$max)

xgb_test_out$label <- factor(xgb_test_out$label)

levels(xgb_test_out$max)<-c("1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" , "10" ,
                            "11", "12", "13", "14", "15", "16" ,"17" ,"18","20", "21",
                            "22", "23", "24", "25", "26", "27" ,"28", "29", "30")

levels(xgb_test_out$label)<-c("1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" , "10" ,
                              "11", "12", "13", "14", "15", "16" ,"17" ,"18","20", "21",
                              "22", "23", "24", "25", "26", "27" ,"28", "29", "30")

confusionMatrix(factor(xgb_test_out$max),
                factor(xgb_test_out$label),
                mode = "everything")

names <-  colnames(leaf[,-1])
importance_matrix = xgb.importance(feature_names = names, model = xgb_model)
head(importance_matrix)

xgb_test_conf <- table(true = test_labs + 1, pred = xgb_test_out$max)

cat("XGB Validation Classification Error Rate:", classification_error(xgb_test_conf), "\n")

gp = xgb.ggplot.importance(importance_matrix)

print(gp)
