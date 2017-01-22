function y = myTimeConv( x, h )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

lx = length(x);
lh = length(h);
lconv = lx + lh - 1;
y = zeros(lconv,1);

for i = 1:lconv
    
    if i >= lh
        jmin = i - lh + 1;
    else 
        jmin = 1;
    end
    if i < lx
        jmax = i;
    else
        jmax = lx;
    end
   
    for j = jmin : jmax
        y(i) = y(i) + x(j) * h(i-j+1);
    end
end
end

