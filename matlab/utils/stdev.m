function [mean, std] = stdev(F)
%STDEV Calculate the mean and standard deviation from F vector.
X = 0:255;
n = sum(F);
mean = sum(F.*X)/n;
std = sqrt(sum(((X-mean).^2).*F)/n);
end

