leaf_lda <- lda(Species ~ ., leaf)

#pred_lda<-predict(leaf_lda)$posterior 

pred_lda <- predict(leaf_lda, leaf)

#cf <- confusionMatrix(pred_lda$class, test$Species)

tab_lda <- table(Predicted = pred_lda$class, Actual = leaf$Species)

misc <-1-sum(diag(tab_lda))/sum(tab_lda)

print(misc)

plot(pred_lda$x[,1],pred_lda$x[,2], col = leaf$Species) # make a scatterplot


#lda with training
tleaf_lda <- lda(Species ~ ., training)

#pred_lda<-predict(leaf_lda)$posterior 

tpred_lda <- predict(leaf_lda, test)

#cf <- confusionMatrix(pred_lda$class, test$Species)

ttab_lda <- table(Predicted = tpred_lda$class, Actual = test$Species)

tmisc <-1-sum(diag(ttab_lda))/sum(ttab_lda)

print(tmisc)

plot(tpred_lda$x[,1],tpred_lda$x[,2], col = leaf$Species) # make a scatterplot

