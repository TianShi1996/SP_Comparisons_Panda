function SP_fig1_pre_err(figk,Ctrl,color)
% plot one sub-fig
% linwid=[1.5,1.5,1.2];
linwid=[1.8,1.8,1.5];
[~,len]=size(Ctrl);
h0=figure(figk);set(h0,'Position',[100,400,560,150]);
ymax1=0.06;ymax2=3e-3;ss={'-','--','-.'};
ftsize=12;
for k=2:len
    plot(Ctrl(k).tout,Ctrl(k).pre_err,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
end
ModName={'by Controller A','by Controller C','by Controller D'};

legend(ModName{2},ModName{3},'FontSize',8,'Box','off','NumColumns',1);
xlabel('');
ylabel('{\boldmath$\|\epsilon\|$} (N.m)','Interpreter','latex','FontSize',ftsize);title('');
xlim([0,25]);ylim([0,8]);
text(-3.5,8,'(e)','Interpreter','latex','FontName','Times New Roman','FontSize',ftsize)
set(gca,'FontName','Times New Roman','FontSize',ftsize);

print('pre_error1.eps','-depsc');

h0=figure(figk+1);set(h0,'Position',[100,400,560,170]);
for k=2:len
    plot(Ctrl(k).tout,Ctrl(k).pre_err,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
end
% ModName={'Controller A','Controller C','Controller D'};

legend(ModName{2},ModName{3},'FontSize',8,'Box','off','NumColumns',1);
xlabel('Time (s)','Interpreter','latex','FontSize',ftsize);
ylabel('{\boldmath$\|\epsilon\|$} (N.m)','Interpreter','latex','FontSize',ftsize);title('');
xlim([75,100]);ylim([0,1]);
text(71.5,1,'(f)','Interpreter','latex','FontName','Times New Roman','FontSize',ftsize)
set(gca,'FontName','Times New Roman','FontSize',ftsize);

print('pre_error2.eps','-depsc');