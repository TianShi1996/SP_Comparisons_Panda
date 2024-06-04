% function Panda_run(traj,kp)

par=baseparmes();

%%
SD = 0; % standard derivation
vari = SD^2; % noise variance
%% for controller

Ts = 0.0005; Umax = 500;
% a = 1; % filter constant
taud = 25; % integral duration
Lambda=10*eye(7)*0.5;
Kc =diag([20,20,20,20,8,8,5])*0.5; % control gains
GammaWa = 0.4*eye(69);
GammaW = 0.4*eye(64); % learning rate
kw1 = 0; % weight of old prediction error
kw2 = 3; % weight of new prediction error
alpha=25;
kapa1=1;kapa2=1;
% q0=[0,-0.785398163,0,-2.35619449,0,1.57079632679,0.785398163397]';
% q0=[0,-0.8,0,-2,0,1.2,0.75]';
epsilon=0.0005;alpha1=0.3;alpha2=0.0225;alpha3=0.0005;
q0=traj.qd.Data(:,:,1);
% q0=traj.qd.Data(1,:)';
% q0=traj_zw.qd.signals.values(1,:)';
% q0=[0.0,-0.5,-0.00,-2.05,0.00,1.5,0.80]';
I=eye(7);
K=14000*I;B=4.44*I;D=0.1075*I;%0.001075*I;
% eKd=0.358*I;
Kp=kp*I;
Ma_par=diag(inv(I+Kp)*B,0);

omega_n=sqrt(inv(B)*K*(Kp+I));
eKd=1*inv(K)*B*2*omega_n-inv(K)*D;
% lm1=1200*I;lm2=inv(B)*K*(Kp+I)/900
% eKd=inv(K)*B*(lm1+lm2)-inv(K)*D
Be=inv(I+Kp)*B;


% Kph=0;
% omega_n=sqrt(inv(B)*K*(Kp+I));
% eKdh=0;1*inv(K)*B*2*omega_n-inv(K)*D;


