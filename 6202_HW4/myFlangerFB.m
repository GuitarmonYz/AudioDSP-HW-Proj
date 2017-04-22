function y = myFlangerFB(x, fs, BL, FF, FB, delay_in_sec, width_in_sec, mod_freq_hz)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
y = zeros(length(x),1);
m = ceil(fs * delay_in_sec);
a = ceil(fs * width_in_sec);
if m>a
    delay = zeros(m+a);
else
    delay = zeros(2*a);
end

for i = 1:length(x)
    nfrac = m + a * sin(2*pi*(mod_freq_hz/fs)*i);
    n = floor(nfrac);
    frac = nfrac - n;
    delay_val = delay(m-1)*frac + delay(m)*(1-frac);
    y(i) = BL * (x(i) + FB * delay_val) + FF * delay_val; 
    delay= circshift(delay,1);
    delay(1) = x(i) + FB * delay_val;

end


