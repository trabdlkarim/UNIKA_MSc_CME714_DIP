function [prob, cumu] = probabilities(freq)
% This function returns both the probabilities and cumulative probabilities
% of a given frequency sequence.
    s = size(freq); % s = [256 1]
    prob = zeros(s);
    cumu = zeros(s);
    len = s(1)*s(2); % len = 256
    for i = 1:len
        prob(i,1) = freq(i,1)/len;
        prev = i-1;
        if(prev < 1)
            prev = 1;
        end
        cumu(i, 1) = cumu(prev, 1) + prob(i, 1);
    end
end

