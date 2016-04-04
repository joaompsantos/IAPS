% Folha 4 - Ex3

omega = [0 pi/4 pi/2 3*pi/4 pi];

n= 0:1:49;
respc = zeros(1,length(n));

for i=1:length(omega)

    x = exp(1i*omega(i)*n);
    y = conv(x,[0.5 -0.5]);
    c = y(1:(end-1))./x;
    
    respc(1:end) = abs(1/2*exp(1i*omega(i))+1/2);
    
    
    subplot(4,1,1); 
    plot(n,real(x) );           % sinal
    legend('x(n)');
       
    subplot(4,1,2);
    plot(n,real(y(1:end-1)));   % resposta
    legend('y=H[x(n)]');
    amp = abs(y);
    title(sprintf('Amplitude= %.2f', amp(25)));
   
    subplot(4,1,3);
    plot(n,real(c));            %resposta a e^johm
    legend('[y/x](n)');
    amp = abs(c);
    title(sprintf('Amplitude= %.2f', amp(25)));
    axis([0 40 0 1]);
    
    subplot(4,1,4);
    plot(omega, real(1/2*exp(-1i.*omega)+1/2));
    legend('H[e^jw]');
    
    pause; 
end;
