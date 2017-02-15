function [ freq_vector, time_vector, magnitude_spectrogram ] = mySpecgram(x,  block_size, hop_size, sampling_rate_Hz, window_type)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
switch window_type
     case 'rect'
         window = ones(1,block_size)';
     case 'hann'
         window = hann(block_size);
     otherwise
         warning('Wrong type of specified window.');            
end

freq_vector = ((0:block_size/2-1)*sampling_rate_Hz/block_size)';
[time_vector, blocks] = generateBlocks(x, sampling_rate_Hz, block_size, hop_size);
[m,n] = size(blocks);
windows = window;
for i=1:n-1
    windows = [windows window];
end
magnitude_spectrogram = abs(fft(blocks.* windows));
magnitude_spectrogram = magnitude_spectrogram(1:block_size/2,:);

end

