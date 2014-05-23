
## First attempt to fit a logistic regression
mushroom = read.csv("MushroomData.txt", header=TRUE)
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
