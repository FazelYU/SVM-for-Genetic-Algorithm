function out = Rast_FF(X)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes  on 
n=length(X);
out=10*n+sum(X.*X-10*cos(X));


end

