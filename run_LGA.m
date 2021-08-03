function model=run_LGA(NumGA,FFhandle,lb,ub,diminsion,options,SamplingSize,testF_flag,filename,table_location,input_model)
if(exist('input_model','var'))
    model=input_model;
    gainedThold="";numPos="";bestC="";bestSigma="";F1_Score="";prec="";rec="";model_error="";model_accuracy="";
else
%%search C and Sigma 
[X,y,gainedThold,numPos]=makerndmppul(diminsion,SamplingSize,lb,ub,testF_flag);
[bestC, bestSigma] = dataset3Params(X,y,testF_flag);
[model,model_error,model_accuracy,F1_Score,prec,rec]=makeModel(X,y,lb,ub,diminsion,SamplingSize,testF_flag,bestC,bestSigma,options,gainedThold);
end
%% Run GA and store the data


fprintf('\nLearnedGA\n');
NGen=zeros(1,NumGA);
val=zeros(1,NumGA);
Time=zeros(1,NumGA);


f = @( GenomeLength, FitnessFcn, options) learnedCF(GenomeLength, FitnessFcn, options, model,lb,ub,testF_flag);
options = optimoptions(options,'CreationFcn', f);
for counter=1:NumGA
%     fprintf('%d ',counter);
    tic;
        [x,vall,~,output,~,~]=ga(FFhandle,diminsion,[],[],[],[],lb,ub,[],[],options);
    Time(counter)=toc;
    NGen(counter)=output.generations;
    val(counter)=vall
    x
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
perfThold=options.FitnessLimit;
if(exist('input_model','var'))
thold_error="";
else
thold_error=gainedThold-perfThold;    
end

%% report and storage
T=table(diminsion,NumGA,SamplingSize,Thold,...
    perfectInitRatio,StalledRatio,...
    meanNG,minImpNS,meanImpNS,maxImpNS,...
    minTime,meanTime,maxTime,varTime,...
    bestC,bestSigma,F1_Score,prec,rec,model_error,model_accuracy,thold_error,numPos)
T=table(diminsion,NumGA,SamplingSize,Thold,...
    perfectInitRatio,StalledRatio,...
    meanNG,minImpNS,meanImpNS,maxImpNS,...
    minTime,meanTime,maxTime,varTime);
if table_location=='A1'
    writetable(T,filename,'Sheet',1,'Range',table_location)
else
    writetable(T,filename,'Sheet',1,'Range',table_location,'WriteVariableNames',false)
end
end