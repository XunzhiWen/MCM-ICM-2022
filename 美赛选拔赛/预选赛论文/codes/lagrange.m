function yy=lagrange(x,y,xx)    % Lagrange Function
m = length(x);
n = length(y);
if m~= n, error('Length of vector x and y should be the same');
end
s = 0;
for i = 1:n
    t = ones(1,length(xx));
    for j = 1:n
        if j~=i,
            t = t.*(xx - x(j))/(x(i) - x(j))    %Data (x, y) at interpolation point xx
        end
    end
    s = s + t * y(i)
end
yy = s