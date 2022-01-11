clearvars

original = imread('eight.tif');
noisy = imnoise(original, 'salt & pepper', 0.02);
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
        mask = noisy(i-1:i+1, j-1:j+1);
        [min,max] = minmax(mask);
        new_pixel = minmaxfilt(filtered(i,j), min, max);
        filtered(i,j) = new_pixel;
    end
end

figure
subplot(1, 2, 1), imshow(noisy);
title('Noisy Image');
subplot(1, 2, 2), imshow(filtered);
title('Min/Max Filtered Image');