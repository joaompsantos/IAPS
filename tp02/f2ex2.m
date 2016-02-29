% Folha 2 - Ex2
% a)
figure('Name','Tp 2 - Ex 2','NumberTitle','off');
subplot(3,1,1);
x = linspace(0, 0.1, 1000);
y = sin(2*pi*50*x+pi/3);
hold on;
% representar em 4 bits -> (2^4)-1 niveis diferentes

delta = (1-(-1))/((2^4)-1);       % delta = (Amax-Amin)/(2^b-1), b-> nº de bits, Amax,Amin->amplitude sinal original
y4 = round(y/delta)*delta;        % ajustar amplitude
plot(x,y,x,y4);
grid on;
% b)
r4=y-y4;    % ruido = original - arredondado
plot(x,r4);
energia_r4=sum((r4).^2);
legend('Sinal Orirginal','Sinal Arredondado(4 bits)','Ruido (4 bits)');
fprintf('Energia Ruido (4 bits): %f\n',energia_r4);
% c)
energia_s4=sum((y4).^2);
snr_4=10*log10(energia_s4/energia_r4);
fprintf('SNR (4 bits): %f\n',snr_4);
% d)
% 6 bits %
delta = (1-(-1))/((2^6)-1);
y6 = round(y/delta)*delta;
r6 = y-y6;
energia_r6=sum((r6).^2);
energia_s6=sum((y6).^2);
snr_6=10*log10(energia_s6/energia_r6);
fprintf('Energia Ruido (6 bits): %f\n',energia_r6);
fprintf('SNR (6 bits): %f\n',snr_6);
% 8 bits %
delta = (1-(-1))/((2^8)-1);
y8 = round(y/delta)*delta;
r8 = y-y8;
energia_r8=sum((r8).^2);
energia_s8=sum((y8).^2);
snr_8=10*log10(energia_s8/energia_r8);
fprintf('Energia Ruido (8 bits): %f\n',energia_r8);
fprintf('SNR (8 bits): %f\n',snr_8);
% 10 bits %
delta = (1-(-1))/((2^10)-1);
y10 = round(y/delta)*delta;
r10 = y-y10;
energia_r10=sum((r10).^2);
energia_s10=sum((y10).^2);
snr_10=10*log10(energia_s10/energia_r10);
fprintf('Energia Ruido (10 bits): %f\n',energia_r10);
fprintf('SNR (10 bits): %f\n',snr_10);
% RUIDO(BITS) %
subplot(3,1,2);
bits = [2 4 6 8 10];
r = [snr_4 snr_6 snr_8 snr_10];
hold on;
grid on;

h = plot(4,snr_4,'.-',6,snr_6,'.-',8,snr_8,'.-',10,snr_10,'.-');
set(h,'Marker','square');
plot(bits,6.02*bits);
legend('SNR 4 bits','SNR 6 bits','SNR 8 bits','SNR 10 bits','SNR=6.02b');
% e)
% 6.02b %
subplot(3,1,3);
hist(6.02.*bits,10);