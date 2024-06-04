function SP_fig_tau_a(figk,Ctrl,color)
% plot one sub-fig
linwid=[1.8,1.8,1.5];
% linwid=[1,1,1];
Ts=0.0002;
[~,len]=size(Ctrl);
h0=figure(figk);set(h0,'Position',[100,400,560,150]);
ymax1=0.06;ymax2=3e-3;ss={'-','--','-.'};
ftsize=12;
for k=1:len
    plot(Ctrl(k).tout,Ctrl(k).tau_a,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
end


ModName={'by Controller A','by Controller C','by Controller D'};

legend(ModName{1},ModName{2},ModName{3},'FontSize',8,'Box','off','NumColumns',1);
xlabel('');
ylabel('{\boldmath$\|\tau_{\rm{a}}\|$} (N.m)','Interpreter','latex','FontSize',ftsize);title('');
xlim([0,25]);
ylim([0,80]);
text(-4,80,'(b)','Interpreter','latex','FontName','Times New Roman','FontSize',ftsize)
set(gca,'FontName','Times New Roman','FontSize',ftsize);


axes('Position',[0.42,0.63,0.22,0.22]);
for k=1:len
    plot(Ctrl(k).tout,Ctrl(k).tau_a,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
end
xlabel('');
ylabel('');title('');
axis([15,16,30,32]);
set(gca,'FontName','Times New Roman','FontSize',10);

print('act_torque.eps','-depsc');