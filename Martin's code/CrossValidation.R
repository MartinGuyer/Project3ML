mushroom=read.csv("Data/MushroomData.txt", header=TRUE)
dim(mushroom)
attach(mushroom)
names(mushroom)
n=nrow(mushroom)
size = n/6

library(e1071)

#Run 1: with the first 1354 observations as the test set
#########################################################
mod1= naiveBayes(poison~., data=mushroom[(size+1):n,])
pred1 = predict(mod1, mushroom[1:size,], type="raw")
Run1_Pred=pred1[,1]
Run1_Label=mushroom[1:size, 1]

#Run 2: with the second 1354 observations as the test set
##########################################################
mod2= naiveBayes(poison~., data=mushroom[c(1:size, (2*size+1):n),])
pred2 = predict(mod2, mushroom[(size+1):(2*size),], type="raw")
Run2_Pred=pred2[,1]
Run2_Label=mushroom[(size+1):(2*size), 1]

#Run 3: with the third 1354 observations as the test set
########################################################
mod3= naiveBayes(poison~., data=mushroom[c(1:(2*size), (3*size+1):n),])
pred3 = predict(mod3, mushroom[(2*size+1):(3*size),], type="raw")
Run3_Pred=pred3[,1]
Run3_Label=mushroom[(2*size+1):(3*size), 1]

#Run 4: with the fourth 1354 observations as the test set
##########################################################
mod4= naiveBayes(poison~., data=mushroom[c(1:(3*size), (4*size+1):n),])
pred4 = predict(mod4, mushroom[(3*size+1):(4*size),], type="raw")
Run4_Pred=pred4[,1]
Run4_Label=mushroom[(3*size+1):(4*size), 1]

#Run 5: with the fifth 1354 observations as the test set
##########################################################
mod5= naiveBayes(poison~., data=mushroom[c(1:(4*size), (5*size+1):n),])
pred5 = predict(mod5, mushroom[(4*size+1):(5*size),], type="raw")
Run5_Pred=pred5[,1]
Run5_Label=mushroom[(4*size+1):(5*size), 1]

#Run 6: with the fifth 1354 observations as the test set
##########################################################
mod6= naiveBayes(poison~., data=mushroom[1:(5*size),])
pred6 = predict(mod6, mushroom[(5*size+1):(6*size),], type="raw")
Run6_Pred=pred6[,1]
Run6_Label=mushroom[(5*size+1):(6*size), 1]

#Combining the Data Set
###########################
MushRoom_CrossValid = cbind(Run1_Pred, Run1_Label, Run2_Pred, Run2_Label, Run3_Pred, 
                            Run3_Label, Run4_Pred,Run4_Label, Run5_Pred, Run5_Label, 
                            Run6_Pred, Run6_Label)

#Making the Data Set into a File
#################################
write.table(MushRoom_CrossValid, file="../Data/CrossValidData.txt", sep=",", 
            row.names=FALSE)
