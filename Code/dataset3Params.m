function [best_C, best_sigma,best_F1,best_prec,best_rec,best_model] = dataset3Params(Xin,yin,flag)
Cardinal=length(yin);
rp=randperm(Cardinal);
shuf_Y=yin(rp);
shuf_X=Xin(rp,:);
X=shuf_X(1:floor(0.75*Cardinal),:);
y=shuf_Y(1:floor(0.75*Cardinal),:);
Xval=shuf_X(ceil(0.75*Cardinal):end,:);
yval=shuf_Y(ceil(0.75*Cardinal):end,:);
switch flag
    case 0
        C_Array=[0.01 0.03 0.1 0.3 1];
        Sigma_Array=[0.1 0.3 1 3];
    case 1
        C_Array=[0.01 0.013 0.02 0.03 0.1 0.3 1];
        Sigma_Array=[1 3 10 30 50];
    case 2
        C_Array=[0.01 0.03 0.1 0.3 1 3];
% C_Array=[1 2 5 10];
        Sigma_Array=[0.1 0.3 1 3];
    case 4
        C_Array=[1 3 10 30 100 300 1000 3000 10000];
        Sigma_Array=[0.03 0.1 0.3 1 3 10 30 100 300];
end
best_F1=-inf;
best_prec=0;
best_rec=0;
best_C=0;
best_sigma=0;
best_model=0;

for c=C_Array 
    for s=Sigma_Array 
%         fprintf(['testing for sigma=%f ,C=%f'],s,c);
        model= svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, s)); 
        if( c==C_Array(1) && s==Sigma_Array(1))
            best_model=model;
        end
        
        Pred=svmPredict(model,Xval);
            fp=sum((Pred==1)&(yval==0));
            tp=sum((Pred==1)&(yval==1));
            fn=sum((Pred==0)&(yval==1));
            prec=tp/(tp+fp);
            rec=tp/(tp+fn);
            F1=2*prec*rec/(prec+rec);
        if (best_F1<=F1)
            best_F1=F1;
            best_prec=prec;
            best_rec=rec;
            best_C=c;
            best_sigma=s;
            best_model=model;
        end
    end
end

% =========================================================================

end
