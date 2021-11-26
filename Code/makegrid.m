function [X,Y] = makegrid( x,n,y,T,options,Max,Min,resolution )
if length(x)==n
    [opt_x,val]=grad_dec(x,options);
    if val<T
        y=[y,1];
%         X=opt_x;
          X=x;
    else
        y=[y,0];
        X=x;
    end
    Y=y;
    return;
end
X=[];
for IN=Min:resolution:Max
    [tempX,y]= makegrid([x;IN],n,y,T,options,Max,Min,resolution );
    X=[X,tempX];
end
Y=y;
end

