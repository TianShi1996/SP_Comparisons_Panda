clear
close all
clc

load traj4.mat;
traj=traj4;
panda=loadrobot("frankaEmikaPanda");
Ts=0.01;
%%
close all
pose=out.pose;
len=100/Ts+1;
pose=[reshape(pose.Data(1,:,:),len,1),reshape(pose.Data(2,:,:),len,1),reshape(pose.Data(3,:,:),len,1)];

% T=out.tout;
% plot3(pose(:,1),pose(:,2),pose(:,3),'b-','LineWidth',1.5);hold on
% T0=[10,20,30,40,50,60,70,80];

T=out.tout;
lab1=find(T==0);lab2=find(T==30);lab3=find(T==70);lab4=find(T==100);
ind1=lab1:lab2;ind2=lab3:lab4;
% T0 = [0,4,8,12,16,20,25,30,120,124,128,132,136,140,145,150];
T1=[0,4,8,12,16,19,22,25];
% T1=[0,3,6,8,12,15,18,21,24,27,30];
T0=[T1,T1+70];

h=figure(1);set(h,'Position',[1000,400,560,360])
plot3(pose(ind1,1),pose(ind1,2),pose(ind1,3),'-.','LineWidth',1.8);hold on
plot3(pose(ind2,1),pose(ind2,2),pose(ind2,3),'-','LineWidth',1.8);hold on

for k=1:7
    lab=find(T==T0(k));
    plot3(pose(lab,1),pose(lab,2),pose(lab,3),'d','color','#77AC30','MarkerFaceColor','#77AC30');hold on
    text(pose(lab,1)+0.05,pose(lab,2),pose(lab,3)+0.02,num2str(k),'FontName','Times New Roman','FontSize',16)
end
xlabel('x');ylabel('y');zlabel('z');
legend('Task 1','Task 2','Location','northeast');
set(gca,'FontName','Times New Roman','fontsize',14)
axis off
% figure(2)
% config = homeConfiguration(panda);
% for k=1:7
% config(k).JointPosition=traj4.qd.Data(k,1,1);
% end
% show(panda,config)
