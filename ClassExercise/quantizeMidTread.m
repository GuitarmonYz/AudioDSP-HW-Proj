function y = quantizeMidTread(x, bitDepth)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    num_step = 2.^bitDepth;
    step_height = 2/num_step;
    y = x - mod(x,step_height);
    round(2.^(bitDepth-1) * x)/2.^(bitDepth-1);
end

