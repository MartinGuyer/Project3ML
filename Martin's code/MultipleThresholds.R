### APER and False Negative Rate Calculation
library(ROCR)

pred = read.csv("Data/CrossValidData.txt",header=T)
head(pred)

#Putting a few different Tresholds:
tts = c(.5, .1, .05, .01, .005, .001)
n = length(tts)

## Getting APER and FNR:
aper = function(prob,label, tt){
  pp = prob
  ll = ifelse(pp>tt,2,1)
  ll.true = label
  aper = sum(ll!=ll.true)/length(ll)
  a = sum(ll==2 & ll.true==2)
  b = sum(ll==1 & ll.true==2)
  c = sum(ll==2 & ll.true==1)
  d = sum(ll==1 & ll.true==1)
  confmat = matrix(c(a,b,c,d),nrow=2,byrow=T)
  fnr = b/(a+b)
  
  out = list(APER=aper,confusion.matrix=confmat,FNR=fnr)
  return(out)
}

for(i in 1:n){
  tt = tts[i]
out1 = aper(pred$Run1_Pred,pred$Run1_Label, tt)
out2 = aper(pred$Run2_Pred,pred$Run2_Label, tt)
out3 = aper(pred$Run3_Pred,pred$Run3_Label, tt)
out4 = aper(pred$Run4_Pred,pred$Run4_Label, tt)
out5 = aper(pred$Run5_Pred,pred$Run5_Label, tt)
out6 = aper(pred$Run6_Pred,pred$Run6_Label, tt)

## Average FNR:
a = mean(out1$FNR,out2$FNR,out3$FNR,out4$FNR,out5$FNR,out6$FNR) # 0.03921569

## Average APER:
b =mean(out1$APER,out2$APER,out3$APER,out4$APER,out5$APER,out6$APER) # 0.07976366

c = c(tt, a, b)
print(c)
}