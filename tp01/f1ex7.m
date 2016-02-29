% Folha 1 - Ex 7
figure('Name','Tp 1 - Ex 7','NumberTitle','off');
t = linspace( 0, 3, 1000);
s = zeros( 1,length(t));
for k = 1:3
    x = @(t,k) 4/(pi*(2*k-1))*sin(2*pi*(2*k-1)*t);
    subplot(4,1,k);
    plot(t,x(t,k));
    s = s + x( t, k);
    str = sprintf('Plot with k = %d',k);
    title(str);
end
subplot(4,1,4);
plot(t,s);
str = sprintf('Sum');
title(str);
