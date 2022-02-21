%%
clc,clear,close all

t = 1:100;
t = t';
y = 800*t + 100*sin(t/2) + randn( size(t) );
figure
plot(t, y)

%%  
figure
subplot(211),autocorr( y );
subplot(212),parcorr( y );
figure
dy = diff( y );
subplot(211),autocorr( dy );
subplot(212),parcorr( dy );

%% ARIMA
Mdl = arima(2,1,0);
EstMdl = estimate(Mdl,y);
res = infer(EstMdl,y);
figure
subplot(2,2,1)
plot(res./sqrt(EstMdl.Variance))
title('Standardized Residuals')
set(gca, 'linewidth', 1.2, 'fontsize',10, 'fontname', 'times')
subplot(2,2,2),qqplot(res)
title('Sample Data - Standard Normalization')
xlabel('Standard Normal Quantile')
ylabel('Entered Sample Quantile')
set(gca, 'linewidth', 1.2, 'fontsize',10, 'fontname', 'times')
subplot(2,2,3),autocorr(res)
set(gca, 'linewidth', 1.2, 'fontsize',10, 'fontname', 'times')
subplot(2,2,4),parcorr(res)
set(gca, 'linewidth', 1.2, 'fontsize',10, 'fontname', 'times')
[yF,yMSE] = forecast(EstMdl,20,'Y0',y);
UB = yF + 1.96*sqrt(yMSE);
LB = yF - 1.96*sqrt(yMSE);
figure
h4 = plot(y,'b');
hold on
h5 = plot(101:120,yF,'r','LineWidth',2);
h6 = plot(101:120,UB,'k--','LineWidth',1.5);
plot(101:120,LB,'k--','LineWidth',1.5);
hold off
