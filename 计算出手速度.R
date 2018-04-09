as.data.frame(vr)
as.vector(vshoot)
for (i in 1:pcount) {
  vr <- get(playernamet[i])$vdiscusR
  vshoot[i]<- vr[6]
  #vr <- NULL
}
layout(matrix(c(1:1),nr=1,byrow=T))
barplot(vshoot,beside = TRUE, names.arg  = playername)

rm(i,vr)