# 划分阶段
library(readxl)
phase <- read_excel("~/Desktop/discus video/phase.xlsx")
for (i in 1:pcount){
  for (p in 1:pcount) {
    if (phase[i,1]==playername[p]){
      tfn <- p
    }
  }
  tf <- playername[tfn]
  t <- phase[i,2:7]
  t <- t(t)
  a <- 0
  a[1:nrow(get(playername[tfn]))] <- 0
  b <- 1
  for (aa in t) {
    
    a[aa] <- b
    b <- b+1
  }
   a <- as.data.frame(a)
  colnames(a) <- "T"
  new <- dplyr::bind_cols(a,get(playername[tfn]))
  assign(playername[tfn],new)
}
rm(a,new,t,aa,b,i,p,tf,tfn)