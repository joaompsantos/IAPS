%----------------%
% Folha 6 - Ex 2 % 
%----------------%

% Set Environtment
close all; clear; clc

%% a)

load dtmf2.txt

Fs   = 8000;
N    = length(dtmf2);
L    = N/Fs;

Ndigito   = 700;
Npausa   = 300;
Ndelay = 150;
Nd = 4;

%sound(dtmf2,Fs);

dt=0:L/N:L-L/N;
plot(dt,dtmf2);
xlabel('t(s)');
grid on;



pause,close 

interval = (Npausa)/Fs;
digit    = (Ndigito)/Fs;

fprintf('Duração Sinal: %.3fs\n',L);
fprintf('Duração Digito: %.3fs\n',digit);
fprintf('Duração Separação: %.3fs\n',interval);

DTMF = startDTMF();

%% b)

dtmf2c = dtmf2(Ndelay:end-Ndelay);
res = Fs/Ndigito;


for i=1:Nd
    k     = i-1;
    xd    = abs(fft(dtmf2c(1+k*Npausa+k*Ndigito:i*Ndigito+k*Npausa)));
    xd(1) = 0;
    [pks lcts] = findpeaks(xd,'SortStr','descend','NPEAKS',3);
    lcts = sort(lcts);  
    
    F1(i) = round((lcts(1))*res);
    F2(i) = round((lcts(2))*res);

end

sequence = findDTone(DTMF, F1,F2 );
fprintf('Sequence: %s\n',sequence(:));


%% c)

DTMF2=fft(dtmf2);
DTMF2(1)=0;

res = Fs/N;
df=0:res:Fs-res;
dtf = [697 941 1209 1633];
idx = zeros(1,length(dtf));
DTMF2_N = DTMF2;

for k=1:length(dtf)
    idx(k)= int64(dtf(k)/res)-1;    
end;

% 
DTMF2_N(1:idx(1))=0;
DTMF2_N(idx(2):idx(3))=0;
DTMF2_N(idx(3):N-(idx(3)-2))=0;
DTMF2_N(N-(idx(3)-2):N-(idx(2)-2))=0;
DTMF2_N(N-(idx(1)-2):end)=0;

dtmf2_n=ifft(DTMF2_N);
subplot(2,2,1);
plot(dt,dtmf2);
xlabel('t(s)');


subplot(2,2,2);
plot(df,DTMF2);
xlabel('f(Hz)');

subplot(2,2,3);
plot(dt,dtmf2_n);
xlabel('t(s)');


subplot(2,2,4), plot(df,DTMF2_N), xlabel('f(Hz)');

pause, close
