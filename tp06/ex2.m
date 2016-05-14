%----------------%
% Folha 6 - Ex 2 % 
%----------------%

% Set Environtment
close all; clear; clc

%% a)

load dtmf2.txt

Fa   = 8000;
N    = length(dtmf2);
dur  = N/Fa;

Nd   = 600;
Np   = 400;
Ndelay = 200;
Ndigits = 4;

sound(dtmf2,Fa);

plot(dtmf2);
grid on;


interval = (Ndigits*Np)/Fa/Ndigits;
digit    = (Ndigits*N)/Fa/Ndigits;

DTMF = startDTMF();

%% b)
clc % debug only
dtmf2c = dtmf2(Ndelay:end-Ndelay);

df = (0:600-1)*Fa/Nd;
res = Fa/Nd;

F1 =[];
F2 =[];

for i=1:Ndigits
    k     = i-1;
    xd    = abs(fft(dtmf2c(1+k*Np+k*Nd:i*Nd+k*Np)));
    xd(1) = 0;
    %stem(xd,'.');
    [pks lcts] = findpeaks(xd,'SortStr','descend','NPEAKS',3);
    
    
    if(mod(i,2))
        F1(i) = round((lcts(3))*res);
        F2(i) = round((lcts(1))*res);
    else
        F1(i) = round((lcts(1))*res);
        F2(i) = round((lcts(3))*res);
    end    
end

sequence = findDTone(DTMF, F1,F2 );
fprintf('Sequence: %s\n',sequence(:));


%% c)

DTMF2=fft(dtmf2);
DTMF2(1)=0;

res = Fa/N;

dtf = [697 941 1209 1633];
idx = zeros(1,length(dtf));
DTMF2_N = DTMF2;

for k=1:length(dtf)
    idx(k)= int64(dtf(k)/res);    
end;


DTMF2_N(1:idx(1))=0;
DTMF2_N(idx(2):idx(3))=0;
DTMF2_N(idx(3):N-(idx(3)-2))=0;
DTMF2_N(N-(idx(3)-2):N-(idx(2)-2))=0;
DTMF2_N(N-(idx(1)-2):end)=0;

stem(abs(DTMF2_N),'.');
