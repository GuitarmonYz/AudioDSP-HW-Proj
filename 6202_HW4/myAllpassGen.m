function y = myAllpassGen(x ,fs, g, delay_in_sec)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
m = round(delay_in_sec * fs);
y = zeros(length(x)+m,1);
% x = x;zeros(m,1);
delay = zeros(m,1);

for i = 1:length(x)
    y(i) =  g * x(i)+delay(m)- g*g*delay(m);
    tmp = delay(m);
    delay = circshift(delay,1);
    delay(1) = x(i) - g * tmp;
end
    

end

