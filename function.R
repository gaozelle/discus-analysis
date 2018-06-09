#定义拍摄频率
fhz <- 60

#画一个圆
circleFun <- function(center = c(0,0),diameter = 1, npoints = 100){
  r = diameter / 2
  tt <- seq(0,2*pi,length.out = npoints)
  xx <- center[1] + r * cos(tt)
  yy <- center[2] + r * sin(tt)
  return(data.frame(x = xx, y = yy))
}

#计算空间速度
vel <- function(n,m,l){
    if (!is.numeric(n)&!is.numeric(m)&!is.numeric(l)){
      stop("输入的n,m,l变量要数值型，大锅！")
    }
  # 验证变量是否为数值变量，如果不是报错
    if ( !is.null(ncol(n)) && (ncol(n) > 1) ){
      stop("需要连续的变量，大锅！")
    }
  # 验证变量是否有空变量，如果有报错
  v <- c()
  for (i in 2:length(n)-1)
  {

    v[i] <- c((sqrt((n[i-1]-n[i+1])^2+(m[i-1]-m[i+1])^2+(l[i-1]-l[i+1])^2))*fhz/2)
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
  x <- FilterOfOrder(x,8,"low")
  xx <- x[["n"]]
  return(xx)
}

# 求两点的距离
distance <- function(x,y){
  l <- sqrt((y[1]-x[1])^2+(y[2]-x[2])^2+(y[3]-x[3])^2)
  return(l)
}

#三点的夹角
angle2 <- function(o,a,b){
  oa <- distance(o,a)
  ob <- distance(o,b)
  ab <- distance(a,b)
  cj <- (ob^2+oa^2+ab^2)/(2*ob*oa)
  if(cj>1 | cj< -1){
    cj <- cj-floor(cj)
  }
  cj <- acos(cj)
  cj <- round(rtod(cj),4)
  return(cj)
}
  
# 弧度转角度
rtod <- function(x){
  x <- x*180/pi
  return(x)
}

# 角度转弧度
dtor <- function(x){
  x <- x*pi/180
  return(x)
}

#向量计算角度
angle <- function(a,b,c,d){
  ab <- b-a
  cd <- d-c
  cj<-acos(sum(ab*cd)/sqrt(sum(ab^2)*sum(cd^2)))
  cj <- rtod(cj)
  return(cj)
}
