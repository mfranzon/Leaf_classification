Shape <- training[,2:11]
pr_shape<-princomp(Shape)
Texture<- training[,12:15]
pr_texture<-princomp(Texture)

summary(pr_shape)
summary(pr_texture)

autoplot(pr_shape, data = training, colour = "Species")
autoplot(pr_texture, data = training, colour = "Species")

autoplot(pr_shape, data = training, colour = 'Species',
         loadings = TRUE, loadings.colour = 'blue',
         loadings.label = TRUE, loadings.label.size = 2)

autoplot(pr_texture, data = training, colour = 'Species',
         loadings = TRUE, loadings.colour = 'blue',
         loadings.label = TRUE, loadings.label.size = 2)
