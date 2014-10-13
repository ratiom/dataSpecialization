set.seed(413)

temp <- data.frame(group=rep(c("A","B","C"), rep=5), tt=1:15,val=round(runif(15),2), stringsAsFactors=FALSE)
idx <- order(temp$group,temp$val)
# or   idx <- order(temp[,1],temp[,3])
idx
z2 <- temp[idx,]
rownames(z2) <- NULL
z2
