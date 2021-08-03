function [val,grad]= total_cost(pw,tw,pi,ti,pn,tn,dw_param,di_param,N_param)
[val1,grad1]=cost(tw,dw_param(pw,1),dw_param(pw,2),dw_param(pw,3));
[val2,grad2]=cost(ti,di_param(pi,1),di_param(pi,2),di_param(pi,3));
[val3,grad3]=cost(tn,N_param(pn,1),N_param(pn,2),N_param(pn,3));
val=val1+val2+val3;
grad=[grad1,grad2,grad3];
end
