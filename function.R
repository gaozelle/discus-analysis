#定义拍摄频率
fhz <- 60

circleFun <- function(center = c(0,0),diameter = 1, npoints = 100){
  r = diameter / 2
  tt <- seq(0,2*pi,length.out = npoints)
  xx <- center[1] + r * cos(tt)
  yy <- center[2] + r * sin(tt)
  return(data.frame(x = xx, y = yy))
}

#计算空间速度
vel <- function(n,m,l){
    if (!is.numeric(n)&!is.numeric(m)&!is.numeric(i)){
      stop("输入的n,m,l变量要数值型，大锅！")
    }
  
    if ( !is.null(ncol(n)) && (ncol(n) > 1) ){
      stop("需要连续的变量，大锅！")
    }
  v <- c()
  for (i in 2:length(n)-1)
  {

    v[i] <- c((sqrt((n[i-1]-n[i+1])^2+(m[i-1]-m[i+1])^2+(l[i-1]-l[i+1])^2))*fhz)
    #acc <- diff(vel,differences = 2)
    v[length(v)+1] <- 0
  }
return(v)
rm(v)
}

#计算线速度
ve <- function(x){
  for (i in 1:length(x)-1) {
   x[i] <- c((x[i+1]-x[i])*fhz )
  }
  return(x)
  rm(x)
}

#巴特沃斯滤波 k为截断频率
butterworth <- function(x){
  x <- FilterOfOrder(x,20,"low")
  xx <- x[["n"]]
  return(xx)
}
  