function y = myNonUniformFastConvolution(x, h)
sig_block_size = 128;
sig_length = length(x);
filter_size = length(h);
[zpadded_filter_size,h_array] = nonUniformSize(h,sig_block_size);

x = [x;zeros(sig_block_size,1)];
y = zeros(length(x)+zpadded_filter_size-1,1);

for i = 1:sig_block_size:sig_length
    block_x = x(i:i+sig_block_size-1);
    filter_index = 1;
    count = 1;

    while filter_index < filter_size
        filter_block_size = 128 * 2 ^ floor((count-1)/2);
        count = count +1;
        
        fft_x = fft(block_x,sig_block_size+filter_block_size-1);
        fft_h = cell2mat(h_array(count-1));
        
        conv_block = ifft(fft_x .* fft_h);
        
        tmp = y(i+filter_index-1:i+filter_index+sig_block_size+filter_block_size-3);
        y(i+filter_index-1:i+filter_index+sig_block_size+filter_block_size-3) = tmp+conv_block;
        
        filter_index= filter_index + filter_block_size;
    end
end
y = y(1:sig_length+filter_size-1);

end

