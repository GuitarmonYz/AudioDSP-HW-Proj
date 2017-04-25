function y = myNonUniformFastConvolution(x, h)
sig_block_size = 128;
sig_length = length(x);
filter_size = length(h);
[zpadded_filter_size,h_array] = nonUniformSize(h,sig_block_size); %get the total length of all partitioned h and get the calculated fft of each partitioned h

x = [x;zeros(sig_block_size,1)];%zero pad x due to the length of x maybe not integer times of length of block length
y = zeros(length(x)+zpadded_filter_size-1,1);%pre-allocate y

%loop through input signal x, loop step is length of block length
for i = 1:sig_block_size:sig_length
    block_x = x(i:i+sig_block_size-1);%block x
    filter_index = 1;%keep track on the index of partitioned h
    count = 1;%count for convolution of block x with partitioned h
    pre_fft_x = 0;%pre allocate result of reusing fft_x
    %loop through partioned h
    while filter_index < filter_size
        filter_block_size = 128 * 2 ^ floor((count-1)/2);%calculating the size of partitioned h, h should partitioned in 128,128,256,256,512,512....etc.
        count = count +1;
        %store the fft x if length partitioned h is the same
        if mod(count,2) == 0
            fft_x = fft(block_x,sig_block_size+filter_block_size-1);
            pre_fft_x = fft_x;
        else
            fft_x = pre_fft_x;
        end
        
        fft_h = cell2mat(h_array(count-1));%convert cell to mattrix
        
        conv_block = ifft(fft_x .* fft_h);%calculate convolution result
        
        y(i+filter_index-1:i+filter_index+sig_block_size+filter_block_size-3) = y(i+filter_index-1:i+filter_index+sig_block_size+filter_block_size-3)+conv_block;%overlap and add
        
        filter_index= filter_index + filter_block_size;%update filter index
    end
end

y = y(1:sig_length+filter_size-1);%remove extra padded zero

end

