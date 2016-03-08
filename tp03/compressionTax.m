function [ Tax ] = compressionTax( Toriginal, Tcompressed)
%COMPRESSIONTAX -> Return compression tax
    Tax = (Tcompressed/Toriginal) * 100;
    
end

