function x_rms = myRmsMeasure(x, fs, tm)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tav = 1 - exp((-2.2 / fs)/(tm / 1000));
x_rms_square = zeros(length(x),1);
x_rms = zeros(length(x),1);
pre = 0;
for i = 1:length(x)
    x_rms_square(i) = (1-tav) * pre + tav * x(i) * x(i);
    pre = x_rms_square(i);
end
for i = 1:length(x)
    x_rms(i) = sqrt(x_rms_square(i));
end

end

