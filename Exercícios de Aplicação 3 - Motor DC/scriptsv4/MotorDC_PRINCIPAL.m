%% Flush
close all
clear all
clc

%% Discretiza��o do tempo
    Ts = 0.01;         % Time sampling [seg]
    T0 = 0;            % Instante de tempo inicial [seg]
    Tf = 1;            % Instante de tempo final [seg]
    t = T0:Ts:Tf;      % Vetor de instantes de tempo [seg]
    K = length(t) - 1; % K (n�mero de steps)
 
%% Condi��es de contorno
    % Inicial
    tetab_0  = 0;    % rad
    tetabp_0 = 0;    % rad/s      "p" de "ponto"
    im_0     = 0;    % A
    
    % Final
    tetab_f  = pi/2; % rad
    tetabp_f = 0;    % rad/s      "p" de "ponto"
    im_f     = 0;    % A

 %% Modelagem e prepara��o do sistema linear (chamada de scripts)
    
    ParametrosDoSistema;  % Carrega par�metros do sistema
    MontaEspacoDeEstados; % Monta o espa�o de estados 
                          % e o discretiza
	MontaSistemaLinear;   % Monta a matriz do sistema e o 
                          % vetor independente
    % Resultado: 
        % M*Sol = vet
        % vet : vetor independente
        % Sol : solu��o
        % M : matriz de coeficientes
 
%% Solu��o do sistema linear
    % M�todo refer�ncia
    Sol = M\vet;
    
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% M�todo implementado (preencha o e depois descomente aqui)
% !ATEN��O! A matriz M � retangular com mais linhas do que colunas.
%     Sol = resolveSistema(M,vet);
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%% Tratamento da solu��o
    
    DesmenbraVetorSol; % Recupera vari�veis internas da solu��o
                       % tetab, tetabp, im e vm
    PlotaGraficos;     % Plota gr�ficos destas vari�veis
    Animacao;          % Anima��o
    
%% Joga fora algumas coisas...
clear barra color fps hLegend hTitle is i I js j J k n m r...
      index_im index_tetab index_tetabp index_vm limits...
      MeSup McSup MeInf McInf p1 p10 p2 p20 p3 p30 p4 p40...
      sobra spf th time titleFontSize vetInf vetSup x y xaxis...
      rightXAxisFontSize Rot
