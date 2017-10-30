function yQuant = quantizeMidTread(x, bitDepth)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    yQuant = round(2.^(bitDepth-1) * x)/2.^(bitDepth-1);
end

