function [ t, X ] = generateBlocks(x, sample_rate_Hz, block_size, hop_size) 
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
l = length(x);
num_of_blocks = fix(l/hop_size);
padding_size = mod(l,hop_size);
x = [x;zeros((hop_size-padding_size),1)];
t = (0:hop_size/sample_rate_Hz:hop_size/sample_rate_Hz*(num_of_blocks-1))';
X = zeros(block_size,num_of_blocks);
for i = 1:num_of_blocks
     X(:,i) = x((i-1)*hop_size+1:(i-1)*hop_size+block_size);
end
end

