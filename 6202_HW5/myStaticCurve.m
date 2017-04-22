function  F = myStaticCurve(X, LS, LT)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
F = zeros(length(X),1);
for i = 1 : length(X)
    new_x = X(i) - LT;
    if new_x < 0
        new_x = 0;
    end
    F(i) = new_x * (-LS);

end

