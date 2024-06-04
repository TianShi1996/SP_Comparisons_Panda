function SP_fig1(figk,Ctrl,color,ind)
% plot one sub-fig
% linwid=[1.5,1.5,1.8];
linwid=[1.8,1.8,1.5];
% linwid=[2.3,2.3,2.3];
[~,len]=size(Ctrl);
h0=figure(figk);set(h0,'Position',[100,400,560,150]);
ymax1=0.06;ymax2=3e-3;ss={'-','--','-.'};
ftsize=12;
for k=2:len
    plot(Ctrl(k).tout,Ctrl(k).W_hat,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
end

ModName={'by Controller A','by Controller C','by Controller D'};
% legend(ModName{2},ModName{3},'FontSize',10);
legend(ModName{2},ModName{3},'Interpreter','latex','FontSize',8,'Box','off','NumColumns',1);
xlabel('');
% ylabel('$\|\hat{W}\|$, $\|\hat{W}_e\|$','Interpreter','latex','FontSize',ftsize);
ylabel('$\|\hat{W}\|$, $\|\hat{W}_{\rm{e}}\|$ ','Interpreter','latex','FontSize',ftsize)
text(-16,8,'(a)','Interpreter','latex','FontName','Times New Roman','FontSize',ftsize)
title('');
axis([0,100,0,8]);xticks(0:20:100);
% text(5,3,['$K_p=$',num2str(ind)],'Interpreter','latex','FontSize',ftsize)
set(gca,'FontName','Times New Roman','FontSize',ftsize);
% axes('Position',[0.35,0.35,0.5,0.3]);
% for k=3:len
%     plot(Ctrl(k).err_norm,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
% end
% xlabel('');ylabel('');title('');
% axis([40,105,0,5*1e-3]);
% set(gca,'fontsize',16)

print('W_hat.eps','-depsc');

