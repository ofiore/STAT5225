n <- 19002
num_primes <- 1
flag <- 0
start <- Sys.time()
for (i in 2:n){
  for (x in 2:(i-1)){
    if (i%%x == 0){
      flag <- 1
      #cat(i, "Is not a prime number", "\n")
      break
    }
      #num_primes <- num_primes + 1
      flag <- 2
  }
  if (flag ==2){
  num_primes <- num_primes + 1
  }
}
end <- Sys.time()
print(num_primes)
cat("The slow version took: ",end-start, "seconds to run")


#Sped up
n <- 19002
num_primes <- 0
flag <- 0
my_lst = list()
start <- Sys.time()
for (i in 2:n){
  if(length(my_lst) == 0){
    my_lst <- append(my_lst, i)
    num_primes <- num_primes + 1
    #cat("haha")
  }
  for (x in my_lst){
    if (i%%x == 0){
      flag <- 1
      #cat(i, "Is not a prime number", "\n")
      break
    }
    else if (i%%x != 0){
    flag <- 2
    }
  }
  if (flag ==2){
    num_primes <- num_primes + 1
    my_lst <- append(my_lst, i)
  }
}
end <- Sys.time()
#print(my_lst)
print(length(my_lst))
#print(num_primes)
cat("The fast version took: ", end-start, "seconds to run")
