clearvars
clc
close all

I = imread('rice.png');
F = freq(I);
P = F./sum(F); %Probabilities of each intensity

[mean, std] = stdev(F);
variance = std^2;
entropy = 0;
for i=find(P>0)
 entropy = entropy + P(i)*log2(P(i));   
end
entropy = -1 * entropy;

disp('mean:'), disp(mean)
disp('variance:'), disp(variance)
disp('entropy:'), disp(entropy)
figure;
subplot(1,2,1), imshow(I);
title('Original Image');
subplot(1,2,2), bar(F);
title('Histogram');