% Folha 2 - Ex 3
figure('Name','Tp 2 - Ex 3','NumberTitle','off');
ext = '*.wav';
list = dir(ext);
samples = cell(1,length(list));
for i=1:length(list)
    samples{i} = audioread(list(i).name);
    x = linspace(0, length(samples{i})/44100,length(samples{i}));
    subplot(length(list),2,2*i-1);
    plot(x,samples{i});
    title(list(i).name);
    hold on;
    subplot(length(list),2,2*i);
    hist(samples{i});
    title(list(i).name);
end;

str = ['Dominio do Tempo: ' list(1).name];
subplot(length(list),2,1);
title(str);

str = ['Dominio da Frequência: ' list(1).name];
subplot(length(list),2,2);
title(str);

%%%%%%%%%%
delta = (1-(-1))/((2^4)-1);       % delta = (Amax-Amin)/(2^b-1), b-> nº de bits, Amax,Amin->amplitude sinal original
y4 = round(samples{7}/delta)*delta;  % ajustar amplitude
sound(y4, 44100);
