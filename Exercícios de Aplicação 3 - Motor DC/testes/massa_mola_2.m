clear
close all
clc

m = 1;      % kg
k = 100;    % N/m
b = 1;      % Ns/m

Ts = 0.01;    % seg
T_f = 0.04;

t = 0:Ts:T_f;
Eta = length(t) - 1;

% Estado inicial
x0 = 0;        % m
v0 = 10;        % m/s
X0 = [x0 v0]';

% Estado final (desejado) (usado)
xf = 0;
vf = 0;
Xf = [xf vf]';

% x de referência para comandar (não usado)
% x0 = 0.5;
% x1 = 0;
% x2 = 0;
% xAmp = 0;
% xOmega = 0;
% xTeta = 0;
% xRef = x0 + x1.*t + x2.*t.^2 + xAmp.*sin(xOmega.*t + xTeta);
% U = xRef .* k;

% Contínuo
A = [0             1;...
    -k/m          -b/m];
B = [0 1/m]';
C = [1 0];
D = 0;
sys = ss(A,B,C,D);

% Discreto
dsys = c2d(sys,Ts);
G = dsys.a;
H = dsys.b;

% Dimensões
n = size(G,1);
m = size(H,2);

% Matriz estados
Me = zeros((Eta+2)*n,(Eta+1)*n);
for K = 0:Eta
    I = K + 1;
    i = (I-1)*n + 1;
    is = i:i+n-1;
    
    J = K + 1;
    j = (J-1)*n + 1;
    js = j:j+n-1;
    
    Me( is , js ) = eye(n);
    
    I = K + 2;
    i = (I-1)*n + 1;
    is = i:i+n-1;
    
    Me( is , js ) = -G;
end
Me( end-n+1:end, end-n+1:end ) = eye(n);

% Matriz comandos
Mc = zeros((Eta+2)*n,Eta*m);
for K = 0:Eta-1
    I = K + 2;
    i = (I-1)*n + 1;
    is = i:i+n-1;
    
    J = K + 1;
    j = (J-1)*m + 1;
    js = j:j+m-1;
    
    Mc( is , js ) = -H;
end

% Matriz total
M = [Me Mc];
 
% Vetor b
b = zeros((Eta+2)*n,1);
b(1:n) = X0;
b((end-n+1):end) = Xf;

Sol = M\b;

index_pos = (1:Eta+1) * 2 - 1;
index_vel = (1:Eta+1) * 2;
index_for = (1:Eta) + (Eta+1)*2;

x = Sol(index_pos);
v = Sol(index_vel);
f = Sol(index_for);

figure
subplot(311)
plot(t,x)
subplot(312)
plot(t,v)
subplot(313)
plot(t(1:end-1),f)

set(gcf, 'Position', get(0,'Screensize')); 

break

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