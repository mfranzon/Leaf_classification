#features from 2 to 11 regards shape behaviour of leaves, while from 12 to 15 the texture
Shape <- leaf[,2:8]
pr_shape<-princomp(Shape)
Texture<- leaf[,9:15]
pr_texture<-princomp(Texture)

summary(pr_shape)
summary(pr_texture)

autoplot(pr_shape, data = leaf, colour = "Species")
autoplot(pr_texture, data = leaf, colour = "Species")

autoplot(pr_shape, data = leaf, colour = 'Species',
         loadings = TRUE, loadings.colour = 'blue',
         loadings.label = TRUE, loadings.label.size = 2)

autoplot(pr_texture, data = leaf, colour = 'Species',
         loadings = TRUE, loadings.colour = 'blue',
         loadings.label = TRUE, loadings.label.size = 2)
