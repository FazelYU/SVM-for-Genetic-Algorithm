function [f,grad] = Michal( X )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
M=10;
[m,n] = size(X);
grad=zeros(m,n);
f = 0;
for i = 1:n
	xi = X(:,i);
    inp=i*xi^2/pi;
	tempF = sin(xi) * (sin(inp))^(2*M);
	f  = f + tempF;
    grad(:,i)=cos(xi)*(sin(inp))^(2*M)+(2*M)*sin(xi)*(sin(inp))^(2*M-1)*cos(inp)*2*xi*i/pi;
end
f = -f;
grad=-grad;

end