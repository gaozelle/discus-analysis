library(plotrix)
library(ggplot2)
library(RColorBrewer)

#RColorBrewer中的所有调色板
display.brewer.all()
#选取Set1调色板中的四种颜色
cols<-brewer.pal(n=4,name="Set1")
#cols表示的是四种不同颜色的名称
#创建一个跟T1变量的因子水平相对应的颜色向量
#cols_t1<-cols[dat$T1]

#dat <- circleFun(c(0,0),2.5/2)#geom_path will do open circles, geom_polygon will do filled circles
#geom_path(dat,aes(x,y))
#layout(matrix(c(1,2,3,4,5,6,7,8),nr=2,byrow=T))
  
#  ggplot(cyl,aes(discusX,discusY))+
#  geom_po
  
  
  
  #scale_x_continuous(breaks = c(-3:4))+
  #scale_y_continuous(breaks = c(-3:4))+
  
  


layout(matrix(c(1:8),nr=2,byrow=T))
 par(family='STKaiti')#添加中文字体
#YZ平面
 for (i in 1:pcount){
  
 
    plot(get(playername[i])$discusX,get(playername[i])$discusZ,main = playername[i],type = "o",
       xlab ="X轴", ylab = "Z轴", xlim = c(-2,3), ylim = c(0,3))
  
  lines(get(playername[i])$重心X,get(playername[i])$重心Z,col=cols[1])
  for (p in 1:6){
    if()
  }
    
  
  #draw.circle(0,0,2.5/2)
}

#XZ平面
 for (i in 1:pcount){
   
   
     plot(get(playername[i])$discusY,get(playername[i])$discusZ,main = playername[i],type = "o",
        xlab ="Y轴", ylab = "Z轴", xlim = c(-2.5,2.5), ylim = c(0,3))
   
   lines(get(playername[i])$重心Y,get(playername[i])$重心Z,col=cols[1])
   
   
 }

#XY平面
 for (i in 1:pcount){
   
   
   plot(get(playername[i])$discusX,get(playername[i])$discusY,main = playername[i],type = "o",
          xlab ="X轴", ylab = "Y轴", xlim = c(-2.5,2.5), ylim = c(-2,3))
   
   lines(get(playername[i])$重心X,get(playername[i])$重心Y,col=cols[1])
   
   draw.circle(0,0,2.5/2)
 }
 
