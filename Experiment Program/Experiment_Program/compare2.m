clear
close all
clc

init_franka_matlab('0.9.1')
%init_start;
demos_common_configs;
%% trajectory2

load traj4.mat;
traj=traj4;
% Kp=200;taud=23
kp=100;
Panda_run;


