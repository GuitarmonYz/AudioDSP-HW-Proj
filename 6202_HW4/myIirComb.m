function  y = myIirComb(x, fs, FB, FF, delay_in_sec) 
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m = round(delay_in_sec * fs);
y = zeros(length(x),1);
ring_buff = zeros(m,1);
% for i = 1:length(x)
%     read = mod(i,m+1);
%     if (read == 0)
%         read = m+1;
%     end
% %     disp(read);
%     write = read - 1;
%     if (write == 0)
%         write = m+1;
%     end
% %     disp(write);
%     y(i) = FF * x(i) - FB * ring_buff(read);
%     ring_buff(write) = x(i);
% end
for i = 1:length(x)
    read = mod(i,m);
    if (read == 0)
        read = m;
    end
    write = read - 1;
    if (write == 0)
        write = m;
    end
    y(i) = FF * (x(i) - FB * ring_buff(read));
    ring_buff(write) = x(i) - FB * ring_buff(read);
%     write = mod(write, m) + 1;
%     read = mod(read,m) + 1;
end
