% -------------------------------Quesion #1------------------------
% rect specture and pdf
noise_rect = myNoiseGen(44100,4,'rect');
subplot(2,3,1);
histogram(noise_rect,50);
axis tight
title('Rectangle pdf');
xlabel('Amp');
ylabel('Occurence');

subplot(2,3,4);
f_ini = (1:48000/44100:48000);
f = f_ini(1:round(44100/2));
fft_rect = fft(noise_rect);
fft_rect = fft_rect(1:round(44100/2));
plot(f,abs(fft_rect));
axis tight
title('Rectangle pdf noise spectrum');
xlabel('Freq/Hz');
ylabel('Mangnitude');

% triangle spectrum and pdf
noise_tri = myNoiseGen(44100,4,'tri');
subplot(2,3,2);
histogram(noise_tri,50);
axis tight
title('Triangle pdf');
xlabel('Amp');
ylabel('Occurence');

subplot(2,3,5);
fft_tri = fft(noise_tri);
fft_tri = fft_tri(1:round(44100/2));
plot(f,abs(fft_tri));
axis tight
title('Triangle pdf noise spectrum');
xlabel('Freq/Hz');
ylabel('Mangnitude');

% high pass triangle spectrum and pdf
noise_hp = myNoiseGen(44100,4,'hp');
subplot(2,3,3);
histogram(noise_hp,50);
axis tight
title('Highpass pdf');
xlabel('Amp');
ylabel('Occurence');

subplot(2,3,6)
fft_hp = fft(noise_hp);
fft_hp = fft_hp(1:round(44100/2));
plot(f,abs(fft_hp));
axis tight
title('Highpass Triangle pdf noise spectrum');
xlabel('Freq/Hz');
ylabel('Mangnitude');
figure;
%------------------------------Question #3-----------------------------%

input = audioread('sine-440-96k.wav');
output = myNoiseShape(input,4,'tri');
fft_sine = abs(fft(output-input));
fft_sine = fft_sine(1:round(length(input)/2));
f = (1:96000/length(input):96000);
f = f(1:round(length(input)/2));
plot(f,fft_sine);%plot error
% axis([0 48000 0 max(fft_sine)])
title('noise shape error magnitude spectrum');
xlabel('Freq/Hz');
ylabel('Mangnitude');
axis tight
figure;
%------------------------------Question #4-----------------------------%

input_flute = audioread('flute-A4-96k.wav');
dither = myDither(input_flute,4,'hp');
quantize = myQuantize(input_flute,4);
noise_shape = myNoiseShape(input_flute,4,'hp');
dither_8 = myDither(input_flute,8,'hp');
quantize_8 = myQuantize(input_flute,8);
noise_shape_8 = myNoiseShape(input_flute,8,'hp');

subplot(2,3,2);
plot(abs(fft(dither)));
title('magnitude spectrum of dither 4 bit');
xlabel('Freq/Hz');
ylabel('Mangnitude');
axis tight

subplot(2,3,1);
plot(abs(fft(quantize)));
title('magnitude spectrum of quantize 4 bit');
xlabel('Freq/Hz');
ylabel('Mangnitude');
axis tight

subplot(2,3,3);
plot(abs(fft(noise_shape)));
title('magnitude spectrum of noise shape 4 bit');
xlabel('Freq/Hz');
ylabel('Mangnitude');
axis tight

subplot(2,3,5);
plot(abs(fft(dither_8)));
title('magnitude spectrum of dither 8 bit');
xlabel('Freq/Hz');
ylabel('Mangnitude');
axis tight

subplot(2,3,4);
plot(abs(fft(quantize_8)));
title('magnitude spectrum of quantize 8 bit');
xlabel('Freq/Hz');
ylabel('Mangnitude');
axis tight

subplot(2,3,6);
plot(abs(fft(noise_shape_8)));
title('magnitude spectrum of noise shape 8 bit');
xlabel('Freq/Hz');
ylabel('Mangnitude');
axis tight



