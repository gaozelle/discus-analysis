# 将phase按照$name重新排序
phase <- phase[order(phase$name),]


playernamet <- NULL
c <- NULL

for (n in 1:pcount) {
  a <- as.vector(as.matrix(phase[n,2:7]))
  
  for (i in 1:6) {
    b <- get(playername[1])[which(get(playername[1])$T==i),]
    c <- dplyr::bind_rows(b,c)
   } 
    
  newname <- as.vector(paste(playername[n],sep = "","tdata"))
  playernamet[n] <- newname
  assign(newname,c)
  c <- NULL 
}
rm(a,b,c,i,n,newname)