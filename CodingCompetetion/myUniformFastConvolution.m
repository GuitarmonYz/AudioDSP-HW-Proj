function y = myUniformFastConvolution(x, h)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
filter_size = length(h);
block_size = 128;
sig_length = length(x);
x = [x;zeros(block_size,1)];
y = zeros(length(x)+filter_size-1,1);

for i = 1:block_size:sig_length
    block_x = x(i:i+block_size-1);
    fft_x = fft(block_x,2*block_size-1);
    for j = 1:block_size:filter_size
        block_h = h(j:j+block_size-1);
        fft_h = fft(block_h,2*block_size-1);
        conv_block = ifft(fft_x .* fft_h);
        tmp = y(i+j-1:i+j+2*block_size-3);
        y(i+j-1:i+j+2*block_size-3) = tmp+conv_block;
    end
end
end
        
        


