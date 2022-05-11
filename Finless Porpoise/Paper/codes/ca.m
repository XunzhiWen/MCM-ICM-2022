close;
clear;
clc;
n = 83;     % Porpoise population size
Plight = 0.09; 
Pgrowth = 0.0008;
UL = [n1:n-1];
DR = [2:n1];
veg = zeros(n,n);        %Initialization
im = image(cat(3,veg,veg,veg));
mannual = annotation('textbox',[0.1,0.1,0.1,0.1],'LineStyle','-','LineWidth',2,'String','123');
for i = 1 : 20
    sum = (veg(UL,:) == 1) + (veg(:,UL) == 1) + (veg(DR,:) == 1) + (veg(:,DR) == 1);
    % Update the porpoise matrix according to the rules: 
    % porpoise = porpoise - reduced porpoise + new porpoise
    veg = 2 * (veg == 2) - ( (veg == 2) & (sum > 0 | (rand(n,n) < Plight)) ) + 2 * ( (veg == 0) & rand(n,n) < Pgrowth);
    % The meaning of value of veg:
    % empty == 0
    % dying == 1
    % living == 2
    living = find(veg == 2);
    dying = find(veg == 1);
    l_number=length(living);
    number=length(dying);
    Yangtzeporpoise(i) = l_number;
    livingenvironment(i)=number * 1000;
    if (number>=0&&number<=10) 
        str1='Porpoise increases';
    elseif (number>10&&number<=100) 
        str1='Environment index changes';
    elseif (number>100) 
        str1='Porpoise decreases';
    end
    if ((l_number>40000)||(number>=10)) str2='Porpoise decreases sharply';
    elseif (l_number>30000&&l_number<=40000) str2='Porpoise decreases';
    elseif (l_number>20000&&l_number<=30000) str2='Porpoise begins to decrease';
    elseif (l_number>=0&&l_number<=20000) str2='Porpoise continues to increase';
    end 
    str=[str1 10 str2];
    set(im, 'cdata', cat(3, (veg == 1), (veg == 2), zeros(n)) )
    drawnow;figure(2);delete(mannual);plot(Yangtzeporpoise);
    hold on
    plot(livingenvironment);
    legend(['Porpoise',num2str(l_number)],['Living environment index',num2str(number)]);
    title(['Time T=',num2str(i),'years']);
    mannual = annotation('textbox',[0.15,0.8,0.1,0.1],'LineStyle','-','LineWidth',2,'String',str);
    hold off
    % pause(0.0001)
end

