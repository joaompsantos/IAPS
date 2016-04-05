%---------------%
% Folha 4 - Ex7 % 
%---------------%
clear; clc;
figure('Name','Tp 4 - Ex 7','NumberTitle','off');

omega = linspace(0,2*pi,1000); 
h1    = [1/2 1/2];
h2    = [1/2 -1/2];

ext = '*.wav';
list = dir(ext);
samples = cell(1,length(list));
[sample Fa]= audioread(list(1).name);

H1 = freqresp(h1, omega);
H2 = freqresp(h2, omega);

L = length(sample);
t = linspace(0,L/Fa,L);

hs = conv(h1, h2);
hp = h1 + h2;

ys = conv(sample(:,1), hs);
yp = conv(sample(:,1), hp);

subplot(4,1,1);
plot(omega,abs(H1));
title('Resposta em Frequência H1');

subplot(4,1,2);
plot(omega,abs(H2));
title('Resposta em Frequência H2');

subplot(4,1,3);
plot(t,ys(1:length(t)));
title('Associação em Série');


subplot(4,1,4);
plot(t,yp(1:length(t)));
title('Associação em Paralelo');

% filtro passa baixo - som abafa

% filtro passa alto - som estridente

%sound(ys,Fa);