%% Flush
close all
clear all
clc

%% Parâmetros mecânicos do braço

% Geometria 
    % Comprimento
    lb = 1.00;  % m 
    
    % Largura
    wb = 0.22;  % m
    
    % Espessura
    eb = 0.15;  % m
    
    % Volume
    Vb = lb * wb * eb; % m^3

% Material
    % Densidade
    mu_aco = 8; % kg/m^3

% Massa, momento de inércia e atrito viscoso do acoplamento
    % Massa
    mb = mu_aco * Vb; % kg
    
    % Momento de inércia do braço em torno do eixo que passa pelo CG
    Jb_cg = mb/12 * (wb^2 + lb^2); % kg*m^2
    
    % Distância entre o eixo do CG e do eixo de acoplamento
    d_E = 0.40; % m
    
    % Momento de inércia do braço em torno do eixo de acoplamento
    Jb = Jb_cg + mb * d_E^2; % kg*m^2
    
    % Coeficiente de atrito viscoso no eixo de acoplamento
    fb = 0.2; % N*m/(rad/s)
    
%% Parâmetros do motor cc

% Parâmetros mecânicos
    % Relação de engrenamento 
    re = 60; % 60:1

    % Momento de inércia do motor (interno)
    Jm = 0.02; % kg*m^2
    
    % Coeficiente de atrito viscoso no eixo do motor (interno)
    fm = 0.2; % N*m/(rad/s)
    
% Parâmetros elétricos
    % Constante de torque
    Km = 0.1; % ????
    
    % Resistência elétrica do motor
    Rm = 2; % Ohm
    
    % Indutância do motor
    Lm = 0.5; % H

%% Parâmetros mecânicos equivalentes

    % Inércia equivalente
    Jeq = Jm/re + Jb*re; % kg*m^2   
    
    % Atrito viscoso equivalente
    feq = fm/re + Jb*re; % N*m/(rad/s)

%% Discretização do tempo
    % Time sampling
    Ts = 0.01; % s
    
    % Instante de tempo inicial
    T0 = 0; % s
    
    % Instante de tempo final
    Tf = 1; % s
    
    % Vetor de instantes de tempo
    t = T0:Ts:Tf; % s 
    
    % K do instante de tempo final
    K = length(t) - 1;

%% Estados inicial e final

% x = [tetab 
%      tetabp 
%      im]

    % Inicial
    tetab_0  = 0;    % rad
    tetabp_0 = 0;    % rad/s      "p" de "ponto"
    im_0     = 0;    % A
    
    % Final
    tetab_f  = pi/2; % rad
    tetabp_f = 0;    % rad/s      "p" de "ponto"
    im_f     = 0;    % A 

    % x...
    x0 = [tetab_0   tetabp_0   im_0]';
    xf = [tetab_f   tetabp_f   im_f]';

%% Espaço de estados

% x = [tetab 
%      tetabp 
%      im]
% u = vm

% Domínio contínuo
    % xp = A*x + B*u
    A = [0       1          0     ;...
         0   -feq/Jeq     Km/Jeq  ;...
         0   -Km/re/Lm   -Rm/Lm  ];
 
    B = [0 0 1/Lm]';
    
    % y = C*x + D*u
    C = [ 1           0                 0        ;...
          0           1                 0        ;...
          0       -feq/Jeq           Km/Jeq      ;...
         1/re         0                 0        ;...
          0          1/re               0        ;...
          0      -feq/Jeq/re        Km/Jeq/re    ;...
          0      fb-Jb*feq/Jeq      Jb*Km/Jeq    ;...
          0           0                Km        ;...
          0         Km/re               0        ;...
          0           0                 1        ;...
          0           0                 0       ];
    
    D = [0 0 0 0 0 0 0 0 0 0 1]';
 
    % Espaço de estados contínuo
    sys_c = ss(A,B,C,D);

% Domínio discreto
    % Espaço de estados discreto
    sys_d = c2d(sys_c, Ts);
    
    % xk+1 = a*xk + b*uk
    a = sys_d.a;
    b = sys_d.b;

    % yk = c*xk + d*uk
    c = sys_d.c;
    d = sys_d.d;

 %% Sistema linear
 
 % M*Sol = vec
 % vec : vetor independente
 % Sol : solução
 % M : matriz de coeficientes (neste caso, retangular)
 
[M,vec] = montaSistemaLinear2(a,b,c,d,x0,xf,K);

%% Solução do sistema linear

% Método referência
Sol = M\vec;
% Sol = linsolve(M,vec);

% Sol = pinv(M)*vec;

% opts.UT = true;
% opts.RECT = true;
% Sol = linsolve(M,vec,opts);

% [P,L,U,pivcol,sign] = plu(M);
% Sol=U\(L\(P*vec));

% [L,U,P]=lu(M); 
% Sol=U\(L\(P*vec));

% [L] = chol(M);
% x = L'\(L\vec);
% [R,p] = chol(M);

% R = rref(M);
% Sol = R\vec;

%% Tratamento da solução

% Recupera variáveis internas da solução
RecuperaVariaviesInternasDaSolucao; % tetab, tetabp, im e vm

% Plota gráficos
PlotaGraficos;

% Animção
Animacao;