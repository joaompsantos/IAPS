% Folha 1 - Ex 8
figure('Name','Tp 1 - Ex 8','NumberTitle','off');
t = linspace( 0, 3, 1000);
m = [2 4 10 50 100];
s = zeros(1, length(t));
for i = 1:length(m)
    subplot( length(m), 1, i);
    for k = 1:m(i)
        sinal = @(t,k) 4/(pi*(2*k-1))*sin(2*pi*(2*k-1)*t);
        s = s + sinal( t, k);
    end
    plot(t,s);
    str = sprintf('Plot with M = %d',m(i));
    title(str);
    s = zeros(1, length(t));
end

%A medida que M aumenta o sinal tende para um sinal igual ao do exercicio5