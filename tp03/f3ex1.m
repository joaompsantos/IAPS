% Folha 3 - Ex1 
ext='*.jpg';
list = dir(ext);
samples = cell(1,length(list));
for i=1:length(list)
     samples{i} = imread(list(i).name);
     fprintf('Imagem: %10s -> %7d bytes\n',list(i).name, list(i).bytes);
end;

% a)
% fotos RGB

% b)
display('Press key to continue!');
figure('Name','Tp 3 - Ex1 - Layers','NumberTitle','off');
for i=1:length(list);
    layers = size(size(samples{i}));
    if (layers(2)==3)         
           img.colorA = samples{i}(:,:,1);           
           img.colorB = samples{i}(:,:,2);
           img.colorC = samples{i}(:,:,3);
           subplot(2,2,1);
           imshow(samples{i});
           title('Original');
           subplot(2,2,2);
           imshow(img.colorA);
           title('Red');
           subplot(2,2,3);
           imshow(img.colorB);
           title('Green');
           subplot(2,2,4);
           imshow(img.colorC);
           title('Blue');
           pause;
           
     end; 
end;
close(figure(1));

% c)
figure('Name','Tp 3 - Ex1 - Tons de Cinzento','NumberTitle','off');
for i=1:length(list);
    layers = size(size(samples{i}));
    if (layers(2)==3)
           img.gray = uint8(0.299.*double(samples{i}(:,:,1))+0.587.*double(samples{i}(:,:,2))+0.144.*double(samples{i}(:,:,3))); 
           subplot(1,2,1);
           imshow(samples{i});
           str = [list(i).name  ' - Original']; 
           title(str);
           subplot(1,2,2);
           imshow(img.gray);
           str = [list(i).name  ' - Tons de Cinzento'];
           title(str);
           pause;
     end; 
end;
close(figure(1));

% d)
figure('Name','Tp 3 - Ex1 - Negativos','NumberTitle','off');
for i=1:length(list);
    layers = size(size(samples{i}));
    if (layers(2)==3)
           img.neg = uint8(-1*(double(samples{i})-255));
           subplot(1,2,1);
           imshow(samples{i});
           str = [list(i).name  ' - Original']; 
           title(str);
           subplot(1,2,2);
           imshow(img.neg);
           str = [list(i).name  ' - Negativo'];
           title(str);
           pause;
     end; 
end;
close(figure(1));

