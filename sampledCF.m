function Xout = sampledCF(dim,~,options,samplingsz,min,max,flag)
ppulsz=options.PopulationSize;
samplingsz=ppulsz;
rng('shuffle','twister');
X=(max-min).*rand(samplingsz,dim)+min;
y=zeros(samplingsz,1);
localx=zeros(samplingsz,dim);
for i=1 : samplingsz
    [opt_x,val]=grad_dec(X(i,:),min,max,flag);
    localx(i,:)=opt_x;
    y(i)=val;
end
Xout=localx;
% sorty=sort(y);
% slctfct=ppulsz;
% T=sorty(slctfct);
% Xout=zeros(slctfct,dim);
% counter=1;
% for i=1:samplingsz
%     if(y(i)<=T)
%         Xout(counter,:)=localx(i,:);
%         counter=counter+1;
%     end
% end
% Xout=Xout(randperm(slctfct),:);
end

