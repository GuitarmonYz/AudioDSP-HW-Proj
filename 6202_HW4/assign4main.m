% 1
noise = audioread('uni_noise.wav');
song = audioread('sv_mono_19sec.wav');
fft_allPass = abs(fft(myAllpassGen(noise,44100,0.5,0.001)));
f = (1:22050/length(noise):22050);
f = f(1:round(length(noise)/2));
plot(f,fft_allPass(1:round(length(noise)/2)));
title('all pass magnitude spectrum');
xlabel('Freq/Hz');
ylabel('Mangnitude');
axis tight
figure;

fft_iir = abs(fft(myIirComb(noise,44100,1,1,0.001)));
plot(f,fft_iir(1:round(length(noise)/2)));
title('comb filter magnitude spectrum');
xlabel('Freq/Hz');
ylabel('Mangnitude');
axis tight
figure;

fft_chorusFF = abs(fft(myChorusFF(noise,44100,1,1,1,0.001,0.001,0,0,0,0)));

plot(f,fft_chorusFF(1:round(length(noise)/2)));
title('Chorus feed forward magnitude spectrum');
xlabel('Freq/Hz');
ylabel('Mangnitude');
axis tight
figure;

fft_chorusFB = abs(fft(myChorusFB(noise,44100,0.5,1,-0.5,0.001,0,0)));

plot(f,fft_chorusFB(1:round(length(noise)/2)));
title('Chorus feed back magnitude spectrum');
xlabel('Freq/Hz');
ylabel('Mangnitude');
axis tight

figure;
fft_Flanger = abs(fft(myFlangerFB(noise,44100,0,0.5,0.5,0.001,0,0)));
plot(f,fft_Flanger(1:round(length(noise)/2)));
title('Flanger magnitude spectrum');
xlabel('Freq/Hz');
ylabel('Mangnitude');
axis tight


