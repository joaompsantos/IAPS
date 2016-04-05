function [ H ] = freqresp( h,omega )
%freqresp Resposta em Frequencia do Sistema H
%   Input  -> h -> Reposta Impulsional
%             omega -> Frequencia
%   Output -> H -> Resposta em Frequencia


n = 0:length(h)-1;
p = length(omega);


for k=1:p
    
    x = exp(j*omega(k)*n);
    H(k) = h*x';

end;

