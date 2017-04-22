function y = myDither( x, w, noise_type )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
y = myQuantize((x + myNoiseGen(length(x), w, noise_type)),w);

end

