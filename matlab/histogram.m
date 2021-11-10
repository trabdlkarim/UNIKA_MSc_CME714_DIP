clearvars 
close all 
clc 
import utils.frequencies.*

I = imread('rice.png'); 
% Get both the frquencies and the cumulative frequencies of the image
[freq, cumu] = frequencies(I); 

x_axis = 0:255;

figure
subplot(1, 2, 1), stem(x_axis, freq);
title('Histogram');
subplot(1, 2, 2), plot(x_axis, cumu);
title('Cumulative Frequencies');
sgtitle('Subplot Grid');