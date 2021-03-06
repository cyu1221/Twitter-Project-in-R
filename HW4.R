#1 
#a
summ = function(x){
  # Note that I have added a message to stop().
  if(is.numeric(x)==F)stop("Invalid input. summ() only takes numeric vectors.")
  return(list(mean(x),median(x),var(x)))
}
## test with z and z1. z produces values and z1 stops the program.
z <- c(1,2,3,4,5,6,7,8,9)
summ(z)

#b
f <-function(x,n){
  sum(exp(-x)*x^(0:n)/factorial(0:n))
}

#c
f <- function(x){
  if(is.character(x)==1) print(x)
  }
n = c(2, 3, 5)
s = c("aa", "bb", "cc", "dd", "ee")
x = list(n, s,3)
q <- unlist(lapply(x,f))

#d
f <- function(k){
  k1 = as.integer(k)
  if(k1 != k)stop('rands() requires an integer value to start.')
  # initialize i and x
  i=1
  x=0
  while(x[i] != k){
    if(runif(1)<.5)D = 1
    else D = -1
    i = i+1
    x[i] = x[i-1]+ D
  }
  return(data.frame(x))
}
## try it with 11
set.seed(10)
ser <- data.frame(f(-11))
## try it with "hello"
ser <-data.frame("hello")
print(ser)

#2
#a
set.seed(10)
ma3 <- function(x){
  r=length(x)
  m=outer(1:3,0:(r-3),"+")
  h=matrix(x[m], ncol = r-3+1, nrow = 3, byrow = TRUE)
  return(as.vector(colMeans(h)))
}
a <- rnorm(20)
a <- floor(a*10)
head(a,15)


#3
f1 <- function(x){
  m=x**2+2*x+3
  return(m)
}
f2 <- function(x){
  m=x+3
  return(m)
}
f3 <- function(x){
  m=x**2+4*x-7
  return(m)
}
f <- function(x) {
  if(x<=-4 | x>=4) return(NA)
  if(x<0) s=f1(x)
  if(0<=x & x<2) s=f2(x)
  if(x>=2) s=f3(x)
  return(s)
}
final_function <- function(vector, plot = FALSE){
  return_vector <- sapply(vector, f)
  if (plot == TRUE){
    plot(return_vector)
  }
  return(return_vector)
}
set.seed(10)
# test function with plot = TRUE to test plotting
x <- c(-5,1,2,3)
final_function(x, plot = TRUE)

#4
input <- matrix(c(1:9),nrow=3,ncol=3) 
f<- function(x){
  if(x%%2==1) x=x*2
  return(x) }
apply(input,1:2,f)

#5
#a
poisson_process <- function(Max,lam){ 
  time = 0 # total time elapsed
a = NULL # poisson process vector 
while(time < Max){
inter = rexp(1,lam) # waiting time according to exponential distribution time = time + inter # add to total time
a = c(a,time) # add time point to poisson process vector
}
return(a[1:(length(a)-1)]) }
# set seed to create replicable answer
set.seed(50)
# test function
poisson_process(2,6)

#b
num = numeric(10000)
for (i in 1:10000) num[i] = length(poisson_process(5, 1))
