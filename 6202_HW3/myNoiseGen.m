function y = myNoiseGen( num_samples, w, noise_type )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
noise = rand(num_samples, 1);
new_noise = rand(num_samples, 1);
delta = 1/2^(w-1);
if strcmp(noise_type,'rect')
    y = (noise - 0.5) * delta;
elseif strcmp(noise_type,'tri')
    y = (noise+new_noise - 1) * delta;
elseif strcmp(noise_type, 'hp')
    y = diff([0;(noise - 0.5) * delta]);
end

