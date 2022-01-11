function [mn, mx] = minmax(roi)
%MINMAX Summary of this function goes here
%   Detailed explanation goes here
vector = reshape(roi, 1, []);
mx = max(vector);
mn = min(vector);
end

