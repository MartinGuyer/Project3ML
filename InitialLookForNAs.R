mushroom = read.csv("MushroomData.txt", header=TRUE)
missing.mushroom <- mushroom=="?"
colSums(missing.mushroom)
mushroom$stalkRoot
mushroom.nonMiss = data.frame(mushroom %.% select(-stalkRoot))
missing.nonMiss = data.frame(mushroom.nonMiss == "?")
colSums(missing.nonMiss)
mushroom.nonMiss$capShape
for(i in 1:23){
  print(levels(mushroom[,i]))
}
