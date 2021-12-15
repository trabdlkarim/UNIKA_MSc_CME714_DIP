clearvars
clc
close all

I = imread('eight.tif');
N = imnoise(I, 'salt & pepper', 0.02);

% Defining the 9 point smoothing kernel of the filter
kernel = ones(3);
kernel(2,2) = 2*kernel(2,2);
kernel = kernel/sum(kernel, 'all');

O = meanfilter(N, kernel);

figure;
subplot(1,2,1), imshow(N);
title('Noisy Image');
subplot(1,2,2), imshow(O);
title('Filtered Image');