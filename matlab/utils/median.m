function middle = median(observations)
%MEDIAN Summary of this function goes here
%   Detailed explanation goes here

vector = sort(reshape(observations, 1, []));
n = numel(vector);
pos = 1;
middle = vector(pos);

if mod(n, 2) == 0
    pos = fix((n + 1) / 2);
    middle = (vector(pos) + vector(pos+1)) / 2;
else
    pos = (n + 1) / 2;
    middle = vector(pos);
end

end

