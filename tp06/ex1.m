%----------------%
% Folha 6 - Ex 1 % 
%----------------%

% Set Environtment
close all; clear; clc

% EX 1 %

DTMF = startDTMF();

Fa = 8000;     % Sample Frequency
T  = 0.1;      % sample Time
N  = T*Fa;
n  = 0:N-1;
Np = 1/2*T*Fa;
np = 0:Np-1;

in = inputdlg('Enter number: ','Dialer');
code = num2str(in{1});


for i=1:length(code)
    idx = find([DTMF.S]==code(i));
    tones(i).F1 = DTMF(idx).F1;
    tones(i).F2 = DTMF(idx).F2;
end


dtm = cell(1,length(code));

for i=1:length(tones)
    dtm{i} = 2*(sin(2*pi*tones(i).F1/Fa*n)+sin(2*pi*tones(i).F2/Fa*n));
    
end

interval = zeros(1,Np);
dialer=0;

for i=1:length(code)
    dialer = [dialer dtm{i}];
    dialer = [dialer interval];
end


% b)
noise  = -0.5 + (1).*rand(1,length(dialer));

%dialer = dialer + noise;

Ed = sum(abs(dialer).^2);
Er = sum(abs(noise).^2);
SNR=10*log10(Ed/Er)

% c)

% smaller freq jump
%  770 Hz
% -697 Hz
%-----
%  073 Hz
%
% Fa/N < 73Hz
% 
% Com ruído é necessário usar uma resolução menor.


sound(dialer, Fa);



%df = (0:110-1)*Fa/110;

%D = fft(dialer(1:110));    % Generic D=abs(fft(dialer(I:I+110-1))); I -> indice de cada digito

%stem(df,abs(D),'.');
