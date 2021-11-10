function [freq, cumu] = frequencies(img)
% Get both frequencies and cumulative frequencies of a given image.
    freq = zeros(256, 1); 
    cumu = zeros(256, 1);
 
    for f = 0:255 
        for i = 1:size(img,1) 
            for j = 1:size(img,2) 
                value = img(i,j); 
                if (f == value) 
                    freq(f+1, 1) = freq(f+1, 1) + 1; 
                end 
            end 
        end
    
        prev = f-1;
    
        if(prev < 1)
            prev = 1;
        end
    
        cumu(f+1, 1) = cumu(prev, 1) + freq(f+1, 1);  
    end 
end