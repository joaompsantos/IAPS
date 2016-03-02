function [xq] = quantiaps( x, b, Amax, Amin)
%QUANTIAPS Quantização de um sinal
% x -> sinal
% b -> nº de bits
% Amax, Amin -> Amplitude do Sinal
d = (Amax-Amin)/(2^b);     % delta = (Amax-Amin)/(2^b-1), b-> nº de bits, Amax,Amin->amplitude sinal original
xq = round(x/d)*d;         % ajustar amplitude 
xq (xq==1)=1-d;
end

%Teste 
%x=linspace(-1,1,1000);
%xq=quantiaps(x)
%figure(1)
%plot(x,xq)
%
%
%
%
%
%