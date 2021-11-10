clearvars 
close all 
clc

img = imread('assets/sudoku.png');
%img = double(img);

a = 88; %min(img(:));
b = 117; %max(img(:));

transformed = enhance_contrast(rgb2gray(img), a, b);

figure
subplot(1, 2, 1), imshow(img);
title('Original Image');
subplot(1, 2, 2), imshow(transformed);
title('Contrasted Image');

% Variant of the intensity transformation by enhancing the
% contrast of the given image
function contrasted = enhance_contrast(img, a, b)
    imgsize = size(img);
    contrasted = img;
    for i = 1:imgsize(1) 
        for j = 1:imgsize(2)
           px = contrasted(i,j);
           if(px <= a )
               px = (b/a) * px;
           else
               px = (((255-b)*px) + (255*(b - a)))/(255-a);
           end
           contrasted(i,j) = px;
        end
   end
end
