function [ f,XAbs,XPhase,XRe,XIm ] = computeSpectrum(x, sample_rate_Hz)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    l = length(x);
    f = (1:sample_rate_Hz/l:sample_rate_Hz);
    f = f(1:ceil(l/2));
    xdft = fft(x);
    xdft = xdft(1:ceil(l/2));

    XAbs = abs(xdft)/(l/2);
%     XPhase = unwrap(angle(hilbert(xdft)));

    XAbs = abs(xdft);

    XPhase = angle(xdft);
    XRe = real(xdft);
    XIm = imag(xdft);

end

