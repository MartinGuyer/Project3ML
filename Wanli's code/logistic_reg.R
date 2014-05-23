
## First attempt to fit a logistic regression
mushroom = read.csv("../Data/MushroomData.txt", header=TRUE)
names(mushroom)
attach(mushroom)

pois = ifelse(poison=="p",1,0)

mod = glm(poison~capShape+capSurface+capColor+bruises+oder+
    gillAttach+gillSpace+gillSize+gillColor+stalkShape+
    stalkRoot+stalkSurfaceAbove+stalkSurfaceBelow+stalkColorAbove+
    stalkColorBelow+veilType+veilColor+ringNumber+ringType+
    sporeColor+population+habitat ,family=binomial(link="logit"))

## gives error, since "veilType" has only one level
## So fit a second model without it:

mod = glm(poison~capShape+capSurface+capColor+bruises+oder+
    gillAttach+gillSpace+gillSize+gillColor+stalkShape+
    stalkRoot+stalkSurfaceAbove+stalkSurfaceBelow+stalkColorAbove+
    stalkColorBelow+veilColor+ringNumber+ringType+
    sporeColor+population+habitat ,family=binomial(link="logit"))

## Got a warning message:
## Warning message:
## glm.fit: algorithm did not converge 


library(dplyr)
## Look only at subset of data with stalkRoot missing:
nomiss = filter(mushroom, stalkRoot!="?")
dim(nomiss) # 2480 obs

mod = glm(poison~capShape+capSurface+capColor+bruises+oder+
    gillAttach+gillSpace+gillSize+gillColor+stalkShape+
    stalkRoot+stalkSurfaceAbove+stalkSurfaceBelow+stalkColorAbove+
    stalkColorBelow+veilColor+ringNumber+ringType+
    sporeColor+population+habitat ,data=nomiss, family=binomial(link="logit"))

## Still did not converge

## Guess we can use the Hamming distance as distance measure, and obtain
## a distance/similarity matrix as input to classification algorithms
















