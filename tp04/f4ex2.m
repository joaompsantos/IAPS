% Folha 4 - Ex2


% a)
% fa -> 250 Hz
% Ta -> 1/fa = 1/250 = 0.004s

load ecgDrift.txt;

% duração -> nºsamples * Ta
dur = 1/250*length(ecgDrift);
x1 = linspace(0,dur,1000);
hold on;
subplot(2,1,1);
plot(x1,ecgDrift);
title('EcgDrift(fa=250Hz,nºsamples=1000)');
legend('x(n)');

% a)
ecgDrifth3 = conv(ecgDrift,[0.5 -0.5]);
x3 = linspace(0,dur,length(ecgDrifth3));
subplot(2,1,2)
plot(x3,ecgDrifth3);
legend('H3[x(n)]');

% b)
% filtro passa baixo




