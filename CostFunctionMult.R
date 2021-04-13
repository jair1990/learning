
costFunctionMult<- function(X,y,theta=rep(0,dim(X)[2]),lambda=0) {
  hypMod<-X%*%theta
  (lambda*sum(X[,2:ncol(X)]*X[,2:ncol(X)])+sum(((hypMod-y)*(hypMod-y))))/(2*dim(X)[1])
}

gradCostFunctionMult<- function(X,y,theta=rep(0,dim(X)[2]),lambda=0) {
  hypMod<-X%*%theta
  (lambda*c(0,theta[2:length(theta)])+(t(X)%*%(hypMod-y)))/dim(X)[1]
  
}


graDDescentMult<- function(x,y,theta=rep(0,dim(x)[2]),alpha=1,lambda=0,numStep=1){
  for (ith in 1:numStep) {
    theta<-theta-alpha*gradCostFunctionMult(x,y,theta=theta,lambda=lambda)   
  }
  as.vector(theta)
}
