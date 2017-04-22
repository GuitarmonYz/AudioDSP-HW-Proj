t = (0:1/44100:1)';
x_sin = sin(2 * pi * t);
plot(t,x_sin);
title('One second sine wave with RMS and Limiter');
xlabel('T/s');
ylabel('Amp');
hold on
plot(t,myRmsMeasure(x_sin,44100,100));
plot(t,myPeakMeasure(x_sin,44100,1,100));
hold off
axis tight
legend('sin','rms','peak');
figure;
% 
% x_song = audioread('sv44_short.wav');
x_song = audioread('sv44_short.wav');
plot(x_song);
title('song track with static curve');
xlabel('T/s');
ylabel('Amp');
hold on
x_peak = myPeakMeasure(x_song,44100,1,100);
plot(x_peak);
plot(2 .^ myStaticCurve(log2(x_peak),1,-3));
hold off
legend('original','peak','static curve');
axis tight
figure;

y_limiter = myDynamic(x_song,44100,-3,1,1,100,0,'peak');
 plot(x_song);
 title('song track with limiter');
 xlabel('T/s');
 ylabel('Amp');
 hold on
 plot(y_limiter);
 hold off
 axis tight
 legend('original','limiter');
 figure;
 
 y_compressor = myDynamic(x_song,44100,-3,0.75,1,100,100,'rms');
 plot(x_song);
 title('song track with compressor');
 xlabel('T/s');
 ylabel('Amp');
 hold on
 plot(y_compressor);
 hold off
 axis tight
 legend('original','compressor');
 
