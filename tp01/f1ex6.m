% Folha 1 - Ex6
x = linspace(-5, 5, 1000);
y = @(x) (sin(pi*x))./(pi*x);
r = zeros(1,1);
for i = 1:length(x)
    k = x(i);
    if (y(k)==0)
        r(end+1) = k;
    end        
end
z = zeros(1,length(r));
hold on;
plot(x,y(x));
plot(r,z);
grid on
