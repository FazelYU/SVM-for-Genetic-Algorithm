function [model_error,model_accuracy] = testModel(dim,options,model,min,max,flag,T)
ppulsz=options.PopulationSize;
rng('shuffle','twister');
cursz=1;
X=zeros(ppulsz,dim);
while(cursz<=ppulsz)
rndm=(max-min).*rand(1,dim)+min;
    if svmPredict(model,rndm)
        X(cursz,:)=rndm;
        cursz=cursz+1;
    end
end


%% 
 num_accpt=0;
sumVal=0;
for i=1:ppulsz
    [~,val]=grad_dec(X(i,:),min,max,flag);
    sumVal=sumVal+val;
    if val<=T
        num_accpt=num_accpt+1;
    end
end
model_accuracy=num_accpt/ppulsz;
meanVal=sumVal/ppulsz;
model_error=meanVal-T;
end

