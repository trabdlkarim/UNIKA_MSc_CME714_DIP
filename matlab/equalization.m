clearvars 
close all 
clc
import utils.frequencies.*
import utils.probabilities.*

img = imread('rice.png');
%img = rgb2gray(img);
eq_img = histo_equalization(img);

figure
subplot(2, 2, 1), imshow(img);
title('Original Image');
subplot(2, 2, 2), imshow(eq_img);
title('Equalized Image');

subplot(2, 2, 3), imhist(uint8(img));
title('Original Histogram');
subplot(2, 2, 4), imhist(uint8(eq_img));
title('Equalized Histogram');

 function equalized = histo_equalization(img)
    [x,y] = size(img);
    equalized = img;
    freq = frequencies(img);
    [~, cum_prob] = probabilities(freq);
    %cum_prob=cum_prob./256;
    cum_prob = floor(cum_prob * 255);
    for i = 1:x 
        for j = 1:y
            val = img(i,j);
            equalized(i,j) = cum_prob(val+1, 1);
        end
    end
end