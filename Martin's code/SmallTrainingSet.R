mushroom=read.csv("Data/MushroomData.txt", header=TRUE)
dim(mushroom)
attach(mushroom)
names(mushroom)
n=nrow(mushroom)
size = n/6

library(e1071)

tmp = proc.time()
#Run 1: with the first 1354 observations as the test set
#########################################################
mod1= naiveBayes(poison~., data=mushroom[1:size,])
pred1 = predict(mod1, mushroom[(size+1):n,], type="raw")
Run1_Pred=pred1[,2]
Run1_Label=mushroom[(size+1):n,1]

#Run 2: with the second 1354 observations as the test set
##########################################################
mod2= naiveBayes(poison~., data=mushroom[(size+1):(2*size),])
pred2 = predict(mod2, mushroom[c(1:size, (2*size+1):n),], type="raw")
Run2_Pred=pred2[,2]
Run2_Label=mushroom[c(1:size, (2*size+1):n),1]

#Run 3: with the third 1354 observations as the test set
########################################################
mod3= naiveBayes(poison~., data=mushroom[(2*size+1):(3*size),])
pred3 = predict(mod3, mushroom[c(1:(2*size), (3*size+1):n),], type="raw")
Run3_Pred=pred3[,2]
Run3_Label=mushroom[c(1:(2*size), (3*size+1):n),1]

#Run 4: with the fourth 1354 observations as the test set
##########################################################
mod4= naiveBayes(poison~., data=mushroom[(3*size+1):(4*size),])
pred4 = predict(mod4, mushroom[c(1:(3*size), (4*size+1):n),], type="raw")
Run4_Pred=pred4[,2]
Run4_Label=mushroom[c(1:(3*size), (4*size+1):n),1]

#Run 5: with the fifth 1354 observations as the test set
##########################################################
mod5= naiveBayes(poison~., data=mushroom[(4*size+1):(5*size),])
pred5 = predict(mod5, mushroom[c(1:(4*size), (5*size+1):n),], type="raw")
Run5_Pred=pred5[,2]
Run5_Label=mushroom[c(1:(4*size), (5*size+1):n),1]

#Run 6: with the fifth 1354 observations as the test set
##########################################################
mod6= naiveBayes(poison~., data=mushroom[(5*size+1):(6*size),])
pred6 = predict(mod6, mushroom[1:(5*size),], type="raw")
Run6_Pred=pred6[,2]
Run6_Label=mushroom[1:(5*size),1]

proc.time() - tmp

#Combining the Data Set
###########################
MushRoom_CrossValid = cbind(Run1_Pred, Run1_Label, Run2_Pred, Run2_Label, Run3_Pred, 
                            Run3_Label, Run4_Pred,Run4_Label, Run5_Pred, Run5_Label, 
                            Run6_Pred, Run6_Label)

#Making the Data Set into a File
#################################
write.table(MushRoom_CrossValid, file="Data/SmallTraining.txt", sep=",", 
            row.names=FALSE)