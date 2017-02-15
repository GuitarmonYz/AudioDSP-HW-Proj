function [ t, x ] = generateSinusoidal( amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

t = (0:1/sampling_rate_Hz:length_secs)';
x = amplitude*sin(2*pi*frequency_Hz*t+phase_radians);

end

