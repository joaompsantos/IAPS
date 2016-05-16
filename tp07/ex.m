%---------%
% Folha 7 % 
%---------%

% Set Environtment
close all; clear; clc

%% 1) %%

x = load('mistura1.txt');

Fa   = 22050;        % Sampling Frequency
N    = length(x);    % Number of Samples
L    = N/Fa;         % Signal Duration 
T    = L/N;          % Sampling Time
Fp   = 4000;         % Carrier Frequency

dt   = 0:T:L-T;      % Time Vector
%plot(dt, x);

df = Fa/N;
f   = 0:df:Fa-df;

X = fft(x);
%stem(abs(X),'.');

% Ecg-> F<500Hz -> Get Frequencys lower than 500Hz
idx = 500/df+1;   % Find 500Hz index
ECG = zeros(N,1);
ECG(1:idx) = X(1:idx);
ECG(N-idx-2:end)=X(N-idx-2:end);

ecg = ifft(ECG);

% plot(dt,real(ecg)); % used real() to supress complex warnings
% grid on;
nbeats=length(findpeaks(abs(ecg),Fa,'MinPeakHeight',max(abs(ecg))*0.8));    % used real() to supress complex warnings
bpm = (60/L)*nbeats;
fprintf('BPM: %d\n',bpm);

%% 2) %%

idx = Fp/df+1;
w_X = angle(X);
wFp   = w_X(idx)*180/pi;    % pi/3

%% 3) %%
AUDIO_M=X;
AUDIO_M(f<500 | f>21550)=0; 

audio_m = ifft(AUDIO_M);

z = audio_m.*cos(2*pi*Fp/Fa*(N-1)+wFp*pi/180);

Z = fft(z);
Z(f>3000 & f<(Fa-3000))=0;

audio = ifft(Z);
plot(audio);
sound(audio,Fa);

%% 4)
w = [-pi/6 0 pi/6 pi/4];

for i=1:length(w);
    z = audio_m.*cos(2*pi*Fp/Fa*(N-1)+w(i));
    Z = fft(z);
    stem(f,abs(Z));
    xlabel('f(Hz)');
    ylabel('Z');
    Z(f>3000 & f < (Fa-3000))=0;
    audio= ifft(Z); 
    sound(audio,Fa); 
    pause
end;

% Sound intensity change with phase 

