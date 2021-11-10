clearvars 
close all 
clc
import utils.frequencies.*
import utils.probabilities.*

img = imread('assets/sudoku.png');
eq_img = histo_equalization(rgb2gray(img));

figure
subplot(1, 2, 1), imshow(img);
title('Original Image');
subplot(1, 2, 2), imshow(eq_img);
title('Equalized Image');


function equalized = histo_equalization(img)
    [x, y] = size(img);
    equalized = img;
    freq = frequencies(img);
    [~, cum_prob] = probabilities(freq);
    cum_prob = round(cum_prob * 1);
    for i = 1:x 
        for j = 1:y
            p = equalized(i,j);
            equalized(i,j) = cum_prob(p+1, 1);
        end
    end
end