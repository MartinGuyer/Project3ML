
### Visualization with ROC curves
library(ROCR)


pred = read.csv("../Data/CrossValidData.txt",header=T)
head(pred)

## ROC for each run of CV:
par(mfrow=c(2,3))
pp = 1-pred$Run1_Pred
ll = pred$Run1_Label
pr = prediction(pp,ll)
perf = performance(pr,'tpr','fpr')
plot(perf, colorize=T, colorkey.pos="right", lwd=3,xlab="",ylab="")

pp = 1-pred$Run2_Pred
ll = pred$Run2_Label
pr = prediction(pp,ll)
perf = performance(pr,'tpr','fpr')
plot(perf, colorize=T, colorkey.pos="right", lwd=3,xlab="",ylab="")


pp = 1-pred$Run3_Pred
ll = pred$Run3_Label
pr = prediction(pp,ll)
perf = performance(pr,'tpr','fpr')
plot(perf, colorize=T, colorkey.pos="right", lwd=3,xlab="",ylab="")


pp = 1-pred$Run4_Pred
ll = pred$Run4_Label
pr = prediction(pp,ll)
perf = performance(pr,'tpr','fpr')
plot(perf, colorize=T, colorkey.pos="right", lwd=3,xlab="",ylab="")


pp = 1-pred$Run5_Pred
ll = pred$Run5_Label
pr = prediction(pp,ll)
perf = performance(pr,'tpr','fpr')
plot(perf, colorize=T, colorkey.pos="right", lwd=3,xlab="",ylab="")


pp = 1-pred$Run6_Pred
ll = pred$Run6_Label
pr = prediction(pp,ll)
perf = performance(pr,'tpr','fpr')
plot(perf, colorize=T, colorkey.pos="right", lwd=3,xlab="",ylab="")
par(mfrow=c(1,1))

ggsave()

#-------------------------------------------------------------------------------------------#


predictions = list(1-pred$Run1_Pred,1-pred$Run2_Pred,1-pred$Run3_Pred,1-pred$Run4_Pred,
  1-pred$Run5_Pred,1-pred$Run6_Pred)
labels = list(pred$Run1_Label,pred$Run2_Label,pred$Run3_Label,pred$Run4_Label,
  pred$Run5_Label,pred$Run6_Label)
dat = list(predictions=predictions,labels=labels)

## Averaging plots
pp <- dat$predictions
ll <- dat$labels
pred <- prediction(pp,ll)
perf <- performance(pred,'tpr','fpr')



png("Plot7.png", height = 400, width = 600, units = 'px', res=300)

par(mfrow=c(2,2))
plot(perf, colorize=T,lwd=1,main='ROC curves from 6-fold cross-validation',colorkey.pos="right")
plot(perf, avg='vertical', spread.estimate='stderror',lwd=3,main='Vertical averaging + 1 standard error',col='blue')
plot(perf, avg='horizontal', spread.estimate='boxplot',lwd=3,main='Horizontal averaging + boxplots',col='blue')
plot(perf, avg='threshold', spread.estimate='stddev',lwd=2, main='Threshold averaging + 1 standard deviation',colorize=T)
par(mfrow=c(1,1))

dev.off()




