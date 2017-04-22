function y = myDynamic(x, fs, LT, LS, ta, tr, tm, level_method)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

switch level_method
   case 'peak'
       x_peak = myPeakMeasure(x,fs,ta,tr);
       f = 2 .^ myStaticCurve(log2(x_peak),LS,LT);
       g = myPeakMeasure(f,fs,ta,tr);
       y = [0;x(1:end-1)].*g;
   case 'rms'
       x_rms = myRmsMeasure(x,fs,tm);
       f = 2 .^ myStaticCurve(log2(x_rms),LS,LT);
       g = myPeakMeasure(f,fs,ta,tr);
       y = [0;x(1:end-1)].*g;
end

end

