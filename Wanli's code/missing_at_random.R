
### Is "stalkRoot" missing at random?
library(dplyr)

mushroom = read.csv("MushroomData.txt", header=TRUE)
names(mushroom)

## Look only at subset of data with stalkRoot missing:
stalkmiss = filter(mushroom, stalkRoot=="?")
dim(stalkmiss) # 2480 obs

## define a function to calculate unique number of levels of each variable:
count = function(x){
  level = levels(x)
  n = length(level)
  temp = rep(0,n)
  for(i in 1:n){
    temp[i] = sum(x==level[i])
  }
  out = cbind(level,temp)
  return(out)
}

## output a list of unique counts for each variable:
out = list()
for(j in 1:23){
  out[[j]] = as.matrix(count(stalkmiss[,j]))
}


## "suspicious" variables include: 9(gillColor,"b=buff"), 17(veilColor,"w=white"),
## 20(sporeColor,"w=white"), and 21(population,"v=several")

## So, it's not missing completely at random (MCAR).
## But it might be missing at random. (MCR)



