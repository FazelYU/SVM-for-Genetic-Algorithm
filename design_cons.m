function [c,ceq] = design_cons(x)
tw=x(1);ti=x(2);tn=x(3);
G=100000;N=10;di=25.4;dw=2.54;
c = [(G*(dw+tw)^4)/(8*(di-ti+dw+tw)^3*(N-tn))-(G*(dw-tw)^4)/(8*(di+ti+dw-tw)^3*(N+tn))-0.477;
    ti+2*tw-0.508];
ceq = [];
end