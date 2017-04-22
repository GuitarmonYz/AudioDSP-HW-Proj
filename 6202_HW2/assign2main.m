close all;clc;


% generate Sin wave
[t_sin,x_sin] = generateSinusoidal(1,44100,400,0.5,pi/2);
plot(t_sin,x_sin);
hold on;
axis([0 0.005 min(x_sin) max(x_sin)]);
title('5 ms sinwave and squarewave');
xlabel('T/s');
ylabel('Amp');

% generate Square wave
[t_square,x_square] = generateSquare(1,44100,400,0.5,0);
plot(t_square,x_square);
% axis([0 0.005 min(x_square) max(x_square)]);
xlabel('T/s');
ylabel('Amp');

% Fouriar Transform
% Sin wave Spectrum
[f,XAbs,XPhase,XRe,XIm] = computeSpectrum(x_sin,44100);
figure;
subplot(2,1,1);
plot(f,XAbs);
title('Amplitude Spectrum');
xlabel('Freq/Hz');
ylabel('Amp');
subplot(2,1,2);
plot(f,XPhase);
title('Phase Spectrum');
xlabel('Freq/Hz');
ylabel('Phase');
% Square wave Spectrum
[f,XAbs,XPhase,XRe,XIm] = computeSpectrum(x_square,44100);
figure;
subplot(2,1,1);
plot(f,XAbs);
title('Amplitude Spectrum');
xlabel('Freq/Hz');
ylabel('Amp');
subplot(2,1,2);
plot(f,XPhase);
title('Phase Spectrum');
xlabel('Freq/Hz');
ylabel('Phase');

% Spectrogram
% Spectrogram of square wave using rectangular window
figure;
[freq_vector, time_vector, magnitude_spectrogram] = mySpecgram(x_square,  2048, 1024, 44100, 'rect');
subplot(1,2,1);
surf(time_vector,freq_vector,magnitude_spectrogram,'EdgeColor','none');
axis tight;
title('Spectrogram with rect window');
xlabel('T/s');
ylabel('Freq/Hz');
view(0,90);

% Spectrogram of square wave using hann window
[freq_vector, time_vector, magnitude_spectrogram] = mySpecgram(x_square,  2048, 1024, 44100, 'hann');
subplot(1,2,2);
surf(time_vector,freq_vector,magnitude_spectrogram,'EdgeColor','none');
axis tight;

view(0,90);
c = colorbar;
title('Spectrogram with hann window');
xlabel('T/s');
ylabel('Freq/Hz');
ylabel(c,'Power/frequency(dB/Hz)');
% Spectrogram with build in function
figure;
subplot(1,2,1);
spectrogram(x_square,rectwin(2048),1024,2048,1e3,'yaxis');
subplot(1,2,2);
spectrogram(x_square,hann(2048),1024,2048,1e3,'yaxis');

% [t,x] = generateSinusoidal(1,44100,400,0.5,pi/2);
% plot(t,x);
% axis([0 0.005 -1 1]);
[t,x] = generateSquare(1,44100,400,0.5,0);
% plot(t,x);
% axis([0 0.005 -1 1]);

[f,XAbs,XPhase,XRe,XIm] = computeSpectrum(x,44100);
plot(f,XAbs);

plot(f,XPhase);

