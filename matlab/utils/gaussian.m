function output = gaussian(i,j, sigma)
%GAUSSIAN Summary of this function goes here
%   Detailed explanation goes here
%sigma = 0.8;
output = exp((i^2 + j^2)/2*sigma^2)/(2*pi*sigma^2);
end

