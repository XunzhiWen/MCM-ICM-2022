clc;
clear;
x = [1992, 2002, 2005, 2007, 2015, 2021]    % Year
y = [5, 20, 25, 30, 57, 101]    % Number of Yangtze Finless Porpoises
xi = 1992:1:2022    % Prediction
yi = lagrange(x, y, xi)     % Lagrange Interpolation
plot(x, y, 'o', xi, yi, 'k')
title('Lagrange Interpolation Conservation 1')
xlabel('Year')
ylabel('Number of Yangtze Finless Porpoises')