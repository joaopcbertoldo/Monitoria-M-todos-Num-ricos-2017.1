clc
close all

l1 = 0.5;
l2 = 0.6;
D = 100;
n = 60;
u = 0;
m = 1.0958;

N = n + 1; 

A = eye(N)*m;
A(2:(N+1):(numel(A)-N)) = -l1;
A(N+1:(N+1):(numel(A)-1)) = -l2;
A(1,2:end) = 0;
A(end,1:end-1) = 0;


b = u*ones(N,1);
b(1) = 100;
b(end) = 0;

sol = (A\b);
plot(sol)