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
        
        mn = min(reshape(mask,1,[]));
        mx = max(reshape(mask,1,[]));
        
        pixel = filtered(i, j);
        new_pixel = pixel;
                                           
        if pixel < mn
            new_pixel = mn;
        elseif pixel > mx
            new_pixel = mx;
        end
        filtered(i,j) = new_pixel; 
    end
end

figure
subplot(1, 2, 1), imshow(noisy);
title('Noisy Image');
subplot(1, 2, 2), imshow(filtered);
title('Median Filtered Image');
