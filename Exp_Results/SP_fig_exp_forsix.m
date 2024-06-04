function SP_fig_exp_forsix(figk,Ctrl,color)

% plot one sub-fig
linwid=[1.8,1.8,1.5];Ts=0.0002;
[~,len]=size(Ctrl);
h0=figure(figk);set(h0,'Position',[1000,100,560*1,170*6]);
ymax1=3e-3;ymax2=1e-3;%ss={'-','-','-.','-.','--','--'};
ss={'-','-.','-.'};
ftsize=10;
ModName={'by Controller A','by Controller C','by Controller D'};
%% W_tilde
subplot(611)
for k=2:len
    plot(Ctrl(k).tout,Ctrl(k).W_hat,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
end

ModName={'by Controller A','by Controller C','by Controller D'};
legend(ModName{2},ModName{3},'Interpreter','latex','FontSize',8,'Box','off','NumColumns',1);
xlabel('');
ylabel('$\|\hat{W}\|$, $\|\hat{W}_{\rm{e}}\|$ ','Interpreter','latex','FontSize',ftsize)
text(-16,8,'(a)','Interpreter','latex','FontName','Times New Roman','FontSize',ftsize)
title('');
axis([0,100,0,8]);xticks(0:20:100);
set(gca,'FontName','Times New Roman','FontSize',ftsize);

%% tau_a
subplot(612);
for k=1:len
    plot(Ctrl(k).tout,Ctrl(k).tau_a,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
end
legend(ModName{1},ModName{2},ModName{3},'FontSize',8,'Box','off','NumColumns',1);
xlabel('');
ylabel('{\boldmath$\|\tau_{\rm{a}}\|$} (N.m)','Interpreter','latex','FontSize',ftsize);title('');
xlim([0,25]);
ylim([0,100]);
text(-4,100,'(b)','Interpreter','latex','FontName','Times New Roman','FontSize',ftsize)
set(gca,'FontName','Times New Roman','FontSize',ftsize);

axes('Position',[0.25,0.73,0.25,0.04]);
for k=1:len
    plot(Ctrl(k).tout,Ctrl(k).tau_a,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
end
xlabel('');
ylabel('');title('');
axis([15,16,30,32]);
set(gca,'FontName','Times New Roman','FontSize',10);

%% q_error
subplot(613)
ymax1=0.08;ymax2=4e-2;
for k=1:len
    plot(Ctrl(k).tout,Ctrl(k).q_err_norm,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
end
ModName={'by Controller A','by Controller C','by Controller D'};
legend(ModName{1},ModName{2},ModName{3},'FontSize',8,'Box','off','NumColumns',1);
xlabel('');
ylabel('{\boldmath$\|e_1\|$} (rad)','Interpreter','latex','FontSize',ftsize);title('');
xlim([0,25]);ylim([0,ymax1]);
text(-4,0.08,'(c)','Interpreter','latex','FontName','Times New Roman','FontSize',ftsize)
set(gca,'FontName','Times New Roman','FontSize',ftsize);

subplot(614)
for k=1:len
    plot(Ctrl(k).tout,Ctrl(k).q_err_norm,ss{k},'color',color{k},'linewidth',linwid(k));hold on;
end
xlabel('');
ylabel('{\boldmath$\|e_1\|$} (rad)','Interpreter','latex','FontSize',ftsize);title('');
axis([75,100,0,ymax2]);
legend(ModName{1},ModName{2},ModName{3},'FontSize',8,'Box','off','NumColumns',1);
text(75-4,ymax2,'(d)','Interpreter','latex','FontName','Times New Roman','FontSize',ftsize)
set(gca,'FontName','Times New Roman','FontSize',ftsize);
%% pre_error
ymax1=2;ymax2=0.15;
subplot(615)
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

subplot(616)
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

print('fig_exp1.eps','-depsc');



