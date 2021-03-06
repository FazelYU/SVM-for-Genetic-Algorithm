clc;clear;
addpath("Code/")
rng('shuffle','twister');
GA_options = optimoptions('ga');
numga=1;
diminsion=6;
PopulationSize_Data=30;

%% Case configuration
flag=4;%set 0 for Rastrigian Test function
       %set 1 for Schewfel Test function

switch flag
    case 0
        filename = 'rastrigan.xlsx';
        MaxGenerations_Data=20000;
        MaxStallGenerations_Data=10000;
        InitialPopulationRange_Data=[-8;8];
        lb=-8;ub=8;
        FitnessLimit_Data=10^-10;
        FFhandle=@Rast_FF;
    case 1
        filename = 'schewfel.xlsx';
        MaxGenerations_Data=30000;
        MaxStallGenerations_Data=30000;
        lb=-500;ub=500;
        InitialPopulationRange_Data=[-500;500];
        FitnessLimit_Data=-418.98*diminsion;
        FFhandle=@Schwefel_FF;
        warning('off');
        GA_options = optimoptions(GA_options,'MutationFcn', {  @mutationuniform 0.1 });
    case 2
        filename = 'michal.xlsx';
        MaxGenerations_Data=20000;
        MaxStallGenerations_Data=10000;
        lb=0;ub=pi;
        InitialPopulationRange_Data=[0;pi];
        switch diminsion
            case 2
                FitnessLimit_Data=-1.801;
            case 5
                FitnessLimit_Data=-4.687;
            case 10
                FitnessLimit_Data=-9.6;
        end
%         dim=2: G_optima: -1.8013
%         dim=5: G_optima: -4.687658
%         dim=10: G_optima: -9.66015
        FFhandle=@Michal_FF;
    case 4
       filename = 'data/pid_design.xlsx';
        MaxGenerations_Data=200;
        MaxStallGenerations_Data=200;
        InitialPopulationRange_Data=[0;10];
        lb=[0 0 0 0 0 0];ub=[10 10 10 10 10 10];
%         0.003103129831779295
        FitnessLimit_Data=0.003;
        FFhandle=@two_pid_design; 
        
end
%% GA configuration
GA_options = optimoptions(GA_options,'InitialPopulationRange', InitialPopulationRange_Data);
GA_options = optimoptions(GA_options,'PopulationSize', PopulationSize_Data);
GA_options = optimoptions(GA_options,'MaxGenerations', MaxGenerations_Data);
GA_options = optimoptions(GA_options,'FitnessLimit', FitnessLimit_Data);
GA_options = optimoptions(GA_options,'MaxStallGenerations', MaxStallGenerations_Data);
GA_options = optimoptions(GA_options,'SelectionFcn', @selectionroulette);
GA_options = optimoptions(GA_options,'Display', 'off');
GA_options = optimoptions(GA_options,'PlotFcn', {  @gaplotbestf,@gaplotbestindiv});
%% Run Learned GA

% SGA=@(table_location) run_SGA(numga,FFhandle,lb,ub,diminsion,GA_options,SS,flag,filename,table_location);
% UGA=@(table_location) run_UGA(numga,FFhandle,lb,ub,diminsion,GA_options,filename,table_location);
SS=100;

SGA=@(table_location,options) run_SGA(numga,FFhandle,lb,ub,diminsion,options,SS,flag,filename,table_location);
UGA=@(table_location,options) run_UGA(numga,FFhandle,lb,ub,diminsion,options,filename,table_location);

%% loading and using a model
% LGA=@(table_location,options,model) run_LGA(numga,FFhandle,lb,ub,diminsion,options,SS,flag,filename,table_location,model);
% load('Michal_5D_30S_3.mat','model3');
% GA_options = optimoptions(GA_options,'FitnessLimit', -4);
% LGA('A1',GA_options,model3);
% GA_options = optimoptions(GA_options,'FitnessLimit', -4.6);
% LGA('A3',GA_options,model3);
% GA_options = optimoptions(GA_options,'FitnessLimit', -4.68);
% LGA('A4',GA_options,model3);
% GA_options = optimoptions(GA_options,'FitnessLimit', -4.687);
% LGA('A5',GA_options,model3);
% GA_options = optimoptions(GA_options,'FitnessLimit', -4.6876);
% LGA('A6',GA_options,model3);
%% SGA
% GA_options = optimoptions(GA_options,'FitnessLimit', -4);
% SGA('A1',GA_options);
% GA_options = optimoptions(GA_options,'FitnessLimit', -4.6);
% SGA('A3',GA_options);
% GA_options = optimoptions(GA_options,'FitnessLimit', -4.68);
% SGA('A4',GA_options);
% GA_options = optimoptions(GA_options,'FitnessLimit', -4.687);
% SGA('A5',GA_options);
% GA_options = optimoptions(GA_options,'FitnessLimit', -4.6876);
% SGA('A6',GA_options);
%% UGA
% GA_options = optimoptions(GA_options,'FitnessLimit', -4);
% SGA('A1',GA_options);
% GA_options = optimoptions(GA_options,'FitnessLimit', -4.6);
UGA('A3' ,GA_options);
% GA_options = optimoptions(GA_options,'FitnessLimit', -4.68);
% UGA('A4',GA_options);
% GA_options = optimoptions(GA_options,'FitnessLimit', -4.687);
% UGA('A5',GA_options);
% GA_options = optimoptions(GA_options,'FitnessLimit', -4.6876);
% UGA('A6',GA_options);


%% Training a Model
% 
% LGA=@(table_location) run_LGA(numga,FFhandle,lb,ub,diminsion,GA_options,SS,flag,filename,table_location);
%  model1=LGA('A1');
% model2=LGA('A1');
% model3=LGA('A1');
% model4=LGA('A1');
% model5=LGA('A1');
% model6=LGA('A1');
% model7=LGA('A1');
% model8=LGA('A1');
% model9=LGA('A1');
% model10=LGA('A1');