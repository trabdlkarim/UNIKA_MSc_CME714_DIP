clearvars

original = imread('eight.tif');
noisy = imnoise(original, 'salt & pepper', 0.2);

mask = ones(3);
sigma = 10;
[x, y] = size(original);
filtered = double(noisy);

for k1 = -1:1
  for k2=-1:1
     mask(k1+2,k2+2) = gaussian(k1,k2, sigma); 
  end
end

for i = 1:x
    if i-1  < 1 || i+1 > x
        continue
    end
    
    for j = 1:y
        if j-1 < 1 || j+1 > y
           continue
        end
        
        roi = noisy(i-1:i+1, j-1:j+1);

        
        mask = double(mask)./sum(sum(mask));
   
        new_pixel = sum(sum(double(roi).*mask));
        filtered(i,j) = new_pixel;
        filtered = uint8(filtered);
    end
end

figure
subplot(1, 3, 1), imshow(noisy);
title('Noisy Image');
subplot(1, 3, 2), imshow(filtered);
title('Gaussian Filtered Image');
subplot(1, 3, 3), freqz2(mask);

function output = gaussian(i,j, sigma)
%GAUSSIAN Summary of this function goes here
%   Detailed explanation goes here
%sigma = 0.8;
output = exp((i^2 + j^2)/2*sigma^2)/(2*pi*sigma^2);
end