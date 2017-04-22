function x_peak = myPeakMeasure(x, fs, ta, tr)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
x_peak = zeros(length(x),1);
at = 1 - exp((-2.2/fs)/(ta/1000));
rt = 1 - exp((-2.2/fs)/(tr/1000));
pre = 0;
for i = 1:length(x)
    if abs(x(i))>pre
        x_peak(i) = (1-at) * pre + at * abs(x(i));
    else
        x_peak(i) = (1-rt) * pre;
    end
    pre = x_peak(i);
end
end

