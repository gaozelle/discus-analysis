library(dplyr)
i <- 1
u <- length(get(playername[i]))/4


for (i in 1:pcount)
{ 
    newdata <- NULL
    
    #读取列名称+v
   
    rname <- names(get(playername[i]))
    rname <- paste("v",rname,sep = "")  
   
    
    aa <- 1
    a <- 0
    for (p in 1:u) {
    a <- a+1
    n <- get(playername[i])[,a]
    a <- a+1
    m <- get(playername[i])[,a]
    a <- a+1
    l <- get(playername[i])[,a]  
    a <- a+1
     
    vr<- vel(n,m,l) 
    vx <- ve(n)
    vy <- ve(m)
    vz <- ve(l)
    new1<- data.frame(c(vx),c(vy),c(vz),c(vr))
    colnames(new1) <- rname[(aa):(aa+3)]
    aa <- aa+4
    newdata <- dplyr::bind_cols(newdata,new1)
    }
    

#newdata <- newdata[,-1]
new2 <- data.frame()
new2 <- newdata
new2 <- dplyr::bind_cols(get(playername[i]),new2)
assign(playername[i],new2)
} 

rm(a,u,new1,new2,newdata,aa,i,l,m,n,p,vx,vy,vz,vr,rname)


  # res <- cbind(vel,acc) 
  #colnames(res) <- c("vel","acc")
  #return(vel)
 

