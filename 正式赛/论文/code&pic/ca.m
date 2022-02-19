close;clear;clc;n = 300;     %Cell matrix size
Plight = 0.1; Pgrowth = 0.0027;UL = [n 1:n-1];DR = [2:n 1];
veg = zeros(n,n);        %Initialization
imh = image(cat(3,veg,veg,veg));
m=annotation('textbox',[0.1,0.1,0.1,0.1],'LineStyle','-','LineWidth',2,'String','123');
for i = 1:100000
    sum = (veg(UL,:) == 1) + (veg(:,UL) == 1) + (veg(DR,:) == 1) + (veg(:,DR) == 1);
    %Update the fungus matrix according to the rules: fungi = fungi-reduced fungi + new fungi
    veg = 2 * (veg == 2) - ( (veg == 2) & (sum > 0 | (rand(n,n) < Plight)) ) + 2 * ( (veg == 0) & rand(n,n) < Pgrowth);
    a=find(veg==2);b=find(veg==1);aa=length(a);funginumber=length(b);
    fungi(i)=aa;
    livingenvironment(i)=funginumber*30;
    if (funginumber>=0&&funginumber<=10) str1='Tree grows normally';
    elseif (funginumber>10&&funginumber<=100) str1='Tree living environment index changes';
    elseif (funginumber>100) str1='Number of tree decreases';
    end
    if ((aa>40000)||(funginumber>=10)) str2='Trees decrease sharply';
    elseif (aa>30000&&aa<=40000) str2='Trees decrease';
    elseif (aa>20000&&aa<=30000) str2='Trees begin to decrease';
    elseif (aa>=0&&aa<=20000) str2='Trees continue to increase';
    end 
    % str=[]
    set(imh, 'cdata', cat(3, (veg == 1), (veg == 2), zeros(n)) )
    drawnow;figure(2);delete(m);plot(fungi);
    hold on
    plot(livingenvironment);
    legend(['Number of trees',num2str(aa)],['Living environment index',num2str(funginumber)]);
    title(['Time T=',num2str(i),'years']);
    % m=annotation('textbox',[0.15,0.8,0.1,0.1],'LineStyle','-','LineWidth',2,'String',str);
    hold off
    %pause(0.2)
end