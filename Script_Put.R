###################################################################
##########       Solución numérica - Put Americana       ##########
##########          Diego Paul Huaraca Shagñay           ##########
###################################################################

# Parametros de entrada al programa
# S: subyacente
# X: strike
# r: tipo de interes libre de riesgo
# sigma: volatilidad
# Smax: valor maximo que puede tomar el subyacente
# M: numero de incrementos en el subyacente
# N: numero de incrementos en el tiempo

put <- function(S,X,r,sigma,Smax,M,N){
      dt <- 1
      ds <- Smax/M
      # Estimacion parametros
      a <- numeric(M+1)
      b <- numeric(M+1)
      c <- numeric(M+1)
      for(j in 2:M){
            a[j] <- 0.5*r*j*dt -0.5*sigma^2*j^2*dt
            b[j] <- 1 + sigma^2*j^2*dt + r*dt
            c[j] <- -0.5*r*j*dt -0.05*sigma^2*j^2*dt
      }
      # Condiciones
      f <- matrix(0, ncol=N+1, nrow = M+1)
      # Valor intrinseco
      for(j in 1:(M+1)){
            f[j,N+1] <- max(X-(j-1)*ds,0)
      }
      # Si el subyacente es cero
      for(i in 1:(N+1)){
            f[1,i] <- X
      }
      # Si el subyacente alcanza el maximo
      for(i in 1:(N+1)){
            f[M+1,i] <- 0
      }
      return(f)
}


put(50,50,0.02,0.2,100,10,4)