clc;
clear;
a=0.00006303;
D1=0.25;
D2=0.35;
b=1.8218;
H1=25;
H2=10;
c=1.0282;
S1=5000;
S2=5000;
density=800;
x=0:0.01:1;
v1=a*(D1^b)*(H1^c)*S1*density*(1-x);
v2=a*(D2^b)*(H2^c)*S2*density*(1-x);
M1=0.28*v1+0.3*v2+9.6*S1+3.4*S2+70*(S1+S2);
C1=M1/12*44;

s=0.1;
CM=0.28*v1+0.3*v2
M2=zeros(1,101);
for t=0:100
    s=0.1;
    m1=  1497*exp(-((t+295.4)/102.4)^2) + 6806*exp(-((t+1897)/622.6)^2);
    m2=  1.75e+05*exp(-((t+275)/77.36)^2) + 3.416e+15*exp(-((t+3800)/627.9)^2);
    m3 =  283.5*exp(-((t+257.5)/98.8)^2) + 1545*exp(-((t+1551)/557.9)^2);
    m4 =  307.3*exp(-((t+325.4 )/121.9)^2) + 6.548*exp(-((t+607.7)/412.9)^2);
    m5 =  4.562*exp(-((t+91.4)/58.3)^2) + 3.816e+06*exp(-((t+2137)/540.1)^2);
    m6 =  59.58*exp(-((t+132.4)/57.33 )^2) + 2581*exp(-((t+339.8)/118.7)^2);
    m7 =  0.2072*exp(-((t+1.997)/2.787)^2) + 1.38*exp(-((t+8.314)/12.33)^2);
     if(m1<=0)
        m1=0;
    end
    if(m2<=0)
        m2=0;
    end
    if(m3<=0)
        m3=0;
    end
    if(m4<=0)
        m4=0;
    end
    if(m5<=0)
        m5=0;
    end
    if(m6<=0)
        m6=0;
    end
    %M2=M2+s*x*CM.*(1/6.*(m1(t)+m2(t)+m3(t)+m4(t)+m5(t)+m6(t)));


end
    M20=(1-s)*x.*CM*1/6*(m1+m2+m3+m4+m5+m6)
    Cx1=C1+M20/12*44;
    hold on 
    M21=(1-s)*x.*CM*1/2*(m1+m2+m3+m4+m5+m6)
    Cx2=C1+M21/12*44;
    plot(x, Cx2, 'linewidth', 1.2, 'markerfacecolor', [36, 169, 225]/225)
   hold on 
    M22=(1-s)*x.*CM*1/4*(m1+m2+m3+m4+m5+m6)
    Cx3=C1+M22/12*44;
    plot(x, Cx3, 'linewidth', 1.2, 'markerfacecolor', [36, 169, 225]/225)
    hold on 
    M23=(1-s)*x.*CM*1/8*(m1+m2+m3+m4+m5+m6)
    Cx4=C1+M23/12*44;
    plot(x, Cx4, 'linewidth', 1.2, 'markerfacecolor', [36, 169, 225]/225)
    hold on 
    M24=(1-s)*x.*CM*1/16*(m1+m2+m3+m4+m5+m6)
    Cx5=C1+M24/12*44;
    plot(x, Cx5, 'linewidth', 1.2, 'markerfacecolor', [36, 169, 225]/225)
    hold on 
    M25=(1-s)*x.*CM*1/32*(m1+m2+m3+m4+m5+m6)
    Cx6=C1+M25/12*44;
    plot(x, Cx6, 'linewidth', 1.2, 'markerfacecolor', [36, 169, 225]/225)
    hold on 
    M26=(1-s)*x.*CM*1/14*(m1+m2+m3+m4+m5+m6)
    Cx7=C1+M26/12*44;
    plot(x, Cx7, 'linewidth', 1.2, 'markerfacecolor', [36, 169, 225]/225)
    hold on
xlabel('Propotion')
ylabel('Carbon Sequestration (tons)')
legend('Softwood Lumber','Hardwood Lumber','Softwood Plywood',
'Oriented Strandboard','Non-structural Panels','Miscellaneous 
Products','Paper')
set(gca, 'linewidth', 1.2, 'fontsize',12, 'fontname', 'times')