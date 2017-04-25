%calculate fft of partitioned h and store in cell array, also output the
%total length of all partioned h
function [y,h_array] = nonUniformSize(h,sig_block_size)

filter_size = length(h);
sum = 0;%track where the next partition should begin
count = 1;%count how many times does the partition applied

while sum<filter_size
    filter_block_size = 128 * 2 ^ floor((count-1)/2);%calculate the size of partioned h, should go like 128,128,256,256,512,512...etc.
    count = count +1;
    sum = sum + filter_block_size;
end
y = sum;%output total length of partitioned h
h = [h;zeros(sum-filter_size,1)];
%note two loops are needed, one to decide the number of partitioned h so
%the h_array can be pre-allocated, the other loop used to calculate fft
sum = 1;
h_array = cell(count-1,1);
count = 1;
%loop thourgh h to calculated fft of partitioned h
while sum<filter_size
    filter_block_size = 128 * 2 ^ floor((count-1)/2);
    count = count + 1;
    block_h = h(sum:sum+filter_block_size-1);
    fft_h = fft(block_h,sig_block_size+filter_block_size-1);
    h_array(count-1) = {fft_h};
    sum = sum + filter_block_size;
end

end

