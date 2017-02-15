clear all;close all;clc;
% [t,x] = generateSinusoidal(1,44100,400,0.5,pi/2);
% plot(t,x);
% axis([0 0.005 -1 1]);
[t,x] = generateSquare(1,44100,400,0.5,0);
% plot(t,x);
% axis([0 0.005 -1 1]);

[f,XAbs,XPhase,XRe,XIm] = computeSpectrum(x,44100);
plot(f,XAbs);

plot(f,XPhase);