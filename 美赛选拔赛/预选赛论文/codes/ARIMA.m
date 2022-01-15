clc;
clear;
data = textread('conservation_1.txt');
data=nonzeros(data');     
% Remove the zero elements in the order of the original data
r11=autocorr(data);        
% Calculate the self correlation coefficient
r12=parcorr(data);     
% Calculate partial correlation coefficient
figure
subplot(211),autocorr(data);
subplot(212),parcorr(data);    
% The autocorrelation and partial autocorrelation 
%of the original data are drawn on a graph
diff=diff(data);     
% R11 is positive, not controlled by a negative exponential, 
%so calculate the first order difference
r21=autocorr(diff);      
% Calculate the self correlation coefficient
r22=parcorr(diff);        
% Calculate the partial correlation coefficient
adf=adftest(diff);    
% If adf == 1, stable time sequence
figure
subplot(211),autocorr(diff);
subplot(212),parcorr(diff);       
% Plot on the same figure, stable time sequence
n=length(diff);       
% Caculate the differencial data
k=0;
  for i = 0:3
    for j = 0:3 
        if i == 0 & j == 0
            continue
        elseif i == 0
            ToEstMd = arima('MALags', 1:j, 'Constant', 0); 
        elseif j == 0
            ToEstMd = arima('ARLags', 1:i, 'Constant', 0); 
        else
            ToEstMd = arima('ARLags', 1:i, 'MALags', 1:j, 'Constant', 0);    
            % Model structure
        end
        k = k + 1;
        R(k) = i;
        M(k) = j;
        [EstMd,EstParamCov,LogL,info] = estimate(ToEstMd,diff);   
        % Fitness, and estimate model parameter
        numParams = sum(any(EstParamCov));
        [aic(k), bic(k)] = aicbic(LogL,numParams,n);
    end
end
fprintf('R, M, AIC, BIC value: \n%f');
check  = [R',M',aic',bic'];
res=infer(EstMd,diff);       
% Verification
figure
subplot(2,2,1)
plot(res./sqrt(EstMd.Variance))     
% Standardlized residual
title('Standardized Residuals')
subplot(2,2,2),qqplot(res)      
% Fit the hypothesis of normality
subplot(2,2,3),autocorr(res)
subplot(2,2,4),parcorr(res)


% The autocorrelation coefficient rapidly decreases to 0 after 1 order lag, 
% and the partial correlation coefficient 
%is the same as the self correlation coefficient, 
% so p = 1, q = 1
p=input('p = ');
q=input('q = ');
ToEstMd=arima('ARLags', 1:p, 'MALags', 1:q, 'Constant', 0); 
 [EstMd, EstParamCov, LogL, info] = estimate(ToEstMd, diff);
 dx_forest = forecast(EstMd, 20, 'Y0', diff);       % 20 years prediction
 x_forest = data(end)+cumsum(dx_forest)
figure
h4 = plot(data, 'b');
hold on
h5 = plot(length(data)+1: length(data)+20, x_forest, 'r', 'LineWidth', 2);
title('ARIMA Sequence Prediction of Conservation 1')
xlabel('Year(since 1992)')
ylabel('Number of Yangtze Finless Porpoises')
hold off
