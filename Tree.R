l_tree<-rpart(Species ~ ., training)

printcp(l_tree)

pred_t <- predict(l_tree, test, type = "class")

tab_t<-table(pred_t, test$Species )

misc <-1-sum(diag(tab_t))/sum(tab_t)