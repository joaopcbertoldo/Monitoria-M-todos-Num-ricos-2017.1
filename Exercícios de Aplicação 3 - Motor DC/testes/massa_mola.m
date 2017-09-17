clear
close all
clc

m = 1;      % kg
k = 10;    % N/m
b = 3;      % Ns/m

Ts = 0.01;   % seg
t_f = 20;    % seg

x0 = 0;     % m
v0 = 0;     % m/s

xref = 0.5;   % m

X0 = [x0 v0]';

% Eta = 100; % instantes de tempo
t = 0:Ts:t_f;
Eta = length(t);

% xcom = linspace(0,xref,Eta)';
% xcom(Eta/2:Eta) = xcom(Eta) - xcom(Eta/2:Eta);
% xcom = xcom.^2;
w = 9;
xcom = xref*sin(w.*t)';
U = xcom .* k;

% Contínuo
A = [0             1;...
    -k/m          -b/m];
B = [0 1/m]';
C = [1 0];
D = 0;
sys = ss(A,B,C,D);

% Discreto          %G = expm(A*T);
dsys = c2d(sys,Ts)
G = dsys.a;
H = dsys.b;

% Matriz estados
M = eye(Eta*2);
for J = 1:(Eta-1)
    j = J*2-1;
    M( (j:j+1) + 2 , j:j+1) = -G;
end

% Vetor comando
b = zeros(Eta*2,1);
b(1:2) = X0;
u = ones(Eta,1).*U;
for I = 1:Eta
    i = I*2-1;
    b(i:i+1) = b(i:i+1) + H*u(I);
end

X = M\b;

index_pos = (1:Eta) * 2 - 1;
index_vel = (1:Eta) * 2;
x = X(index_pos);
v = X(index_vel);

% figure
% subplot(211)
% plot(t,x)
% subplot(212)
% plot(t,v)

figure
size = 0.1;
half = size/2;
color = [1 0.5 0.75];
yquad = [x(1)-half, x(1)+half, x(1)+half, x(1)-half];
xquad = [-half, -half, +half, +half];
miny = min(x)-size;
maxy = max(x)+size;
deltay = maxy - miny;
limits = [-deltay/2, deltay/2, miny, maxy];
box = fill(xquad,yquad,color);
axis(limits)
hold on
graf = plot(t,x);
fps = 200;
spf = fps^-1;
time = timer('TimerFcn',@(~,~) '','StartDelay',spf);
for i = 1:Eta
    start(time);
    yquad = [x(i)-half, x(i)+half, x(i)+half, x(i)-half];
    box.YData = yquad;
    graf.XData = t - i*Ts;
    wait(time);
end