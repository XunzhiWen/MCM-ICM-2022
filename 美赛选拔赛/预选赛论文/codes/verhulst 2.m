clc;
clear;
format short g
x0=[2800 2500 2100 1800 1350 1012];
for i=2:6
    x1(1)=x0(1);
    x1(i)= x1(i-1)+x0(i); 
end
for i=1:5
    yn(i)=x0(i+1); 
end
for i=1:5 
    b(i)=(-0.5)*(x1(i)+x1(i+1)); 
end
for i=1:5
    B(i,1)=b(i); 
    B(i,2)=1; 
end
c=inv(B'*B)*B'*yn' 
a=c(1,1) 
u=c(2,1) 
for t=1:6
    x11(t) = u/a + exp(-a*t) * (-u+ 2800*a) / a;
end
x11 
syms t
X=u/a+exp(-a*t)*(-u+2800*a)/a;
C=1:15; 
y=subs(X,t,C)

z2022=y(2)-y(1)
z2027=y(3)-y(2) 
z2032=y(4)-y(3)
z2037=y(5)-y(4) 
z2042=y(6)-y(5) 
z2047=y(7)-y(6) 
z2052=y(8)-y(7)
z2057=y(9)-y(8)
z2062=y(10)-y(9)
z2067=y(11)-y(10)
z2072=y(12)-y(11)
z2077=y(13)-y(12)
z2082=y(14)-y(13)





