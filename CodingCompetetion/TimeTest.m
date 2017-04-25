x = audioread('sv_mono_19sec.wav');
h = audioread('impulse-response.wav');

tic;
myUniformFastConvolution(x,h);
disp(toc);
tic;
conv(x,h);
disp(toc);
tic;
myNonUniformFastConvolution(x,h);
disp(toc);
tic;
m = length(x)+length(h)-1;
ifft(fft(x,m).*fft(h,m));
disp(toc);