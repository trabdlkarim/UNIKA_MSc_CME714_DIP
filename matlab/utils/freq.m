function F = freq(I)
%FREQ Gets vector of frequencies.
%   F = freq(I) returns a vector containing the frequencies of I grayscale
%   levels.

[xdim, ydim] = size(I);
F = zeros(1,256);

for i = 0:255
    for x = 1:xdim
        for y = 1:ydim
            if i == I(x,y)
                F(i+1) = F(i+1) + 1; 
            end
        end
    end
end

end

