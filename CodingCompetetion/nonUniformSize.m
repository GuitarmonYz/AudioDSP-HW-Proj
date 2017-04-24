function y = nonUniformSize(filter_size)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
sum = 0;
count = 1;
while sum<filter_size
    filter_block_size = 128 * 2 ^ floor((count-1)/2);
    count = count +1;
    sum = sum + filter_block_size;
    disp(filter_block_size);
end
y = sum;
end

