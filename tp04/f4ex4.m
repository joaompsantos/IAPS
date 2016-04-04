%---------------%
% Folha 4 - Ex4 % 
%---------------%
clear; clc;
figure('Name','Tp 4 - Ex 4','NumberTitle','off');

% a)
n = 0:49;
w = linspace(0,2*pi,256);   % frequencia angular rad/s

rh1 = 1/2+1/2*exp(-1i*w);   % calculado analiticamente
rh3 = 1/2-1/2*exp(-1i*w);   

subplot(5,2,1);
plot(w,abs(rh1));    % w = 2pif <=> f = 2/2pi
grid on;
title('H1(e^ jw) -> módulo');
xlabel('rads');

subplot(5,2,2);
plot(w,angle(rh1));  % w = 2pif <=> f = 2/2pi
grid on;
title('H1(e^ jw) -> fase');
xlabel('rads') 

subplot(5,2,3);
plot(w,abs(rh3));    % w = 2pif <=> f = 2/2pi
grid on;
title('H3(e^ jw) -> módulo');
xlabel('rads') 

subplot(5,2,4);
plot(w,angle(rh3));  % w = 2pif <=> f = 2/2pi
grid on;
title('H3(e^ jw) -> fase');
xlabel('rads')

% b)
wf= pi/4;
x= sin(wf*n);


subplot(5,2,[5 6]);
plot(n,x);
legend('sin(wt)');
xlabel('t/s') 
grid on;

rsin = conv(x, [0.5 0.5]);
subplot(5,2,[7 8]);
plot(n,rsin(1:length(n)));
legend('H1[sin(wt)]');
xlabel('t/s') 
grid on;



rsin = conv(x, [0.5 -0.5]);
subplot(5,2,[9 10]);
plot(n,rsin(1:length(n)));
legend('H3[sin(wt)]');
xlabel('t/s') 
grid on;

% H3 -> passa alto




