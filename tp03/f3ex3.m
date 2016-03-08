% Folha 3 - Ex3
ext='*.jpg';
list = dir(ext);
samples = cell(1,length(list));
figure('Name','Tp 3 - Ex 3','NumberTitle','off');
for i=1:length(list)
     samples{i} = imread(list(i).name);
     if(strcmp(list(i).name,'lena.jpg') == 1)
         bits =[7 5 4 3];
         subplot(2,3,1)
         imshow(samples{i});
         str=sprintf('8 bits-Tx: %2.2f\n', compressionTax(prod(size(samples{i})),list(i).bytes));
         title(str);
         quantimg = cell(1,length(bits));
         ruido = cell(1,length(bits));
         for k=1:length(bits)
            subplot(2,3,k+1);
            quantimg{k} = quantrgbimg(list(i),bits(k));
            imshow(quantimg{k});
            ruido{k} = uint8(double(samples{i})-double(quantimg{k}));
            %%%%%%%%DEBUG ONLY%%%%%%%%%%%
            % fprintf('Size-> %6d; List.bytes-> %d;\n', prod(size(quantimg{k}))*bits(k)/8,list(i).bytes);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            str=sprintf('%d bits-Tx: %2.2f\n', bits(k), compressionTax(prod(size(quantimg{k}))*bits(k)/8,list(i).bytes));
            title(str);
         end;
         
         snr=zeros(1,length(bits));
         
         for k=1:length(bits)
             energia_r = sum(sum((ruido{k}).^2));
             energia_s = sum(sum((samples{i}).^2));
             snr(k)=10*log10(energia_s/energia_r);
         end;
         
         subplot(2,3,6);
         plot(snr, bits);
         title('SNR');
         
     end;    
end;