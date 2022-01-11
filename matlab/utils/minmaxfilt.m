function new_pixel = minmaxfilt(pixel, min, max)
%MINMAXFILT Summary of this function goes here
%   Detailed explanation goes here
new_pixel = pixel;
if pixel < min
    new_pixel = min;
elseif pixel > max
    new_pixel = max;
end
end

