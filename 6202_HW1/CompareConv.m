function [m, mabs, stdev, time] = CompareConv(x, h)
tic;
y_conv = conv(x,h);
time_conv = toc;
tic;
y_time = myTimeConv(x,h);
time_time = toc;
tic;
y_freq = myFreqConv(x,h);
time_freq = toc;

time = [time_conv;time_time;time_freq];
m = [mean(y_conv-y_time);mean(y_conv-y_freq)];
mabs = [mean(abs(y_conv-y_time));mean(abs(y_conv-y_freq))];
stdev = [std(y_conv-y_time);std(y_conv-y_freq)];
