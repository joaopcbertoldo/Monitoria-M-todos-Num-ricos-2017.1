% Exerc�cio de aplica��o 2 - Bra�o rob�tico - Parte I

% Objetivo - encontrar uma solu��o num�rica para os �ngulos dos motores de
%            do bra�o rob�tico de maneira que a garra esteja em uma dada
%            posi��o (x,y) o plano cartesiano e com o �ngulo da garra em um
%            dado �ngulo em rela��o � horizontal.

% Instru��es de entrega 
% Escrever as respostas dos exerc�cios em um .txt ou em uma folha de papel
% (e tirar foto). Enviar os resultados para joao.bertoldo@gmail.com
% (monitor) com c�pia para efcosta@icmc.usp.br (docente).

% IMPORTANTE: responda sucintamente. O objetivo � que voc� reflita sobre as
% quest�es, n�o se trata de uma prova.

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
%             vetor de �ngulos (Z) ou ao vetor posi��o da garra do rob� (r)? 
%             Se n�o souber, siga at� o c�digo do m�todo de Newton e volte
%             aqui para responder.

% M�ximo de itera��es.
iMax = 20;
% Condi��o de parada no caso de o m�todo n�o convergir.

% Nota��o
%   Z = vetor dos �ngulos com a horizontal (alpha,beta,gama).
%       ATEN��O: N�O s�o os �ngulos dos motores. 

% Chute inicial (3x1)
Z0 = [30 -50 -90]'; % [�]

% Exerc�cio 2: o que � o "chute inicial"? Ou seija, o que significa falar
%             "chute inicial" neste contexto em rela��o ao rob�?

% Posi��o alvo
xAlvo     = 1.80;  % [m]
yAlvo     = 0.10;  % [m]
gamaAlvo  = -90;    % [�]

% Converte o gamaAlvo em radianos
gamaAlvo = gamaAlvo * pi / 180; % [rad]

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
formatSpec = strcat(formatSpec,'\t iMax = %g\n');
% Nem com esta...
formatSpec = strcat(formatSpec,'\t Chute inicial (Z0):\n');
formatSpec = strcat(formatSpec,'\t\t alpha = %g � \n');
formatSpec = strcat(formatSpec,'\t\t beta = %g � \n');
formatSpec = strcat(formatSpec,'\t\t gama = %g �\n');
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

% Exerc�cio 4: Converta o chute inicial de graus para radianos. Armazene o
%              resultado na vari�vel Zk (3x1).

Zk = % PREENCHER

% Contador de itera��es
i = 0;

% Erro relativo: diferen�a absoluta entre a solu��es num�ricas de duas
%                itera��es consecutivas dividida pela itera��o de maior k.
err = inf; 

% Exerc�cio 5: o que � "inf"? Dica: use o help ou a refer�ncia do MATLAB.

% Exerc�cio 6: 
%          Pra que serve isto \/ ?
while err > precisao && i <= iMax
    
    % Pega o alpha, beta e gama da configura��o atual
    alpha = Zk(1);
    beta = Zk(2);
    gama = Zk(3);
    
    % Calcula H(alpha,beta,gama) = [ f(alpha,beta,gama);
    %                                g(alpha,beta,gama);
    %                                h(alpha,beta,gama); ]
    
    % Exerc�cio 7: preencha com as expre��es de "f", "g" e "h". 
    f = % PREENCHER
    g = % PREENCHER
    h = % PREENCHER
    
    % Coloca os resultados em H (3x1)
    H = [f g h]';
    
    % Exerc�cio 8: H � um vetor de n�meros, express�es ou fun��es (function)?
    
    % Exerc�cio 9: preencha as express�es dos elementos da Jacobiana.
    
    % Nota��o: "Jij" � o elemento da linha "i" e coluna "j" na matriz
    %          Jacobiana.
    
    % Lembrete: na matriz Jacobiana, cada linha tem uma fun��o diferente e
    %           cada coluna tem uma derivada parcial em uma vari�vel
    %           diferente. Ou seja, variar a linha significa variar a
    %           fun��o e variar a coluna significa variar a derivada
    %           parcial.
    
    % 1� linha da matriz Jacobiana
    J11 = % PREENCHER
    J12 = % PREENCHER
    J13 = % PREENCHER
    
    % 2� linha da matriz Jacobiana
    J21 = % PREENCHER
    J22 = % PREENCHER
    J23 = % PREENCHER
    
    % 3� linha da matriz Jacobiana
    J31 = % PREENCHER
    J32 = % PREENCHER
    J33 = % PREENCHER
    
    % Monta a matriz Jacobiana (3x3)
    J = [J11 J12 J13; 
         J21 J22 J23; 
         J31 J32 J33];
     
    % Exerc�cio 10: J � uma matriz de n�meros, express�es ou fun��es (function)?
    
    % Calcula o passo seguinte (Zk_1 � o "Z k mais 1")
    
    % Exerc�cio 11: preencha com o lado direito da equa��o do m�todo de
    %             Newton usando H , J e Zk.
    
    Zk_1 = % PREENCHER
    
    % Exerc�cio 12: o que � an�logo � matriz Jacobiana no caso do m�todo de
    %               Newton em 1D? Obs: voc� j� percebeu que estamos em 3D,
    %               n�?
    
    % Calcula o erro relativo
    
    % Exerc�cio 13: preencha com a express�o de c�lculo do erro relativo.
    %               O erro relativo, neste caso, usa a diferen�a de vetores
    %               e o "valor aboluto" � a norma de um vetor. 
    %               Volte �s linhas 111-113 para ver a defini��o. 
    %               Dica: fun��o "norm" (use o help).
    
    err = % PREENCHER
    
    % Transforma o passo seguinte (calculado) no passo atual
    Zk = Zk_1;
    
    % Incrementa o contador de itera��es
    i = i + 1;
