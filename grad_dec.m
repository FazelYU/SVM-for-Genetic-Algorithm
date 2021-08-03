function [op_x,val] = grad_dec( X,min,max,flg )
        global tCostHandle;
switch flg
    case 0
        options=optimset('MaxIter',10);
        [op_x,values]=fmincg(@(x)(Rastrigan(x)),X',options);
        if(~isempty(values))
             val=values(end);
        else
             val=0;
        end
    case 1
         options = optimoptions('fmincon');
        options = optimoptions(options,'Display', 'off');
        options = optimoptions(options,'MaxIterations', 10);
        options = optimoptions(options,'SpecifyObjectiveGradient', true);
        [~,dim]=size(X);
        lb=min*ones(1,dim);
        ub=max*ones(1,dim);
        [op_x,val,~,~,~,~,~] = ...
        fmincon(@Schwefel,X,[],[],[],[],lb,ub,[],options);
    case 2
           options = optimoptions('fmincon');
        options = optimoptions(options,'Display', 'off');
        options = optimoptions(options,'MaxIterations', 10);
        options = optimoptions(options,'SpecifyObjectiveGradient', true);
        [~,dim]=size(X);
        lb=min*ones(1,dim);
        ub=max*ones(1,dim);
        [op_x,val,~,~,~,~,~] = ...
        fmincon(@Michal,X,[],[],[],[],lb,ub,[],options);
    case 3
        options = optimoptions('fmincon');
        options = optimoptions(options,'Display', 'off');
        % options = optimoptions(options,'PlotFcn', {  @optimplotx @optimplotfval @optimplotconstrviolation });
        options = optimoptions(options,'SpecifyObjectiveGradient', true);
        [op_x,val,~,~,~,~,~] = ...
            fmincon(tCostHandle,X,[],[],[],[],min,max,@design_cons,options);
    case 4
        options = optimoptions('fmincon');
        options = optimoptions(options,'Display', 'off');
%         options = optimoptions(options,'MaxIterations', 10);
        [op_x,val,~,~,~,~,~] = ...
        fmincon(@two_pid_design,X,[],[],[],[],min,max,[],options);
end


end

