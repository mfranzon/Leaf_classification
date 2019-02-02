l_tree<-rpart(Species ~ ., training)

printcp(l_tree)

pred_t <- predict(l_tree, test, type = "class")

tab_t<-table(pred_t, test$Species )

misc <-1-sum(diag(tab_t))/sum(tab_t) #misclassification error

pr_tree<-prune(l_tree, cp=0.025)

pred_prt <- predict(pr_tree, test, type = "class")

tab_prt<-table(pred_prt, test$Species )

misc_pr <-1-sum(diag(tab_prt))/sum(tab_prt)
