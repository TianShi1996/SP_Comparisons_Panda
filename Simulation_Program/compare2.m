clear
close all
clc


%% trajectory2

load traj4.mat;
traj=traj4;
runtime=100;

%% Kp=100;taud=30
kp=100;  
Panda_run;

%%
% tic;CtrlF_traj2_Kp100=sim("CLRC_Panda_SP_F.mdl",runtime);toc
tic;CtrlA_traj2_Kp100=sim("CLRC_Panda_SP_A.mdl",runtime);toc
tic;CtrlB_traj2_Kp100=sim("CLRC_Panda_SP_B.mdl",runtime);toc
tic;CtrlC_traj2_Kp100=sim("CLRC_Panda_SP_C.mdl",runtime);toc
tic;CtrlD_traj2_Kp100=sim("CLRC_Panda_SP_D.mdl",runtime);toc
tic;CtrlE_traj2_Kp100=sim("CLRC_Panda_SP_E.mdl",runtime);toc
save('comp1_traj2_Kp100','CtrlA_traj2_Kp100','CtrlB_traj2_Kp100','CtrlC_traj2_Kp100','CtrlD_traj2_Kp100','CtrlE_traj2_Kp100');
clear('CtrlA_traj2_Kp100','CtrlB_traj2_Kp100','CtrlC_traj2_Kp100','CtrlD_traj2_Kp100','CtrlE_traj2_Kp100');






