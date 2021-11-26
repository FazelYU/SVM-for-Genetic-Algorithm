function [best_C, best_sigma,max_acc,min_error,best_model] = tuneParam(X,y,diminsion,options,lb,ub,testF_flag,gainedThold)

switch testF_flag
    case 0
        C_Array=[0.01 0.03 0.1 0.3 1];
        Sigma_Array=[0.1 0.3 1 3];
    case 1
        C_Array=[3 10 30];
        Sigma_Array= [10 30 50 80];
end

max_acc=0;
min_error=inf;
best_C=0;
best_sigma=0;

for c=C_Array 
    for s=Sigma_Array 
        model= svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, s)); 
        [model_error,model_accuracy]=testModel(diminsion,options,model,lb,ub,testF_flag,gainedThold);
        if (model_accuracy>max_acc)
            max_acc=model_accuracy;
            min_error=model_error;
            best_C=c;
            best_sigma=s;
            best_model=model;
        end
    end
end

% =========================================================================

end
