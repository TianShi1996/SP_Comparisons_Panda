% function Panda_run(traj,kp)

%%
SD = 0.02; % standard derivation
vari = SD^2; % noise variance
%% for controller

par=baseparmes();

Ts = 0.001; Umax = 500;
% a = 1; % filter constant
taud = 25; % integral duration
Lambda=10*eye(7);
Kc =diag([20,20,20,20,8,8,5]); % control gains
GammaWa = 0.2*eye(69);
GammaW = 0.2*eye(64); % learning rate
kw1 = 0; % weight of old prediction error
kw2 = 3; % weight of new prediction error
alpha=3;
kapa1=1;kapa2=1;
% q0=[0,-0.785398163,0,-2.35619449,0,1.57079632679,0.785398163397]';
% q0=[0,-0.8,0,-2,0,1.2,0.75]';
epsilon=0.0005;alpha1=0.3;alpha2=0.0225;alpha3=0.0005;
q0=traj.qd.Data(:,:,1);
% q0=traj.qd.signals.values(1,:)';
I=eye(7);
K=diag([14250,14250,14250,14250,9000,9000,9000]);

B=4.44*I;D=0.1075*I;
eKd=0.358*I;
Kp=kp*I;
%Ma_par=diag(inv(I+Kp)*B,0);
% 
omega_n=sqrt(inv(B)*K*(Kp+I))
eKd=1*inv(K)*B*2*omega_n-inv(K)*D



