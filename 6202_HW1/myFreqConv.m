function y = myFreqConv(x,h)
lx = length(x);
lh = length(h);
 h = [h;zeros(lx-1,1)];
 x = [x;zeros(lh-1,1)];

ftx = fft(x);
fty = fft(h);

y = ifft(ftx .* fty);
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


end

