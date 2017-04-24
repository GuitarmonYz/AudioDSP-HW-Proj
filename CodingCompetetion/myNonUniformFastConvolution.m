function y = myNonUniformFastConvolution(x, h)

filter_size = length(h);
zpadded_filter_size = nonUniformSize(filter_size);
h = [h;zeros(zpadded_filter_size-filter_size,1)];
disp(length(h));
sig_block_size = 128;
y = zeros(length(x)+zpadded_filter_size-1,1);

for i = 1:sig_block_size:length(x)
    block_x = x(i:i+sig_block_size-1);
    
    filter_index = 1;
    count = 1;
    while filter_index < filter_size
        filter_block_size = 128 * 2 ^ floor((count-1)/2);
        count = count +1;
        
        block_h = h(filter_index:filter_index+filter_block_size-1);
        fft_x = fft(block_x,sig_block_size+filter_block_size-1);
        fft_h = fft(block_h,sig_block_size+filter_block_size-1);
        conv_block = ifft(fft_x .* fft_h);
        tmp = y(i+filter_index-1:i+filter_index+sig_block_size+filter_block_size-3);
        y(i+filter_index-1:i+filter_index+sig_block_size+filter_block_size-3) = tmp+conv_block;
        
        filter_index= filter_index + filter_block_size;
    end
end

y = y(1:length(x)+filter_size-1);

end

