function [val,grad]=cost(telor,c0,c1,c2)
val=c0*exp(-telor*c1)+c2;
grad=-c0*c1*exp(-c1*telor);
end