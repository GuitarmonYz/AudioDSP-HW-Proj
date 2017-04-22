function [outputvector] = mySinglePole(inputvector, alpha)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
pre = 0;
outputvector = zeros(length(inputvector),1);
for i = 1:length(inputvector)
    outputvector(i) = (1-alpha) * inputvector(i) + alpha * pre;
    pre = outputvector(i);
end
    
end

