% Exerc�cio de aplica��o 2 - Bra�o rob�tico - Parte I

% Objetivo - encontrar uma solu��o num�rica para os �ngulos dos motores de
%            do bra�o rob�tico de maneira que a garra esteja em uma dada
%            posi��o (x,y) o plano cartesiano e com o �ngulo da garra em um
%            dado �ngulo em rela��o � horizontal.

% Flush
clear
close all
clc

%% Par�metros do rob�

% Nota��o:
%   L --> tamanho de um bra�o do rob�.
%   Altura --> altura da base do primeiro bra�o em rela��o ao ch�o.

L1 = 1.0;       % [m]
L2 = 1.0;       % [m]
L3 = 0.5;       % [m]
Altura = 1.00;  % [m]

%% Configura��es do m�todo num�rico

% Precis�o.
precisao = 10^-6;  
% A condi��o de parada � que o erro relativo seja menor que a precis�o.

% Exerc�cio 1: qual a unidade da preci��o? Dica: a precis�o se refere ao
%             vetor de �ngulos ou ao vetor posi��o da garra do rob�? Se 
%             n�o souber, siga at� o c�digo do m�todo de Newton e volte
%             aqui para responder.

% M�ximo de itera��es.
iMax = 20;
% Condi��o de parada no caso de o m�todo n�o convergir.

% Nota��o
%   Z = vetor dos �ngulos com a horizontal (alpha,beta,gama).
%       ATEN��O: N�O s�o os �ngulos dos motores. 

% Chute inicial 
Z0 = [-20 0 0]'; % [�]

% Exerc�cio 2: o que � o "chute inicial"? Ou seija, o que significa falar
%             "chute inicial" neste contexto?

% Posi��o alvo
xAlvo     = 1.80;   % [m]
yAlvo     = 0.10;   % [m]
gamaAlvo  = -90;    % [�] 
% Convers�o pra rad
gamaAlvo = gamaAlvo*pi/180;

% Exerc�cio 3: o que � a "posi��o alvo"?

%% Escreve as configura��es do console

