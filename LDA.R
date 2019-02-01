leaf_lda <- lda(Species ~ ., training)

#pred_lda<-predict(leaf_lda)$posterior 

pred_lda <- predict(leaf_lda, test)

#cf <- confusionMatrix(pred_lda$class, test$Species)

tab <- table(Predicted = pred_lda$class, Actual = test$Species)

misc <-1-sum(diag(tab))/sum(tab)

plot(pred_lda$x[,1], type="n", xlim=c(0,30), ylab=c("LDA Axis 1"))

text(pred_lda$x[,1], row.names(hab_std),  col=c(as.numeric(hab.class)+10)