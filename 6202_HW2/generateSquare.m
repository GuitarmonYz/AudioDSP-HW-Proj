function [ t,x ] = generateSquare( amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
x = zeros(length_secs*sampling_rate_Hz+1,1);
for i = 1:10
    [t,xtmp] = generateSinusoidal(amplitude,sampling_rate_Hz,frequency_Hz*(2*i-1),length_secs,phase_radians);
    x = x + xtmp/(2*i-1);
    
end

end

