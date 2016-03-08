function [ quantimg] = quantrgbimg( img, bits)
%quantrgbimg Quantiza��o de imagem com b bits
    delta = 255/2^bits;
    img2quant = imread(img.name);
    quantimg  = uint8(round(img2quant/delta)*delta); 
end

