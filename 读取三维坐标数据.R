library(readr)

# 取得三维坐标数据路径并生成数据框（之前需要调整txt为utf-8编码）

## 取得数据路径
fpath<-"~/Desktop/discus video/60hz关节坐标（8人）"

## 获取名称
pname <- dir(fpath)

## 获取所有.txt文件的路径
playerfiles <- list.files(fpath, pattern = "*.txt", full.names = TRUE)
## 统计文件数量,赋值给pcount
pcount <- length(playerfiles)

## 去掉.txt，生成新的名字向量
playername <- gsub(".txt","",pname)

## 生成以运动员名称的三维坐标数据框
for (i in 1:pcount) {
  assign( playername[i],read_csv(playerfiles[[i]]) )
}

## 删除没有用的值（fpath,i,playerfiles,pname）
rm(fpath,i,playerfiles,pname)

# 数据框重命名
# 因为数据框第一行是 重心 重心1.。。。
# 第二行是x坐标，y坐标
# 需要将数据框名称与第一行合并，再做修改

## 取得第一行为向量headname，与数据框1的名称相加赋值给b，再去除多余符号：空格、_1、_2、_3
headname <- get(playername[1])
headname <- as.matrix(headname)
headname <- as.vector(headname[1,])
b <- paste(names(get(playername[1])),headname)
b <- gsub(" ","",b)
b <- gsub("_1","",b)
b <- gsub("_2","",b)
b <- gsub("_3","",b)
b <- gsub("坐标","",b)

## 用for循环将每个player的数据框名称变为b，在删除第一列:a[-1,]
for (i in 1:pcount){

  a <- get(playername[i])
  names(a) <- b
  assign( playername[i],a[-1,-length(a)] )
  
}

## 删除多余变量

#for (i in i:pcount){
#assign(playername[i],lapply(get(playername[i]), as.numeric))
#}

rm(a,b,headname,i)

# 将数据框内的字符型参数转为数值型
for (i in 1:pcount){
  assign(playername[i],as.data.frame(lapply(get(playername[i]),as.numeric)))
}
  


