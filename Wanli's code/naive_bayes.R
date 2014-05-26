
## Naive Bayes classifier:
library(e1071)
attach(mushroom)
names(mushroom)
dim(mushroom)

model = naiveBayes(poison~capShape+capSurface+capColor+bruises+oder+
    gillAttach+gillSpace+gillSize+gillColor+stalkShape+
    stalkRoot+stalkSurfaceAbove+stalkSurfaceBelow+stalkColorAbove+
    stalkColorBelow+veilType+veilColor+ringNumber+ringType+
    sporeColor+population+habitat, data=mushroom[1:30,])

a = predict(model, mushroom[5001:5031,], type="raw")
model$tables

model1 = naiveBayes(poison~.,data=mushroom[1:30,])
b = predict(model1, mushroom[5001:5031,], type="raw")

a==b
