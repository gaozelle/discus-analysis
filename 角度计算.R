rm(a,aa,b,bb,c,cc,d,dd)
library(readxl)
point <- NULL
ang <- NULL
a <- NULL
b <- NULL
c <- NULL
d <- NULL
# 定义角度名称
jointname <- c("Lshoulder","Rshoulder",
               "Lelbow","Relbow",
               "Lhip","Rhip",
               "Lknee","Rknee",
               "Lankle","Rankle")
# 导入角度文件——角度定义.xlsx
jd <- read_excel("~/Desktop/discus video/角度定义.xlsx")

# 检查格式，列数大于4则报错
if (nrow(jd)>4){
  stop("出错了，大锅！角度定义需要四个点，你定义的某一个角度超过了四个！再检查一下吧！")
}
# 建立一个包含X,Y,Z字符的变量x2z
x2z <- c("X","Y","Z")
# 建立 一个名为point的矩阵变量


# 把jd的第1-4列字符加上X,Y,Z名称，并转置
for (i in 1:3) {
  p <- t(jd[,1])
  p <- paste(p[1,],x2z[i],sep = "")
  point <- rbind(point,p)
}

#生成第四个点a,b,c,d三维坐标数据
for (i in 1:3) {
  aa <- select(no1tk57.91,one_of(c(point[i,1])))
  a <-  dplyr::bind_cols(a,aa)
}

for (i in 1:3) {
  bb <- select(no1tk57.91,one_of(c(point[i,2])))
  b <-  dplyr::bind_cols(b,bb)
}

for (i in 1:3) {
  cc <- select(no1tk57.91,one_of(c(point[i,3])))
  c <-  dplyr::bind_cols(c,cc)
}

for (i in 1:3) {
  dd <- select(no1tk57.91,one_of(c(point[i,4])))
  d <-  dplyr::bind_cols(d,dd)
}


l <- nrow(no1tk57.91)

for (n in 1:l) {

  an[n] <- angle(a[n,],b[n,],c[n,],d[n,])
  
}

#rm(a,aa,b,bb,c,cc,d,dd)
