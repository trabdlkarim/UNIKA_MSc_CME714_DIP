clearvars
original = imread('eight.tif');
noisy = imnoise(original, 'salt & pepper', 0.2);

mask = ones(3);
for i = 1:3
    for j=1:3
        mask(i,j) = gaussian(i,j); 
    end
end
mask = 1 / sum(mask, 'all') * mask;

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
        
        new_pixel = sum(sum(roi.*mask, 'double'));
        filtered(i,j) = fix(new_pixel);
    end
end

figure
subplot(1, 2, 1), imshow(noisy);
title('Noisy Image');
subplot(1, 2, 2), imshow(filtered);
title('Gaussian Filtered Image');