m = 1;    % kg
k = 1000; % N/m
T = 0.2;  % seg

A = [0      1;...
     -k/m   0];
A
A*T
exp(A*T)