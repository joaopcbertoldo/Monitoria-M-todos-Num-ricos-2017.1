%% Flush
close all
clear all
clc


%% Parâmetros

% Braço
mu_aco = 8; % kg/m^3
l_b = 1.00; % m 
w_b = 0.20;  % m
e_b = 0.08;  % m
V_b = l_b * w_b * e_b; % m^3
m_b = mu_aco * V_b; % kg
J_b_cg = m_b/12 * (w_b^2 + l_b^2); % kg*m^2
J_b = J_b_cg + m_b * (l_b/2)^2;  % kg*m^2
f_b = 0.7; % N*m*s/rad
r_e = 80; % 80:1

% Motor
J_m = 0.005; % kg*m^2
f_m = 0.7; % N*m*s/rad
K_m = 0.5; % ????
R_m = 8; % Ohm
L_m = 0.600; % H

% Equivalentes
J_eq = J_m/r_e + J_b*r_e;
f_eq = f_m/r_e + J_b*r_e;

% Discretização e tempo
Ts = 0.025; % s
T0 = 0; % s
Tf = 5; % s
t = T0:Ts:Tf; % s 
K = length(t) - 1;

% Estados inicial e final
teta_b_0 = 0;
tetad_b_0 = 0;
i_m_0 = 0; 

teta_b_f = pi/2;
tetad_b_f = 0;
i_m_f = 0; 

X0 = [teta_b_0 tetad_b_0 i_m_0]';
Xf = [teta_b_f tetad_b_f i_m_f]';

%% Espaço de estados

% X = [teta_b 
%      dteta_b/dt 
%      i_m]

% U = v_m

% Y = [teta_b 
%      dteta_b/dt 
%      d^2teta_b/dt^2
%      teta_m 
%      dteta_m/dt 
%      d^2teta_m/dt^2
%      tau_b 
%      tau_m
%      e_m
%      i_m
%      v_m]

A = [0   1            0         ;...
     0   -f_eq/J_eq   K_m/J_eq  ;...
     0   -K_m/r_e/L_m   -R_m/L_m ];
 
B = [0 0 1/L_m]';

C = [1    0                   0              ;...
     0    1                   0              ;...
     0    -f_eq/J_eq          K_m/J_eq       ;...
     1/r_e  0                   0              ;...
     0    1/r_e                 0              ;...
     0    -f_eq/J_eq/r_e        K_m/J_eq/r_e     ;...
     0    f_b-J_b*f_eq/J_eq   J_b*K_m/J_eq   ;...
     0    0                   K_m            ;...
     0    K_m/r_e               0              ;...
     0    0                   1              ;...
     0    0                   0             ];
 
 D = [0 0 0 0 0 0 0 0 0 0 1]';
 
 sys_c = ss(A,B,C,D);
 sys_d = c2d(sys_c,Ts);
 
 a = sys_d.a;
 b = sys_d.b;
 c = sys_d.c;
 d = sys_d.d;
 
 
 %% Sistema linear
 
% Dimensões
n = size(a,1);
m = size(b,2);
r = size(C,1);

% Matriz estados
Me = zeros( (K+2)*n, (K+1)*n );
for k = 0:K
    I = k + 1;
    i = (I-1)*n + 1;
    is = i:i+n-1;
    
    J = k + 1;
    j = (J-1)*n + 1;
    js = j:j+n-1;
    
    Me( is , js ) = eye(n);
    
    I = I + 1;
    i = (I-1)*n + 1;
    is = i:i+n-1;
    
    if k < K
        Me( is , js ) = -a;
    else
        Me( is , js ) = eye(n);
    end
end

% Matriz comandos
Mc = zeros((K+2)*n,K*m);
for k = 0:K-1
    I = k + 2;
    i = (I-1)*n + 1;
    is = i:i+n-1;
    
    J = k + 1;
    j = (J-1)*m + 1;
    js = j:j+m-1;
    
    Mc( is , js ) = -b;
end

% Matriz total
M = [Me Mc];
 
% Vetor
vec = zeros( (K+2)*n, 1 );
vec(1:n) = X0;
vec((end-n+1):end) = Xf;

%% ALTERNATIVO (TESTE) !!!!!!!!!!!!!!!!!!!!!!!
Me = Me(1:end-3,:);
Mc = Mc(1:end-3,:);
Me(end-2:end,end-2:end) = zeros(3);
% Me = Me(4:end,:);
% Mc = Mc(4:end,:);
M = [Me Mc];
vec = vec(1:end-3);
vec(end-2:end) = -Xf;
K = K -1;

%% Solução do sistema linear

% Método referência
Sol = M\vec;

% TESTE !!!!!!!!!!!!!!!!!!!!!!!
% Z = null(M);
% % q = ones(size(Z,2),1)./length(Z);
% q = ones(size(Z,2),1);
% q(1:100) = -2;
% Sol = Sol + 2*Z*q;

%% Tratamento da solução
index_teta = (1:K+1) * 3 - 2;
index_tetad = (1:K+1) * 3 - 1;
index_i = (1:K+1) * 3;
index_v = (1:K) + (K+1)*3;

teta = Sol(index_teta);
tetad = Sol(index_tetad);
i = Sol(index_i);
v = Sol(index_v);
v = [v; v(end)];

figure
set(gcf, 'Position', get(0,'Screensize')); 

% subplot(221)
% plot(t,teta*180/pi)
% subplot(223)
% plot(t,tetad*180/pi)
% subplot(222)
% plot(t,i)
% subplot(224)
% plot(t,v)

subplot(221)
stairs(t(1:end-1),teta*180/pi)
subplot(223)
stairs(t(1:end-1),tetad*180/pi)
subplot(222)
stairs(t(1:end-1),i)
subplot(224)
stairs(t(1:end-1),v)