clearvars

kernel = genmask(3);
kernel = - kernel;
kernel(2,2) = 8;
kernel2 = [-1 1 -1; -1 8 -1 ; -1 1 -1];
freqz2(kernel2);

% When sum of the mask is 1 it is low pass filter
% When sum of the mask is 0 it is high pass filter
% When sum of the mask is between 1 and 0 it is baseband pass filter
sprintf('Filter type: %s',getmasktype(kernel2))

function kernel = genmask(n)
     kernel = ones(n);
     kernel = kernel./sum(sum(kernel));
end

function type = getmasktype(mask)
s = sum(sum(mask));

if s == 0
    type = 'LOW_PASS_FILTER';
elseif s == 1
    type = 'HIGH_PASS_FILTER';
else
    type = 'BASEBAND_FILTER';
end

end
