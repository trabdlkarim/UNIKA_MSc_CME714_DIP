clearvars
original = imread('eight.tif');
noisy = imnoise(original, 'salt & pepper', 0.2);

figure
subplot(1, 2, 1), imshow(original);
title('Original');
subplot(1, 2, 2), imshow(noisy);
title('Noisy');

mask = ones(3);
mask(2, 2) = 2;
mask = 1/9 * mask;

[x, y] = size(original);

for i = 1:x
    for j = 1:y
        
    end
end