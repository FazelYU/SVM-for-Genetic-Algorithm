function [x,fval,exitflag,output,population,score] = untitled(nvars,lb,ub,MaxGenerations_Data,FitnessLimit_Data,MaxStallGenerations_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'MaxGenerations', MaxGenerations_Data);
options = optimoptions(options,'FitnessLimit', FitnessLimit_Data);
options = optimoptions(options,'MaxStallGenerations', MaxStallGenerations_Data);
options = optimoptions(options,'Display', 'off');
[x,fval,exitflag,output,population,score] = ...
ga(@two_pid_design,nvars,[],[],[],[],lb,ub,[],[],options);
