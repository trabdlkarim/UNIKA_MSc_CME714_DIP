clearvars
original = imread('eight.tif');
noisy = imnoise(original, 'salt & pepper', 0.2);

mask = ones(3);
mask(2, 2) = 2;
mask = 1/10 * mask;

[x, y] = size(original);
filtered = noisy;

for i = 1:x
    if i-1  < 1 || i+1 > x
        continue
    end
    for j = 1:y
        if j-1 < 1 || j+1 > y
           continue
        end
        roi = noisy(i-1:i+1, j-1:j+1);
        roi = double(roi);
        
        %new_pixel = sum(sum(roi.*mask, 'double'));
        filtered(i,j) = gaussian(i,j);
        g = gaussian(i,j);
    end
end

figure
subplot(1, 2, 1), imshow(noisy);
title('Noisy Image');
subplot(1, 2, 2), imshow(filtered);
title('Filtered Image');