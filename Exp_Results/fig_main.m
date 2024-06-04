clear
close all
clc

%%
color_a='#000000';color_b='#7E2F8E';color_c='#6E8B3D';%'#EEAD0E';
color_d='#0072BD';color_e='#CD3333';
color_f='#006400';color_g='#6B8E23';
linwid=1.2;

%% comp: Kp=20*I; taud=23;
clc
close all
Pos=zeros(3,4);
for k=3:-1:1
    Pos(k,:)=[0.10,0.98-k*7*0.13/3,0.88,0.12*7/3];
end
color={color_a,color_c,color_d};
close all

Ts=1e-3;

load traj2.mat;
traj=traj2;
qd=squeeze (traj.qd.Data(:,1,:))';
t=0:Ts:100;
q0=traj.qd.Data(:,:,1);
load exp_CtrlA\err_norm.mat;load exp_CtrlA\tau_a.mat;
CtrlA_q_err=[0,err_norm(2,2:(100/Ts+1))];CtrlA_tau_a=errvec(tau_a(2:end,1:(100/Ts+1))');
load exp_CtrlC\err_norm.mat;load exp_CtrlC\W_hat.mat;load exp_CtrlC\pre_err.mat;load exp_CtrlC\tau_a.mat;
CtrlC_q_err=[0,err_norm(2,2:(100/Ts+1))];
CtrlC_W_hat=errvec(W_hat(2:end,1:(100/Ts+1))');CtrlC_pre_err=pre_err(2,1:(100/Ts+1));CtrlC_tau_a=errvec(tau_a(2:end,1:(100/Ts+1))');
load exp_CtrlD\err_norm.mat;load exp_CtrlD\W_hat.mat;load exp_CtrlD\pre_err.mat;load exp_CtrlD\tau_a.mat;
CtrlD_q_err=[0,err_norm(2,2:(100/Ts+1))];
CtrlD_W_hat=errvec(W_hat(2:end,1:(100/Ts+1))');CtrlD_pre_err=pre_err(2,1:(100/Ts+1));CtrlD_tau_a=errvec(tau_a(2:end,1:(100/Ts+1))');

Ctrl(1).q_err_norm=CtrlA_q_err;Ctrl(1).tout=t;Ctrl(1).tau_a=CtrlA_tau_a;

Ctrl(2).q_err_norm=CtrlC_q_err;Ctrl(2).tout=t;
Ctrl(2).W_hat=CtrlC_W_hat;Ctrl(2).pre_err=CtrlC_pre_err;Ctrl(2).tau_a=CtrlC_tau_a;
Ctrl(3).q_err_norm=CtrlD_q_err;Ctrl(3).tout=t;
Ctrl(3).W_hat=CtrlD_W_hat;Ctrl(3).pre_err=CtrlD_pre_err;Ctrl(3).tau_a=CtrlD_tau_a;

% SP_fig1_q(1,Ctrl,color)
% SP_fig1(3,Ctrl,color)
% SP_fig1_pre_err(4,Ctrl,color)
% SP_fig_tau_a(4,Ctrl,color)

tau_A.time=t;
tau_A.signals.values=CtrlA_tau_a;
tau_A.signals.dimensions=1;

tau_C.time=t;
tau_C.signals.values=CtrlC_tau_a;
tau_C.signals.dimensions=1;
tau_D.time=t;
tau_D.signals.values=CtrlD_tau_a;
tau_D.signals.dimensions=1;
%%
close all
load filter_taua.mat;
Ctrl(1).tau_a=out.tau_A;
Ctrl(2).tau_a=out.tau_C;
Ctrl(3).tau_a=out.tau_D;

% SP_fig_tau_a(6,Ctrl,color)
%%
clc
close all

% SP_fig_exp_forsix(1,Ctrl,color)

SP_fig_exp_forfour(1,Ctrl,color)














