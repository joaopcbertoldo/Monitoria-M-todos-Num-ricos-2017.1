% Exercício de aplicação 3 - Motor DC

% Objetivo - implementar método numérico para resolver sistema linear.

% Instruções de entrega 
% Implementar o método dentro do arquivo "resolveSistema.m" e enviá-lo para
% joao.bertoldo@gmail.com (monitor) com cópia para efcosta@icmc.usp.br 
% (docente) com o assunto "Exercício Adicional 3 - xx", onde "xx"é o seu
% nome.

%% Flush
close all
clear all
clc

%% Discretização do tempo
    Ts = 0.075;             % Time sampling [seg]
    T0 = 0;                 % Instante de tempo inicial [seg]
    Tf = 5;                 % Instante de tempo final [seg]
    t = T0:Ts:Tf;           % Vetor de instantes de tempo [seg]
    K = length(t) - 1;      % K (número de steps)
 
%% Condições inicial e final
    % Inicial
    tetab_0  = 0;    % rad
    tetabp_0 = 0;    % rad/s      "p" de "ponto"
    im_0     = 0;    % A
    
    % Final
    tetab_f  = pi/2; % rad
    tetabp_f = 0;    % rad/s      "p" de "ponto"
    im_f     = 0;    % A

 %% Modelagem e preparação do sistema linear (chamada de scripts)
    
    MotorDC_1_Parametros;  % Carrega parâmetros do sistema
    MotorDC_2_EspEst;      % Monta o espaço de estados e o discretiza
	MotorDC_3_SisLin;      % Monta a matriz e o vetor independente

    % Resultado: 
    %   M*Sol = vet
    %        M  : matriz de coeficientes
    %       Sol : solução
    %       vet : vetor independente

%% Solução do sistema linear
    % Método referência
    Sol = M\vet;
    
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% Método implementado (preencha-o e depois descomente aqui)
%     Sol = resolveSistema(M,vet);
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%% Tratamento da solução
    
    MotorDC_4_Saidas;       % Recupera as saídas do sistema
                            % (tetab, tetabp, tetabpp e im)
    MotorDC_5_Graficos;     % Plota gráficos destas variáveis
    MotorDC_6_Animacao;     % Animação
    
%% Joga fora algumas coisas...
clear barra color fps hLegend hTitle is i I js j J k n m r...
      index_im index_tetab index_tetabp index_vm limits...
      p1 p10 p2 p20 p3 p30 p4 p40...
      sobra spf th time titleFontSize vetInf vetSup x y xaxis...
      rightXAxisFontSize Rot
