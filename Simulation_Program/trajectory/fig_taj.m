clear
close all
clc
ftsize=12;
load traj4.mat;
traj=traj4;
h0=figure(1);set(h0,'Position',[100,400,560,170]);
plot(traj.qd,'LineWidth',1.5);
ylabel('q'),title('');
% xlim([0,100]);ylim([-2.5,3.5])
xlabel('Time (s)','Interpreter','latex','FontSize',ftsize);
ylabel('{\boldmath$q_{\rm{d}}$} (rad)','Interpreter','latex','FontSize',ftsize);title('');

lab={'$q_1$','$q_2$','$q_3$','$q_4$','$q_5$','$q_6$','$q_7$'};
legend(lab,'Interpreter','latex','NumColumns',1,'Location','eastoutside')
set(gca,'FontName','Times New Roman','FontSize',ftsize);