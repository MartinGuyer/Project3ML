
### Visualization with ROC curves
library(ROCR)


pred = read.csv("../Data/CrossValidData.txt",header=T)
head(pred)


predictions = list(pred$Run1_Pred,pred$Run2_Pred,pred$Run3_Pred,pred$Run4_Pred,
  pred$Run5_Pred,pred$Run6_Pred)
labels = list(pred$Run1_Label,pred$Run2_Label,pred$Run3_Label,pred$Run4_Label,
  pred$Run5_Label,pred$Run6_Label)
dat = list(predictions=predictions,labels=labels)

## Averaging plots
pp <- dat$predictions
ll <- dat$labels
pred <- prediction(pp,ll)
perf <- performance(pred,'tpr','fpr')


plot(perf, colorize=T,lwd=1,main='ROC curves from 6-fold cross-validation',colorkey.pos="right")
plot(perf, avg='threshold', lwd=4, main='Threshold averaging', colorize=T)

