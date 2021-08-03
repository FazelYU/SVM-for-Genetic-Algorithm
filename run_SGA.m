function [val,NGen]=run_SGA(NumGA,FFhandle,lb,ub,diminsion,options,SamplingSize,flag,filename,table_location)
NGen=zeros(1,NumGA);
val=zeros(1,NumGA);
Time=zeros(1,NumGA);
f = @( GenomeLength, FitnessFcn, options) sampledCF(GenomeLength, FitnessFcn, options, SamplingSize,lb,ub,flag);
options = optimoptions(options,'CreationFcn', f);
fprintf('\nSampledGA\n');
for counter=1:NumGA
fprintf('%d ',counter);
 tic;
[~,vall,~,output,~,~]=ga(FFhandle,diminsion,[],[],[],[],lb,ub,[],[],options);
 Time(counter)=toc;
NGen(counter)=output.generations;
val(counter)=vall;
end
%% create The Results

impInit=NGen(find(NGen~=1));
impInit_notStall=NGen(find(NGen~=1 & NGen<=options.MaxStallGenerations));
stalled=NGen(find(NGen>=options.MaxStallGenerations));
meanNG=mean(NGen);
perfectInitRatio=1-length(impInit)/NumGA;
StalledRatio=length(stalled)/NumGA;
minImpNS=-1;
meanImpNS=-1;
maxImpNS=-1;
if ~isempty(impInit_notStall)
    minImpNS=min(impInit_notStall);
    meanImpNS=mean(impInit_notStall);
    maxImpNS=max(impInit_notStall);
end
minTime=min(Time);
meanTime=mean(Time);
maxTime=max(Time);
varTime=var(Time);
Thold=options.FitnessLimit;
%% Report 
T=table(diminsion,NumGA,SamplingSize,Thold,...
    perfectInitRatio,StalledRatio,...
    meanNG,minImpNS,meanImpNS,maxImpNS,...
    minTime,meanTime,maxTime,varTime)
if table_location=='A1'
    writetable(T,filename,'Sheet',1,'Range',table_location)
else
    writetable(T,filename,'Sheet',1,'Range',table_location,'WriteVariableNames',false)
end
end