autoplot(cluster::pam(leaf[,2:15], 30), frame = TRUE, frame.type = 'norm')


pairs(leaf[,2:15], lower.panel = panel.smooth, upper.panel = panel.cor, main = "Leaf Classification Data")

par(mfrow = c(5,5))
for (i in (2:15)){
  hist(leaf[,i],
       xlab = paste("Values of", colnames(leaf)[i]),
       col = "green",
       main = paste("Histogram of", colnames(leaf)[i]))
  print(i)
}

#Function panel.cor for PAIRS

panel.cor <- function(x, y, digits=2, prefix="", cex.cor)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits=digits)[1]
  txt <- paste(prefix, txt, sep="")
  if(missing(cex.cor)) cex <- 2/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex * r)
}
