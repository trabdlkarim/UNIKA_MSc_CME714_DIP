function filtered = meanfilter(I,kernel)
%FILTER Applies kernel or mask to I.
%   filtered = meanfilter(L,kernel) applies the given kernel to the image
%   I and returns the filtered image as output.
filtered = I;
[xdim, ydim] = size(I);

for i=1:xdim
    if i-1 == 0 || i+1 > xdim
       continue
    end
    for j=1:ydim
        if j-1 == 0 || j+1 > ydim
            continue
        end
        roi = double(I(i-1:i+1,j-1:j+1));
        filtered(i,j) = sum(roi.*kernel, 'all');
    end
end
filtered = uint8(filtered);
end

