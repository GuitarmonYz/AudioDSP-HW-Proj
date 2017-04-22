function y = myChorusFF(x, fs, BL, FF1, FF2, delay_in_sec1, delay_in_sec2, width_in_sec1, width_in_sec2, mod_freq_hz1, mod_freq_hz2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y = zeros(length(x),1);
m_1 = round(fs * delay_in_sec1);
m_2 = round(fs * delay_in_sec2);
a_1 = round(fs * width_in_sec1);
a_2 = round(fs * width_in_sec2);
delay_1 = zeros(m_1+a_1,1);
delay_2 = zeros(m_2+a_2,1);
for i = 1:length(x)
    nfrac_1 = m_1 + a_1 * sin(2*pi*(mod_freq_hz1/fs)*i);
    nfrac_2 = m_2 + a_2 * sin(2*pi*(mod_freq_hz2/fs)*i);
%     disp(nfrac_1-m_1);
    n_1 = floor(nfrac_1);
    n_2 = floor(nfrac_2);
    
    frac_1 = nfrac_1 - n_1;
    frac_2 = nfrac_2 - n_2;
    
    delay_val_1 = delay_1(m_1-1)*frac_1 + delay_1(m_1)*(1-frac_1);
    delay_val_2 = delay_2(m_2-1)*frac_2 + delay_2(m_2)*(1-frac_2);

    y(i) = BL * x(i) + FF1 * delay_val_1 + FF2 * delay_val_2;
    delay_1 = circshift(delay_1,1);
    delay_1(1) = x(i);
    delay_2 = circshift(delay_2,1);
    delay_2(1) = x(i);


end

