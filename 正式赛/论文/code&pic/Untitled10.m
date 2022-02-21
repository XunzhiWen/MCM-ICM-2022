dp=@(t,x)[x(1)*(400-0.01*x(2));x(2)*(-400+0.01*x(1))];
[t,x]=ode45(dp,[0,10],[400,400])
subplot(2,2,1);
plot(t,x(:,1),t,x(:,2),'linewidth', 1.2);
legend('Douglas Fir','Pinus Densiflora');
xlabel('Time (×10 years)');
ylabel('Trees (×10,000)');
grid off
set(gca, 'linewidth', 1.2, 'fontsize',10, 'fontname', 'times')
subplot(2,2,2);
plot(x(:,1),x(:,2),'m')
xlabel('Douglas Fir');
ylabel('Pinus Densiflora');
grid off
set(gca, 'linewidth', 1.2, 'fontsize',10, 'fontname', 'times')
dp=@(t,x) [2*x(1)*(1-x(1)/100-0.117*x(2));
    x(2)*(-1+0.01*x(1))];
[t,x]=ode45(dp,[0,20],[400,400]);
subplot(2,2,3);
plot(t,x(:,1),t,x(:,2));
xlabel('Time (×5 years)');
ylabel('Trees (×10,000)');
legend('Douglas Fir','Pinus Densiflora');
grid off
set(gca, 'linewidth', 1.2, 'fontsize',10, 'fontname', 'times')

dp=@(t,x) [2*x(1)*(1-x(1)/400-0.005*x(2));...
    x(2)*(-1+0.01*x(1))];%...代表换行
[t,x]=ode45(dp,[0,50],[300,150]);
subplot(2,2,4);
plot(x(:,1),x(:,2),'m');
xlabel('Douglas Fir');
ylabel('Pinus Densiflora');
grid off
set(gca, 'linewidth', 1.2, 'fontsize',10, 'fontname', 'times')
