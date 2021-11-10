clearvars 
close all 
clc 

I = imread('rice.png'); 
 
freq = zeros(256, 1); 
cum_freq = zeros(256, 1);
 
for f = 0:255 
    for i = 1:size(I,1) 
        for j = 1:size(I,2) 
            value = I(i,j); 
            if (f == value) 
                freq(f+1, 1) = freq(f+1, 1) + 1; 
            end 
        end 
    end
    
    prev = f-1;
    
    if( prev < 1)
        prev = 1;
    end
    
    cum_freq(f+1, 1) = cum_freq(prev, 1) + freq(f+1, 1);  
end 
 
x_axis = 0:255;

figure; stem(x_axis, freq)
figure; plot(x_axis, cum_freq) 
