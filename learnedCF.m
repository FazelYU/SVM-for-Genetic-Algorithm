function X = learnedCF(dim,~,options,model,min,max,flag)
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

for i=1:ppulsz
    [opt_x,~]=grad_dec(X(i,:),min,max,flag);
    X(i,:)=opt_x;
end

end

