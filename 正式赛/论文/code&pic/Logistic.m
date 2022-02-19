function Logistic ()

clear;
clf;
u=2.6:0.001:4.0;
x=0.1;
for i=1:300
x=u.*(x-x.^2);
end
for j=1:80
x=u.*(x-x.^2);
patch(u,x,x,'EdgeColor','flat','LineWidth',1,'MarkerFaceColor','flat','FaceColor','none')
% plot(u,x,'k.','markersize',2)
hold on;
end
xlabel('Logistic Parameter')
ylabel('Carbon Sequestration Behavior Probability')
title('Density Chaos of Trees')
legend('Chaos Measure')
set(gca, 'linewidth', 1.2, 'fontsize',12, 'fontname', 'times')

colorbar
grid off