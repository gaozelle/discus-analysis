# 将phase按照$name重新排序
phase <- phase[order(phase$name),]

# 建立两个新的变量
playernamet <- NULL
c <- NULL

for (n in 1:pcount) {
  # 提取phase第n列的2：7数据为向量，并赋值给a
  a <- as.vector(as.matrix(phase[n,2:7]))
  
  
  for (i in 6:1) {
    # 找出player数据中第T列为1：6的所有数据赋值给b
    b <- get(playername[n])[which(get(playername[n])$T==i),]
    # 将c在b下一列合并，赋值给c，生成新的c
    c <- dplyr::bind_rows(b,c)
   } 
  # 将当前的playername后加字符串，生成新的关键帧变量名称playernamet  
  newname <- as.vector(paste(playername[n],sep = "","tdata"))
  playernamet[n] <- newname
  # 新的关键帧数据c，命名为当前新变量名称
  assign(newname,c)
  c <- NULL 
}
rm(a,i,n,newname,b,c)