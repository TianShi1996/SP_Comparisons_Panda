% clear
% close all
% clc

load traj4.mat;
traj=traj4;
figure(1)
plot(traj.qd,'LineWidth',1.5);
ylabel('q'),title('');
% xlim([0,100]);ylim([-2.5,3])

lab={'q1','q2','q3','q4','q5','q6','q7'};
legend(lab,'NumColumns',2)
