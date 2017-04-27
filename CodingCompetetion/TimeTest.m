x = audioread('piano.wav');
h = audioread('piano.wav');

% tic;
% myUniformFastConvolution(x,h);
% disp(toc);
% tic;
% conv(x,h);
% disp(toc);
tic;
myFastConvolution(x,h);
disp(toc);
% tic;
% m = length(x)+length(h)-1;
% ifft(fft(x,m).*fft(h,m));
% disp(toc);

