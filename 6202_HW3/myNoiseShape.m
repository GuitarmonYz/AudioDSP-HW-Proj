function y = myNoiseShape( x, w, noise_type )
q = 0;
y = zeros(length(x),1);
d = myNoiseGen(length(x),w,noise_type);
d = [0;d];
for i = 1 : length(x)
    y(i) = myQuantize((x(i) + d(i+1) - d(i) -q),w);
    q = y(i) - (x(i) + d(i+1) - d(i) -q);
end
end