% N�o se preocupe com essa parte...
formatSpec = 'Par�metros do rob�:\n';
formatSpec = strcat(formatSpec,'\t L1 = %g m\n');
formatSpec = strcat(formatSpec,'\t L2 = %g m\n');
formatSpec = strcat(formatSpec,'\t L3 = %g m\n');
formatSpec = strcat(formatSpec,'\t Altura = %g m\n\n');
% Nem com esta...
formatSpec = strcat(formatSpec,'Configura��es do m�todo num�rico\n');
formatSpec = strcat(formatSpec,'\t Precis�o = %g m\n');
formatSpec = strcat(formatSpec,'\t iMax = %g\n\n');
% Nem com esta...
formatSpec = strcat(formatSpec,'\t Chute inicial (Z0):\n');
formatSpec = strcat(formatSpec,'\t\t alpha = %g � \n');
formatSpec = strcat(formatSpec,'\t\t beta = %g � \n');
formatSpec = strcat(formatSpec,'\t\t gama = %g �\n\n');
% Muito menos com esta...
formatSpec = strcat(formatSpec,'\t Posi��o alvo:\n');
formatSpec = strcat(formatSpec,'\t\t x = %g m \n');
formatSpec = strcat(formatSpec,'\t\t y = %g m \n');
formatSpec = strcat(formatSpec,'\t\t gama = %g �\n\n');
% � s� para imprimir as configura��es no console ( :
fprintf(formatSpec,...
        L1, L2, L3, Altura,...
        precisao, iMax,...
        Z0(1), Z0(2), Z0(3),...
        xAlvo, yAlvo, gamaAlvo);

%% M�todo de Newton

% Converte o chute inicial para rad
Zk = Z0 * pi / 180; 

% Vetor para guardar as configura��es Z das itera��es
ZIter = [];

% Vetor para guardar as posi��es r das itera��es
rIter = [];

% Contador de itera��es
i = 0;

% Erro relativo: erro com a solu��o num�rica da itera��o seguinte com a
%                atual.
err = inf; 

% Exerc�cio 4: o que � "inf"?

% Exerc�cio 5: Pra que serve isto \/ ?
while    (err > precisao && i <= iMax)
    
    % Guarda o valor de Z da itera��o
    ZIter = [ZIter ; Zk];
    
    % Pega o alpha, beta e gama da configura��o atual
    alpha = Zk(1);
    beta = Zk(2);
    gama = Zk(3);
    
    % Calcula H(alpha,beta,gama) = [ f(alpha,beta,gama)
    %                                g(alpha,beta,gama)
    %                                h(alpha,beta,gama) ]
    
    % Exerc�cio 6: preencha com as expre��es de "f", "g" e "h". 
     f = ;
     g = ;
     h = ;
    
    % Coloca os resultados em H 3x1
    H = [f g h]';
    
    % Exerc�cio 7: H � um vetor de n�meros ou express�es?
    
    % Guarda o valor da posi��o da itera��o
    rIter = [rIter ; (H + [xAlvo yAlvo gamaAlvo]')];
    
    % Exerc�cio 8: preencha as express�es dos elementos da matriz Jacobiana.
    
    % Nota��o: "Jij" � o elemento da linha "i" e coluna "j" na matriz
    %          Jacobiana.
    
    % 1� linha da matriz Jacobiana
    J11 = ;
    J12 = ;
    J13 = ;
    
    % 2� linha da matriz Jacobiana
    J21 = ;
    J22 = ;
    J23 = ;
    
    % 3� linha da matriz Jacobiana
    J31 = ;
    J32 = ;
    J33 = ;
    
    % Monta a matriz Jacobiana 3x3
    J = [J11 J12 J13; 
         J21 J22 J23; 
         J31 J32 J33];
     
    % Exerc�cio 9: J � uma matriz de n�meros ou express�es?
    
    % Calcula o passo seguinte (Zk_1 � o "Z k mais 1")
    Zk_1 = ;
    
    % Exerc�cio 10: preencha com o lado direito da equa��o do m�todo de
    %             Newton.
    
    % Exerc�cio 11: o que � an�logo ao Jacobiano no caso 1D?
    
    % Calcula o erro relativo
    %err = ;
    
    % Exerc�cio 12: preencha com a express�o de c�lculo do erro relativo.
    %              O erro relativo neste caso ser� o m�dulo do vetor
    %              diferen�a entre um chute e outro.
    
    % Transforma o passo seguinte no passo atual
    Zk = Zk_1;
    
    % Incrementa o contador de itera��es
    i = i + 1;
end

% A resposta � o passo atual
Z = Zk;

% Em graus...
Zgraus = Z.*180/pi;

% Se voc� n�o tiver rrespondido o Exerc�cio 1, volte nele e responda.

alpha = Z(1); % rad
beta = Z(2);  % rad
gama = Z(3);  % rad

alphaGraus = Zgraus(1); % �
betaGraus = Zgraus(2);  % �
gamaGraus = Zgraus(3);  % �

% N�o se preocupe com esta parte
formatSpec = 'Resposta Z (configura��es do rob� com refer�ncia na horizontal):\n';
formatSpec = strcat(formatSpec,'\t alpha = %g �\n');
formatSpec = strcat(formatSpec,'\t beta = %g �\n');
formatSpec = strcat(formatSpec,'\t gama = %g �\n');
fprintf(formatSpec,alphaGraus,betaGraus,gamaGraus);

%% Verifica��o dos �ngulos dos motores.

% Obs: assegure-se de que o c�digo do m�todo de Newto est� rodando
%      corretamente e retornando uma resposta antes de prosseguir.

% Exerc�cio 13: calcule os �ngulos dos motores e verifique se os valores
%               est�o dentro dos limite (na expres�o do IF).

% teta1 = ; 
% teta2 = ;
% teta3 = ;

% teta1Graus = teta1*180/pi; 
% teta2Graus = teta2*180/pi;
% teta3Graus = teta3*180/pi;

% if % PREENCHA -> true se os �ngulos forem v�lidos
%     disp('�ngulos dos motores OK!')
% else
%     disp('Oops, problema nos motores...')
% end

% Descomente aqui se voc� preencheu acima.
% formatSpec = 'Resposta dos tetas (�ngulos dos motores)\n';
% formatSpec = strcat(formatSpec,'\t teta1 = %g �\n');
% formatSpec = strcat(formatSpec,'\t teta2 = %g �\n');
% formatSpec = strcat(formatSpec,'\t teta3 = %g �\n');
% fprintf(formatSpec,teta1Graus,teta2Graus,teta3Graus);
