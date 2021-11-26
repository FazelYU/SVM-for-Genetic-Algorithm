function [f,grad] = Schwefel( X )
sqrtX=sqrt(abs(X));
f=sum(-X.*sin(sqrtX));
grad=-sin(sqrtX)-X.*cos(sqrtX)./(2*sqrtX).*(X./abs(X));
end