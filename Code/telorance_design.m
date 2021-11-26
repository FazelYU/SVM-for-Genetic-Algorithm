function telorance_design()
clc;clear;
NumP=4;
rng('shuffle','twister');
dw_param=[1.5810 7.8735 1.44 0.018 0.80;
          1.4135 7.262 1.44 0.020 0.82;
          1.3622 6.8138 1.52 0.022 0.8;
          1.6315 8.1236 1.35 0.018 0.76];
di_param=[7.3964 3.9333 0.5 0.218 1.2;
          7.8735 3.124 0.55 0.23 1.26;
          6.8138 3.522 0.58 0.225 1.3;
          8.8236 4.4321 0.625 0.234 1.24];
N_param=[6.5634 21.4097 1.5 0.02 0.2;
         6.1138 20.682 1.5 0.024 0.22;
         5.8254 18.5635 1.75 0.022 0.25;
         7.3425 24.22 1.855 0.018 0.2];
minGained=inf;
xG=[-1,-1,-1];
pwG=-1;
piG=-1;
pnG=-1;
global tCostHandle;
for pw=2:NumP
    for pi=1:NumP
        for pn=2:NumP
            lb=[dw_param(pw,4),di_param(pi,4),N_param(pn,4)];
            ub=[dw_param(pw,5),di_param(pi,5),N_param(pn,5)];
            X=(ub-lb).*rand(1,3)+lb;
            tCostHandle=@(t)total_cost(pw,t(1),pi,t(2),pn,t(3),dw_param,di_param,N_param);
            [x,fval] = grad_dec(X,lb,ub,3);
            
            if(fval<minGained)
                minGained=fval;
                xG=x;
                pwG=pw;piG=pi;pnG=pn;
            end
        end
    end
end
xG
pwG
piG
pnG
minGained
end