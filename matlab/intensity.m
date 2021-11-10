clearvars 
close all 
clc

img = imread('rice.png');
%img = double(img);

a = 88; %min(img(:));
b = 117; %max(img(:));

transformed = transform_intensity(img, a, b);

figure
subplot(1, 2, 1), imshow(img);
title('Original Image');
subplot(1, 2, 2), imshow(transformed);
title('Transformed Image');

% Function to play with the intensity of the  image
function transformed = transform_intensity(img, a, b)
    imgsize = size(img);
    transformed = img;
    for i = 1:imgsize(1) 
        for j = 1:imgsize(2)
           px = transformed(i,j);
           if(px < a )
               px = 0;
           elseif(px > b)
               px = 255;
           else
               px = 255 * ((px - a) / (b - a));
           end
           transformed(i,j) = px;
        end
   end
end
