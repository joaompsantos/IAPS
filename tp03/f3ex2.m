% Folha 3 - Ex2
ext='*.jpg';
list = dir(ext);
samples = cell(1,length(list));
for i=1:length(list)
     samples{i} = imread(list(i).name);
     fprintf('Imagem: %10s -> Toriginal: %6d; Tcomprimido: %6d; Taxa de compressão: %2.2f\n',list(i).name,prod(size(samples{i})),list(i).bytes, compressionTax(prod(size(samples{i})),list(i).bytes));
end;