clear
close all
clc


%% trajectory1

load traj4.mat;
traj=traj4;
runtime=100;
warning off
%% [0:2:20,30:10:100,200:100:1000]

q_ErrMeansData=[];
WssData=[];W_meansData=[];
% kpdata=[0:2:20,30:10:100,200:100:1000];%1000:1000:20000;
% kpdata=[0:4:20,30:10:100,120:20:500];
kpdata=[20,40,60,80,100,200];
len=length(kpdata);
RMSE_Task2=zeros(len,5);
RMSE=zeros(len,5);
WssData=zeros(len,3);
W_meansData=zeros(len,3);
PressData=zeros(len,3);
Pre_meansData=zeros(len,3);
for k=1:len
    kp=kpdata(k)
    Panda_run;
    tic;
    CtrlA_traj=sim("CLRC_Panda_SP_A.mdl",100);toc
    [RMSE_A,RMSE_task2_A]=fun1(CtrlA_traj);

    tic;
    CtrlB_traj=sim("CLRC_Panda_SP_B.mdl",100);toc
    [RMSE_B,RMSE_task2_B]=fun1(CtrlB_traj);
    
    tic;
    CtrlC_traj=sim("CLRC_Panda_SP_C.mdl",runtime);toc
    [Wss_C,RMSE_task2_C,W_means_C,RMSE_C,Pre_means_C,Pre_ss_C]=fun2(CtrlC_traj);

    tic;
    CtrlD_traj=sim("CLRC_Panda_SP_D.mdl",runtime);toc
    [Wss_D,RMSE_task2_D,W_means_D,RMSE_D,Pre_means_D,Pre_ss_D]=fun2(CtrlD_traj);

    tic;
    CtrlE_traj=sim("CLRC_Panda_SP_E.mdl",runtime);toc
    [Wss_E,RMSE_task2_E,W_means_E,RMSE_E,Pre_means_E,Pre_ss_E]=fun2(CtrlE_traj);

    RMSE_Task2(k,:)=[RMSE_task2_A,RMSE_task2_B,RMSE_task2_C,RMSE_task2_D,RMSE_task2_E];
    RMSE(k,:)=[RMSE_A,RMSE_B,RMSE_C,RMSE_D,RMSE_E];
    WssData(k,:)=[Wss_C,Wss_D,Wss_E];
    W_meansData(k,:)=[W_means_C,W_means_D,W_means_E];
    PressData(k,:)=[Pre_ss_C,Pre_ss_D,Pre_ss_E];
    Pre_meansData(k,:)=[Pre_means_C,Pre_means_D,Pre_means_E];

end
% Kp=[0:2:20,30:10:100];
Kp=kpdata;
save('Kp_comp_bar','Kp','RMSE','RMSE_Task2','WssData','W_meansData','PressData',"Pre_meansData");


%%
% figure(1)
% plot(Errdata(:,1),Errdata(:,2));hold on;
% plot(Errdata(:,1),Errdata(:,3));hold on;
% plot(Errdata(:,1),Errdata(:,4));hold on;
% legend('C','D','Ext')


function [RMSE,RMSE_task2]=fun1(Ctrl_traj)
Ts=0.0005;
ind1=1:(25/Ts);
ind2=(75/Ts):(100/Ts);
ind=[ind1,ind2];
RMSE_task2=sqrt(sum(Ctrl_traj.q_err_norm.Data(ind2).^2)/length(Ctrl_traj.q_err_norm.Time(ind2)));
RMSE=sqrt(sum(Ctrl_traj.q_err_norm.Data(ind).^2)/length(Ctrl_traj.q_err_norm.Time(ind)));
end


function [Wss,RMSE_task2,W_means,RMSE,pre_means,pre_ss]=fun2(Ctrl_traj)
Ts=0.0005;
W_means=sqrt(sum(Ctrl_traj.err_norm.Data.^2)/length(Ctrl_traj.err_norm.Time));
Wss=Ctrl_traj.err_norm.Data(end);
ind1=1:25/Ts;
ind2=(75/Ts):(100/Ts);
ind=[ind1,ind2];
RMSE_task2=sqrt(sum(Ctrl_traj.q_err_norm.Data(ind2).^2)/length(Ctrl_traj.q_err_norm.Time(ind2)));
RMSE=sqrt(sum(Ctrl_traj.q_err_norm.Data(ind).^2)/length(Ctrl_traj.q_err_norm.Time(ind)));

pre_means=sqrt(sum(Ctrl_traj.predict_err.Data(ind2).^2)/length(Ctrl_traj.predict_err.Time(ind2)));
pre_ss=max(Ctrl_traj.predict_err.Data(ind2));

end










