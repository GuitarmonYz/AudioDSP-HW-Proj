clear all;close all;clc;

x = audioread('impulse-response.wav');
h = audioread('piano.wav');
y = myTimeConv(x,h);

x1 = ones(200,1);
h1 = triangularPulse(1, 51, (1:51))';
y_time = myTimeConv(x1,h1);
subplot(2,1,1);
plot(y_time);
title('Time Convolution');
xlabel('Time');
ylabel('Amp');

y_freq = myFreqConv(x1,h1);
subplot(2,1,2);
plot(y_freq);
title('Freq Convolution');
xlabel('Time');
ylabel('Amp');
[a,b,c,d]=CompareConv(x,h)