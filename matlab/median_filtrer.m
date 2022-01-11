clearvars
original = imread('eight.tif');
noisy = imnoise(original, 'salt & pepper', 0.2);

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
        middle = get_median(mask);
        filtered(i,j) = middle; 
    end
end

figure
subplot(1, 2, 1), imshow(noisy);
title('Noisy Image');
subplot(1, 2, 2), imshow(filtered);
title('Median Filtered Image');

function mid = get_median(roi)
vector = reshape(roi, 1, []);
n = numel(vector);
pos = fix(n + 1 / 2);
mid = vector(pos);

if mod(n,2) == 0
    mid = (vector(pos) + vector(pos + 1)) / 2;
end
end