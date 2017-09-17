%% Flush
close all
clear all
clc

%% Discretização do tempo
    Ts = 0.1;         % Time sampling [seg]
    T0 = 0;            % Instante de tempo inicial [seg]
    Tf = 15;          % Instante de tempo final [seg]
    t = T0:Ts:Tf;      % Vetor de instantes de tempo [seg]
    K = length(t) - 1; % K (número de steps)
 
%% Condições de contorno
    % Inicial
    tetab_0  = 0;    % rad
    tetabp_0 = 0;    % rad/s      "p" de "ponto"
    im_0     = 0;    % A
    
    % Final
    tetab_f  = pi/2; % rad
    tetabp_f = 0;    % rad/s      "p" de "ponto"
    im_f     = 0;    % A

 %% Modelagem e preparação do sistema linear (chamada de scripts)
    
    ParametrosDoSistema;  % Carrega parâmetros do sistema
    MontaEspacoDeEstados; % Monta o espaço de estados 
                          % e o discretiza
 
%% Solve
Kp = 20;
Ti = 2.5;
x = [x0];
u = [];
for k = 1:K+1
    xk_1 = x(3*(k-1)+[1 2 3]);
    theta_k_1 = xk_1(1);
    uk_1 = Kp*(xf(1)-theta_k_1)^2;
    if k > 1
        xk_2 = x(3*(k-2)+[1 2 3]);
        theta_k_2 = xk_2(1);
        uk_1 = uk_1 + Kp/Ti*(xf(1)-theta_k_2);
    end
    u = [u;uk_1];
    if k <= K
        xk = a*xk_1 + b*uk_1;
        x = [x;xk];
    end
end

Sol = [x;u];

%% Tratamento da solução
    DesmenbraVetorSol;
    PlotaGraficos;     % Plota gráficos destas variáveis
    Animacao;          % Animação
    
%% Joga fora algumas coisas...
clear barra color fps hLegend hTitle is i I js j J k n m r...
      index_im index_tetab index_tetabp index_vm limits...
      MeSup McSup MeInf McInf p1 p10 p2 p20 p3 p30 p4 p40...
      sobra spf th time titleFontSize vetInf vetSup x y xaxis...
      rightXAxisFontSize Rot
