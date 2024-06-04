function SP_fig1_q(figk,Ctrl,color)
% plot one sub-fig
% linwid=[1.5,1.5,1.8];
linwid=[1.8,1.8,1.5];
[~,len]=size(Ctrl);
h0=figure(figk);set(h0,'Position',[100,400,560,150]);
% subplot(211)
ymax1=0.08;ymax2=4e-2;ss={'-','--','-.'};
ftsize=12;
for k=1:len
    plot(Ctrl(k).tout,Ctrl(k).q_err_norm,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
end
ModName={'by Controller A','by Controller C','by Controller D'};

legend(ModName{1},ModName{2},ModName{3},'FontSize',8,'Box','off','NumColumns',1);
% xlabel('Time (s)','Interpreter','latex','FontSize',ftsize);
xlabel('');
ylabel('{\boldmath$\|e_1\|$} (rad)','Interpreter','latex','FontSize',ftsize);title('');
xlim([0,25]);ylim([0,ymax1]);
text(-4,0.08,'(c)','Interpreter','latex','FontName','Times New Roman','FontSize',ftsize)
set(gca,'FontName','Times New Roman','FontSize',ftsize);
% text(5,3,['$K_p=$',num2str(ind)],'Interpreter','latex','FontSize',ftsize)

print('q_error1.eps','-depsc');
% h=figure;set(h,'Position',[1000,400,560,240]);
% %axes('Position',[0.25,0.6,0.4,0.25]);
% for k=1:len
%     plot(Ctrl(k).q_err_norm,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
% end
% xlabel('Time (s)','Interpreter','latex','FontSize',ftsize);
% ylabel('{\boldmath$\|e_1\|$}','Interpreter','latex','FontSize',ftsize);title('');
% axis([0,30,0,ymax1]);legend(ModName{1},ModName{2},ModName{3},'FontSize',12);
% set(gca,'FontName','Times New Roman','FontSize',ftsize);
h=figure(figk+1);set(h,'Position',[100,400,560,150]);
% subplot(212)
%axes('Position',[0.25,0.25,0.4,0.25]);
for k=1:len
    plot(Ctrl(k).tout,Ctrl(k).q_err_norm,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
end
% xlabel('Time (s)','Interpreter','latex','FontSize',ftsize);
xlabel('');
ylabel('{\boldmath$\|e_1\|$} (rad)','Interpreter','latex','FontSize',ftsize);title('');
axis([75,100,0,ymax2]);
legend(ModName{1},ModName{2},ModName{3},'FontSize',8,'Box','off','NumColumns',1);
text(75-4,ymax2,'(d)','Interpreter','latex','FontName','Times New Roman','FontSize',ftsize)
set(gca,'FontName','Times New Roman','FontSize',ftsize);

print('q_error2.eps','-depsc');

