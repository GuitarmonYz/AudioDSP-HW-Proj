function y = myQuantize(x,w)
delta = 2 .^ w - 1;
y = round(x*delta)/delta;
end

