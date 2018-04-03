layout(matrix(c(1:8),nr=2,byrow=T))
par(family='STKaiti')#添加中文字体
color <- c("green","red","orange","blue","black")#设定线和图裂的颜色

for (i in 1:pcount)
{
  #画图
  a <- get(playername[i])[-nrow(get(playername[i])),]
  plot(a$vdiscusR,main = playername[i],
       xlab ="帧数", ylab = "速度 m/s", 
       type="l",
       col=color[1],
       ylim = c(-10,50))
  
  lines(a$vdiscusX,col=color[2])
  lines(a$vdiscusY,col=color[3])
  lines(a$vdiscusZ,col=color[4])
  #lines(a$v重心R,col=color[5])
  # 图例
  legend("topleft",
         inset=.02, 
         c("铁饼速度","vdiscusX","vdiscusY","vdiscusZ"), 
         fill = color, 
         horiz=FALSE,
         cex=0.8)
}
