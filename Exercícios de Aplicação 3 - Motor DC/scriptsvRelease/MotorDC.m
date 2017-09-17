% Exerc�cio de aplica��o 3 - Motor DC

% Objetivo - implementar m�todo num�rico para resolver sistema linear.

% Instru��es de entrega 
% Implementar o m�todo dentro do arquivo "resolveSistema.m" e envi�-lo para
% joao.bertoldo@gmail.com (monitor) com c�pia para efcosta@icmc.usp.br 
% (docente) com o assunto "Exerc�cio Adicional 3 - xx", onde "xx"� o seu
% nome.

%% Flush
close all
clear all
clc

%% Discretiza��o do tempo
    Ts = 0.075;             % Time sampling [seg]
    T0 = 0;                 % Instante de tempo inicial [seg]
    Tf = 5;                 % Instante de tempo final [seg]
    t = T0:Ts:Tf;           % Vetor de instantes de tempo [seg]
    K = length(t) - 1;      % K (n�mero de steps)
 
%% Condi��es inicial e final
    % Inicial
    tetab_0  = 0;    % rad
    tetabp_0 = 0;    % rad/s      "p" de "ponto"
    im_0     = 0;    % A
    
    % Final
    tetab_f  = pi/2; % rad
    tetabp_f = 0;    % rad/s      "p" de "ponto"
    im_f     = 0;    % A

 %% Modelagem e prepara��o do sistema linear (chamada de scripts)
    
    MotorDC_1_Parametros;  % Carrega par�metros do sistema
    MotorDC_2_EspEst;      % Monta o espa�o de estados e o discretiza
	MotorDC_3_SisLin;      % Monta a matriz e o vetor independente

    % Resultado: 
    %   M*Sol = vet
    %        M  : matriz de coeficientes
    %       Sol : solu��o
    %       vet : vetor independente

%% Solu��o do sistema linear
    % M�todo refer�ncia
    Sol = M\vet;
    
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% M�todo implementado (preencha-o e depois descomente aqui)
%     Sol = resolveSistema(M,vet);
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%% Tratamento da solu��o
    
    MotorDC_4_Saidas;       % Recupera as sa�das do sistema
                            % (tetab, tetabp, tetabpp e im)
    MotorDC_5_Graficos;     % Plota gr�ficos destas vari�veis
    MotorDC_6_Animacao;     % Anima��o
    
%% Joga fora algumas coisas...
clear barra color fps hLegend hTitle is i I js j J k n m r...
      index_im index_tetab index_tetabp index_vm limits...
      p1 p10 p2 p20 p3 p30 p4 p40...
      sobra spf th time titleFontSize vetInf vetSup x y xaxis...
      rightXAxisFontSize Rot
