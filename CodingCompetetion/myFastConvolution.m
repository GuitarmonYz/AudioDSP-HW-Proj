function y = myFastConvolution(x, h)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
filter_length = length(h);
block_length = 128;
conv_length = filter_length + block_length - 1;
y = zeros(length(x)+filter_length-1,1);
for i = 1:block_length:length(x)
    block = x(i:i+block_length);
    fft_block = fft(block,conv_length);
    fft_filter = fft(h,conv_length);
    block_result = ifft(fft_block.*fft_filter);
    y(i+block_length:i+block_length+filter_length-1) = y(i+block_length:i+block_length + filter_length -1) + block_result(1:filter_length-1);
    y(i+block_length+filter_length:i+2*block_length+filter_length) = block_result(filter_length,end);
end

