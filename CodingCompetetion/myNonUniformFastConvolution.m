function y = myNonUniformFastConvolution(x, h)
sig_block_size = 128;
sig_length = length(x);
filter_size = length(h);
[zpadded_filter_size,h_array,filter_block_size_array,filter_index_array] = nonUniformSize(h,sig_block_size); %get the total length of all partitioned h, index array, block size array, and get the calculated fft of each partitioned h

x = [x;zeros(sig_block_size,1)];%zero pad x due to the length of x maybe not integer times of length of block length
y = zeros(length(x)+zpadded_filter_size-1,1);%pre-allocate y

%loop through input signal x, loop step is length of block length
for i = 1:sig_block_size:sig_length
    block_x = x(i:i+sig_block_size-1);%block x
    pre_fft_x = 0;%pre allocate result of reusing fft_x
    %loop through partioned h
    for j=1:length(filter_index_array)
        %store the fft x if length partitioned h is the same
        if mod(j,2) == 1
            fft_x = fft(block_x,sig_block_size+filter_block_size_array(j)-1);
            pre_fft_x = fft_x;%store repeated fft-x
        else
            fft_x = pre_fft_x;%reuse fft-x
        end
        
        fft_h = cell2mat(h_array(j));%convert cell to mattrix
        
        conv_block = ifft(fft_x .* fft_h);%calculate convolution result
        
        y(i+filter_index_array(j)-1:i+filter_index_array(j)+sig_block_size+filter_block_size_array(j)-3) = y(i+filter_index_array(j)-1:i+filter_index_array(j)+sig_block_size+filter_block_size_array(j)-3)+conv_block;%overlap and add
        
    end
end

y = y(1:sig_length+filter_size-1);%remove extra padded zero

end

