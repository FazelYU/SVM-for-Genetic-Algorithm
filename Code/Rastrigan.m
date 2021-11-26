function [f,grad] = Rastrigan( X )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n=length(X);
f=10*n+sum(X.*X-10*cos(X));
grad=2*X+10*sin(X);
end
