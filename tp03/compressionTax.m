function [ Tax ] = compressionTax( Toriginal, Tcompressed)
%COMPRESSIONTAX -> Return compression tax
    Tax = (Toriginal/Tcompressed) * 100;
    
end

