% Folha 2 - Ex1 
x = linspace(0, 0.5,100);
y = 1.5*cos(2*pi*5*x)-0.5;        
plot(x,y)
grid on

% a)
%   f0 = 5Hz
%   T0 = 1/5 = 0.2
%
%   Nº Periodos = 0.5/0.2 = 2.5  
% b)
%   %fa = T/N, T-> Intervalo, N-> numero de amostras% 
%
%   fa -> 100 amostras -> 0.5s
%         200 amostras -> 1.0s
%   fa -> 200Hz    
%   
%   Ta -> 1/fa = 1/200 = 0.005
% c)
average_sinal = mean(y);
fprintf('Valor Medio do Sinal: %f \n', average_sinal);
averaget_sinal = -(0.5*0.4+(1.5/sqrt(2)-0.5)*0.1)/0.5;
fprintf('Valor Medio Teórico do Sinal: %f \n', averaget_sinal);
%
% d)

energyt_sinal = quad('(1.5*sin(2*pi*5*x)-0.5).^2',0,0.2);
fprintf('Energia sinal original: %f\n', energyt_sinal);
energyd_sinal = sum(y.^2);
fprintf('Energia sinal apresentado(digital): %f\n', energyd_sinal);
%
%
%