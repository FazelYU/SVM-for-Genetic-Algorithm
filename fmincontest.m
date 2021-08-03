function [x,fval,exitflag,output,lambda,grad,hessian] = fmincontest(x0,lb,ub,MaxIterations_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('fmincon');
%% Modify options setting
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'MaxIterations', MaxIterations_Data);
options = optimoptions(options,'SpecifyObjectiveGradient', true);
options = optimoptions(options,'UseParallel', true);
[x,fval,exitflag,output,lambda,grad,hessian] = ...
fmincon(@Schwefel,x0,[],[],[],[],lb,ub,[],options);
