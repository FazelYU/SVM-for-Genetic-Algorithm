 function [model,model_error,model_accuracy,F1_Score,prec,rec]=makeModel(X,y,lb,ub,diminsion,ppulsize,testF_flag,C,sigma,options,gainedThold)

model=svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
if diminsion==2
visualizeBoundary(X, y, model);
end
[model_error,model_accuracy]=testModel(diminsion,options,model,lb,ub,testF_flag,gainedThold);
[Xval,yval,~,~]=makerndmppul(diminsion,ppulsize,lb,ub,testF_flag);
Pred=svmPredict(model,Xval);
fp=sum((Pred==1)&(yval==0));
tp=sum((Pred==1)&(yval==1));
fn=sum((Pred==0)&(yval==1));
prec=tp/(tp+fp);
rec=tp/(tp+fn);
F1_Score=2*prec*rec/(prec+rec);
 end