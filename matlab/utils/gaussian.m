function output = gaussian(x,y)
%GAUSSIAN Summary of this function goes here
%   Detailed explanation goes here
sigma = 0.8;
output = exp((x^2 + y^2)/2*sigma^2)/(2*pi*sigma^2);
end

