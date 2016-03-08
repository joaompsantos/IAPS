function [ Csize ] = originalSize( img )
%compressedSize Summary of this function goes here
    img = whos('img');
    Csize = img.bytes;
end

