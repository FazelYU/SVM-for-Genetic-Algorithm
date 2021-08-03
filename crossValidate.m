function [prec,rec] = crossValidate(Xin,yin,model)
Cardinal=length(yin);
rp=randperm(Cardinal);
shuf_Y=yin(rp);
shuf_X=Xin(rp,:);
X=shuf_X(1:floor(0.75*Cardinal),:);
y=shuf_Y(1:floor(0.75*Cardinal),:);
Xval=shuf_X(ceil(0.75*Cardinal):end,:);
yval=shuf_Y(ceil(0.75*Cardinal):end,:);
Pred=svmPredict(model,Xval);
% error=mean(double(predictions ~= yval));
 fp=sum((Pred==1)&(yval==0));
 tp=sum((Pred==1)&(yval==1));
 fn=sum((Pred==0)&(yval==1));
 prec=tp/(tp+fp);
 rec=tp/(tp+fn);
 F1=2*prec*rec/(prec+rec);
end

