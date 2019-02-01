leaf2 <- leaf[, 2:15]

leaf_k <- kmeans(leaf2, 30)

#View(table(leaf$Species, leaf_k$cluster))

autoplot(leaf_k, data = leaf)
