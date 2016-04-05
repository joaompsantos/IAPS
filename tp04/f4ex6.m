%---------------%
% Folha 4 - Ex6 % 
%---------------%
clear; clc;
figure('Name','Tp 4 - Ex 6','NumberTitle','off');

omega = linspace(0,2*pi,1000); 
h1    = [1/2  1/2];
h2    = [1/2 -1/2];

ext = '*.wav';
list = dir(ext);
samples = cell(1,length(list));
[sample Fa] = audioread(list(1).name);

L = length(sample);
t = linspace(0,L/Fa,L);

H1 = freqresp(h1, omega);
H2 = freqresp(h2, omega);


y1 = conv(sample(:,1), h1);
y2 = conv(sample(:,1), h2);

subplot(4,1,1);
plot(omega,abs(H1));
title('Resposta em Frequência H1');

subplot(4,1,2);
plot(t,y1(1:length(t)));
title('Sinal filtrado com h1');

subplot(4,1,3);
plot(omega,abs(H2));
title('Resposta em Frequência H2');

subplot(4,1,4);
plot(t,y2(1:length(t)));
title('Sinal filtrado com h2');

% filtro passa baixo - som abafa

% filtro passa alto - som estridente

%sound(ys,Fa);