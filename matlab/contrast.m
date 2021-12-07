clearvars 
close all 
clc

img = imread('assets/sudoku.png');
img = rgb2gray(img);

a = 160; %min(min(img));
b = 200; %max(max(img));

transformed = enhance_contrast(img, a, b);

figure
subplot(2, 2, 1), imshow(img);
title('Original Image');
subplot(2, 2, 2), imshow(transformed);
title('Contrasted Image');
subplot(2, 2, 3), imhist(img);
title('Original Histogram');
subplot(2, 2, 4), imhist(transformed);
title('Contrasted Histogram');

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
           contrasted(i,j) = round(px);
        end
   end
end