end

%% Resposta

% A resposta � o passo atual
Z = Zk;

% Exerc�cio 14: Converta a resposta, que est� em radianos, para graus. 
%               Armazene o resultado na vari�vel Zgraus (3x1).

Zgraus = % PREENCHER

% Se voc� n�o tiver rrespondido o Exerc�cio 1, volte nele e responda.

alpha = Z(1); % rad
beta = Z(2);  % rad
gama = Z(3);  % rad

alphaGraus = Zgraus(1); % �
betaGraus = Zgraus(2);  % �
gamaGraus = Zgraus(3);  % �

% N�o se preocupe com esta parte...
formatSpec = 'Resposta Z (configura��es do rob� com refer�ncia na horizontal):\n';
formatSpec = strcat(formatSpec,'\t alpha = %g �\n');
formatSpec = strcat(formatSpec,'\t beta = %g �\n');
formatSpec = strcat(formatSpec,'\t gama = %g �\n\n');

fprintf(formatSpec,alphaGraus,betaGraus,gamaGraus)

%% Verifica��o dos �ngulos dos motores.

% Obs: assegure-se de que o c�digo do m�todo de Newton est� rodando
%      corretamente e retornando uma resposta antes de prosseguir. Quando
%      o m�todo estiver OK, exclua a linha "return" abaixo.

return 

% Exerc�cio 15: calcule os �ngulos dos motores (em graus) e verifique se 
%               os valores est�o dentro dos limites (na expres�o do IF*).

%               *A express�o deve retornar true se todos os �ngulos
%               estiverem OK.

teta1 = ; 
teta2 = ;
teta3 = ;

if ()
    formatSpec = 'Resposta dos �ngulos dos motores OK!\n';
else
    formatSpec = 'Resposta dos �ngulos dos motores N�O � V�LIDA...\n';
end

% Ignore esta parte...
formatSpec = strcat(formatSpec,'\t teta1 = %g �\n');
formatSpec = strcat(formatSpec,'\t teta2 = %g �\n');
formatSpec = strcat(formatSpec,'\t teta3 = %g �\n');

fprintf(formatSpec,teta1Graus,teta2Graus,teta3Graus)

%% Desenho da posi��o do rob�

% Obs: assegure-se de que o c�digo do m�todo de Newton est� rodando
%      corretamente e retornando uma resposta antes de prosseguir. Quando
%      o m�todo estiver OK, exclua a linha "return" abaixo.

return 

% Para desenhar o rob�, vamos fazer uma reta representando cada bra�o do
% rob�. Ent�o, precisamos conhecer os pontos do rob� para lig�-los. �
% preciso saber a posi��o da base e da ponta de cada bra�o. Como temos 3
% bra�os, s�o, no total, 6 pontos (x,y) a serem computados.

% Vamos organizar estes pontos em matrizes 2x2 que representam, cada uma,
% um bra�o do rob�. A primeira linha � a posi��o da base e a segunda linha
% � a ponta do bra�o. A primeira coluna � coordenada X e a segunda a
% coordenada Y dos pontos.

% braco = | baseX   baseY  |
%         | pontaX  pontaY |

% Bra�o 1 *****************************************
braco1BaseX = 0;
braco1BaseY = Altura;

braco1PontaX = braco1BaseX + L1 * cos(alpha);
braco1PontaY = braco1BaseY + L1 * sin(alpha);

% Exerc�cio 16: 
%                   para que serve isso \/ ?
braco1 = [braco1BaseX     braco1BaseY  ;... 
          braco1PontaX    braco1PontaY];

% Bra�o 2 *****************************************
braco2BaseX = braco1PontaX;
braco2BaseY = braco1PontaY;

braco2PontaX = braco2BaseX + L1 * cos(beta);
braco2PontaY = braco2BaseY + L2 * sin(beta);

braco2 = [braco2BaseX     braco2BaseY  ;... 
          braco2PontaX    braco2PontaY];

% Bra�o 3 *****************************************
      
% Exerc�cio 17: complete o braco3 com as express�es para calcular os 
%               valores de x e y da base e da ponta do braco3.

braco3BaseX = % PREENCHER
braco3BaseY = % PREENCHER

braco3PontaX = % PREENCHER
braco3PontaY = % PREENCHER

braco3 = [braco3BaseX     braco3BaseY  ;... 
          braco3PontaX    braco3PontaY];

X = [braco1(:,1); braco2(:,1); braco3(:,1)];
Y = [braco1(:,2); braco2(:,2); braco3(:,2)];

figure('Name', 'Desenho do rob�')
desenho = plot(X,Y);

% Exerc�cio 18: para que serve a fun��o axis?
limits = [min(X) max(X) min(Y) max(Y)] + [0 +0.1 -0.1 +0.1];
axis(limits)

% Exerc�cio 19: coloque um t�tulo no plot e nos eixos.

% B�nus: use outras posi��es alvo e outros chutes iniciais. H� alguns
% exemplos no arquivo "valores.m"