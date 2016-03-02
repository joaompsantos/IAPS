% Folha 2 - Ex2
% a)
figure('Name','Tp 2 - Ex 2','NumberTitle','off');
subplot(3,1,1);
x = linspace(0, 0.1, 1000);
y = sin(2*pi*50*x+pi/3);
hold on;

y4 = quantiaps(y,4,1,-1);
plot(x,y,x,y4);
grid on;

% b)
r4=y-y4;    % ruido = original - arredondado
plot(x,r4);
energia_r4=sum((r4).^2);
legend('Sinal Orirginal','Sinal Arredondado(4 bits)','Ruido (4 bits)');
fprintf('Energia Ruido (4 bits): %f\n',energia_r4);


% RUIDO(BITS) %
bits = [2 4 6 8 10];
sinals = cell(1,length(bits));
errors = cell(1,length(bits));
snr = cell(1,length(bits));
for i=1:length(bits)
    sinals{i} = quantiaps(y,bits(i),1,-1);
    errors{1} = sinals{i}-y;
    energia_r = sum((errors{i}).^2);
    energia_s = sum((sinals{i}).^2);
    snr{i}=10*log10(energia_s/energia_r);
    fprintf('Energia Ruido (%d bits): %f\n',bits(i),energia_r);
    fprintf('SNR (%d bits): %f\n',bits(i),snr{i});

end;
subplot(3,1,2);
hold on;
grid on;
h = plot(2,snr{1},'.-',4,snr{2},'.-',6,snr{3},'.-',8,snr{4},'.-',10,snr{5},'.-');
set(h,'Marker','square');
plot(bits,6.02*bits);
legend('SNR 2 bits','SNR 4 bits','SNR 6 bits','SNR 8 bits','SNR 10 bits','SNR=6.02b');

% e)
% 6.02b %
subplot(3,1,3);
hist(y);
legend('Histograma do sinal');