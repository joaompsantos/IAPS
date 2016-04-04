% Folha 4 - Ex1

% a)
% fa -> 250 Hz
% Ta -> 1/fa = 1/250 = 0.004s

load ecg1.txt;

% duração -> nºsamples * Ta
dur = 1/250*length(ecg1);
x1 = linspace(0,dur,1000);
hold on;
subplot(3,1,1);
plot(x1,ecg1);
title('Ecg1(fa=250Hz,nºsamples=1000)');
legend('x(n)');

% encontrar bpm
bpm = 60/dur*histc(ecg1,1);
te = 60/bpm;
fprintf('Duração do Sinal -> %2.2fs;\nTe -> %.1d;\nBPM -> %3d;\n', double(dur),te,bpm);

% b)
ecg1h1 = conv(ecg1,[0.5 0.5]);
n = linspace(0,dur,length(ecg1h1));
subplot(3,1,2);
plot(n,ecg1h1,'r');
legend('H1[x(n)]');
% c)
ecg1h2 = conv(ecg1,[0.25 0.25 0.25 0.25]);
n = linspace(0,dur,length(ecg1h2));
subplot(3,1,3);
plot(n,ecg1h2,'b');
legend('H2[x(n)]');
