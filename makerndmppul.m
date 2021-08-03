function [X,y,T,numPos]=makerndmppul(dim,ppulsz,lb,ub,flag)
% rng('shuffle','twister');
X=(ub-lb).*rand(ppulsz,dim)+lb;
y=zeros(ppulsz,1);
localx=zeros(size(X));
for i=1 : ppulsz
    [opt_x,val]=grad_dec(X(i,:),lb,ub,flag);
    localx(i,:)=opt_x;
    y(i)=val;
end

c1=mean(y)-2*sqrt(var(y));
c2=min(y);
T=max(c1,c2);
numPos=0;
extendX=[];
extendY=[];

for i=1:ppulsz
    if(y(i)<0)
        continue;
        y(i)
        X(i,:)
        localx(i,:)
    end
    if(y(i)<=T)
        y(i)=1;
        X(i,:)=localx(i,:);
        extendX=[extendX;localx(i,:)];
        extendY=[extendY;1];
        numPos=numPos+5;
    else
        y(i)=0;
    end
end
X=[X;extendX;extendX;extendX;extendX];
y=[y;extendY;extendY;extendY;extendY];

end