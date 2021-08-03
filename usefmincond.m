function [x,fval,exitflag,output,lambda,grad,hessian] = usefmincond(x0)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('fmincon');
%% Modify options setting
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'SpecifyObjectiveGradient', true);
[x,fval,exitflag,output,lambda,grad,hessian] = ...
fmincon(@telorance_design,x0,[],[],[],[],[],[],@design_cons,options);

end