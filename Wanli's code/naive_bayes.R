
## Naive Bayes classifier:
library(e1071)
attach(mushroom)
names(mushroom)
dim(mushroom)

model = naiveBayes(poison~capShape+capSurface+capColor+bruises+oder+
    gillAttach+gillSpace+gillSize+gillColor+stalkShape+
    stalkRoot+stalkSurfaceAbove+stalkSurfaceBelow+stalkColorAbove+
    stalkColorBelow+veilColor+ringNumber+ringType+
    sporeColor+population+habitat, data=mushroom[1:5000,])

predict(model, mushroom[5001:5031,], type="raw")
model$tables
