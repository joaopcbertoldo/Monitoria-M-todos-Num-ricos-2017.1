% Exercício de aplicação 2 - Braço robótico - Parte I

% Objetivo - encontrar uma solução numérica para os ângulos dos motores de
%            do braço robótico de maneira que a garra esteja em uma dada
%            posição (x,y) o plano cartesiano e com o ângulo da garra em um
%            dado ângulo em relação à horizontal.

% Instruções de entrega 
% Escrever as respostas dos exercícios em um .txt ou em uma folha de papel
% (e tirar foto). Enviar os resultados para joao.bertoldo@gmail.com
% (monitor) com cópia para efcosta@icmc.usp.br (docente).

% IMPORTANTE: responda sucintamente. O objetivo é que você reflita sobre as
% questões, não se trata de uma prova.

% Flush
clear
close all
clc

%% Parâmetros do robô

% Notação:
%   L --> tamanho de um braço do robô.
%   Altura --> altura da base do primeiro braço em relação ao chão.

L1 = 1.0;       % [m]
L2 = 1.0;       % [m]
L3 = 0.5;       % [m]
Altura = 1.00;  % [m]

%% Configurações do método numérico

% Precisão.
precisao = 10^-6;  
% A condição de parada é que o erro relativo seja menor que a precisão.

% Exercício 1: qual a unidade da precição? Dica: a precisão se refere ao
%             vetor de ângulos (Z) ou ao vetor posição da garra do robô (r)? 
%             Se não souber, siga até o código do método de Newton e volte
%             aqui para responder.

% Máximo de iterações.
iMax = 20;
% Condição de parada no caso de o método não convergir.

% Notação
%   Z = vetor dos ângulos com a horizontal (alpha,beta,gama).
%       ATENÇÃO: NÃO são os ângulos dos motores. 

% Chute inicial (3x1)
Z0 = [30 -50 -90]'; % [º]

% Exercício 2: o que é o "chute inicial"? Ou seija, o que significa falar
%             "chute inicial" neste contexto em relação ao robô?

% Posição alvo
xAlvo     = 1.80;  % [m]
yAlvo     = 0.10;  % [m]
gamaAlvo  = -90;    % [º]

% Converte o gamaAlvo em radianos
gamaAlvo = gamaAlvo * pi / 180; % [rad]

% Exercício 3: o que é a "posição alvo"?

%% Escreve as configurações do console

% Não se preocupe com essa parte...
formatSpec = 'Parâmetros do robô:\n';
formatSpec = strcat(formatSpec,'\t L1 = %g m\n');
formatSpec = strcat(formatSpec,'\t L2 = %g m\n');
formatSpec = strcat(formatSpec,'\t L3 = %g m\n');
formatSpec = strcat(formatSpec,'\t Altura = %g m\n\n');
% Nem com esta...
formatSpec = strcat(formatSpec,'Configurações do método numérico\n');
formatSpec = strcat(formatSpec,'\t Precisão = %g m\n');
formatSpec = strcat(formatSpec,'\t iMax = %g\n');
% Nem com esta...
formatSpec = strcat(formatSpec,'\t Chute inicial (Z0):\n');
formatSpec = strcat(formatSpec,'\t\t alpha = %g º \n');
formatSpec = strcat(formatSpec,'\t\t beta = %g º \n');
formatSpec = strcat(formatSpec,'\t\t gama = %g º\n');
% Muito menos com esta...
formatSpec = strcat(formatSpec,'\t Posição alvo:\n');
formatSpec = strcat(formatSpec,'\t\t x = %g m \n');
formatSpec = strcat(formatSpec,'\t\t y = %g m \n');
formatSpec = strcat(formatSpec,'\t\t gama = %g º\n\n');
% É só para imprimir as configurações no console ( :
fprintf(formatSpec,...
        L1, L2, L3, Altura,...
        precisao, iMax,...
        Z0(1), Z0(2), Z0(3),...
        xAlvo, yAlvo, gamaAlvo);

%% Método de Newton

% Exercício 4: Converta o chute inicial de graus para radianos. Armazene o
%              resultado na variável Zk (3x1).

Zk = % PREENCHER

% Contador de iterações
i = 0;

% Erro relativo: diferença absoluta entre a soluções numéricas de duas
%                iterações consecutivas dividida pela iteração de maior k.
err = inf; 

% Exercício 5: o que é "inf"? Dica: use o help ou a referência do MATLAB.

% Exercício 6: 
%          Pra que serve isto \/ ?
while err > precisao && i <= iMax
    
    % Pega o alpha, beta e gama da configuração atual
    alpha = Zk(1);
    beta = Zk(2);
    gama = Zk(3);
    
    % Calcula H(alpha,beta,gama) = [ f(alpha,beta,gama);
    %                                g(alpha,beta,gama);
    %                                h(alpha,beta,gama); ]
    
    % Exercício 7: preencha com as expreções de "f", "g" e "h". 
    f = % PREENCHER
    g = % PREENCHER
    h = % PREENCHER
    
    % Coloca os resultados em H (3x1)
    H = [f g h]';
    
    % Exercício 8: H é um vetor de números, expressões ou funções (function)?
    
    % Exercício 9: preencha as expressões dos elementos da Jacobiana.
    
    % Notação: "Jij" é o elemento da linha "i" e coluna "j" na matriz
    %          Jacobiana.
    
    % Lembrete: na matriz Jacobiana, cada linha tem uma função diferente e
    %           cada coluna tem uma derivada parcial em uma variável
    %           diferente. Ou seja, variar a linha significa variar a
    %           função e variar a coluna significa variar a derivada
    %           parcial.
    
    % 1ª linha da matriz Jacobiana
    J11 = % PREENCHER
    J12 = % PREENCHER
    J13 = % PREENCHER
    
    % 2ª linha da matriz Jacobiana
    J21 = % PREENCHER
    J22 = % PREENCHER
    J23 = % PREENCHER
    
    % 3ª linha da matriz Jacobiana
    J31 = % PREENCHER
    J32 = % PREENCHER
    J33 = % PREENCHER
    
    % Monta a matriz Jacobiana (3x3)
    J = [J11 J12 J13; 
         J21 J22 J23; 
         J31 J32 J33];
     
    % Exercício 10: J é uma matriz de números, expressões ou funções (function)?
    
    % Calcula o passo seguinte (Zk_1 é o "Z k mais 1")
    
    % Exercício 11: preencha com o lado direito da equação do método de
    %             Newton usando H , J e Zk.
    
    Zk_1 = % PREENCHER
    
    % Exercício 12: o que é análogo à matriz Jacobiana no caso do método de
    %               Newton em 1D? Obs: você já percebeu que estamos em 3D,
    %               né?
    
    % Calcula o erro relativo
    
    % Exercício 13: preencha com a expressão de cálculo do erro relativo.
    %               O erro relativo, neste caso, usa a diferença de vetores
    %               e o "valor aboluto" é a norma de um vetor. 
    %               Volte às linhas 111-113 para ver a definição. 
    %               Dica: função "norm" (use o help).
    
    err = % PREENCHER
    
    % Transforma o passo seguinte (calculado) no passo atual
    Zk = Zk_1;
    
    % Incrementa o contador de iterações
    i = i + 1;
end

%% Resposta

% A resposta é o passo atual
Z = Zk;

% Exercício 14: Converta a resposta, que está em radianos, para graus. 
%               Armazene o resultado na variável Zgraus (3x1).

Zgraus = % PREENCHER

% Se você não tiver rrespondido o Exercício 1, volte nele e responda.

alpha = Z(1); % rad
beta = Z(2);  % rad
gama = Z(3);  % rad

alphaGraus = Zgraus(1); % º
betaGraus = Zgraus(2);  % º
gamaGraus = Zgraus(3);  % º

% Não se preocupe com esta parte...
formatSpec = 'Resposta Z (configurações do robô com referência na horizontal):\n';
formatSpec = strcat(formatSpec,'\t alpha = %g º\n');
formatSpec = strcat(formatSpec,'\t beta = %g º\n');
formatSpec = strcat(formatSpec,'\t gama = %g º\n\n');

fprintf(formatSpec,alphaGraus,betaGraus,gamaGraus)

%% Verificação dos ângulos dos motores.

% Obs: assegure-se de que o código do método de Newton está rodando
%      corretamente e retornando uma resposta antes de prosseguir. Quando
%      o método estiver OK, exclua a linha "return" abaixo.

return 

% Exercício 15: calcule os ângulos dos motores (em graus) e verifique se 
%               os valores estão dentro dos limites (na expresão do IF*).

%               *A expressão deve retornar true se todos os ângulos
%               estiverem OK.

teta1 = ; 
teta2 = ;
teta3 = ;

if ()
    formatSpec = 'Resposta dos ângulos dos motores OK!\n';
else
    formatSpec = 'Resposta dos ângulos dos motores NÃO É VÁLIDA...\n';
end

% Ignore esta parte...
formatSpec = strcat(formatSpec,'\t teta1 = %g º\n');
formatSpec = strcat(formatSpec,'\t teta2 = %g º\n');
formatSpec = strcat(formatSpec,'\t teta3 = %g º\n');

fprintf(formatSpec,teta1Graus,teta2Graus,teta3Graus)

%% Desenho da posição do robô

% Obs: assegure-se de que o código do método de Newton está rodando
%      corretamente e retornando uma resposta antes de prosseguir. Quando
%      o método estiver OK, exclua a linha "return" abaixo.

return 

% Para desenhar o robô, vamos fazer uma reta representando cada braço do
% robô. Então, precisamos conhecer os pontos do robô para ligá-los. É
% preciso saber a posição da base e da ponta de cada braço. Como temos 3
% braços, são, no total, 6 pontos (x,y) a serem computados.

% Vamos organizar estes pontos em matrizes 2x2 que representam, cada uma,
% um braço do robô. A primeira linha é a posição da base e a segunda linha
% é a ponta do braço. A primeira coluna é coordenada X e a segunda a
% coordenada Y dos pontos.

% braco = | baseX   baseY  |
%         | pontaX  pontaY |

% Braço 1 *****************************************
braco1BaseX = 0;
braco1BaseY = Altura;

braco1PontaX = braco1BaseX + L1 * cos(alpha);
braco1PontaY = braco1BaseY + L1 * sin(alpha);

% Exercício 16: 
%                   para que serve isso \/ ?
braco1 = [braco1BaseX     braco1BaseY  ;... 
          braco1PontaX    braco1PontaY];

% Braço 2 *****************************************
braco2BaseX = braco1PontaX;
braco2BaseY = braco1PontaY;

braco2PontaX = braco2BaseX + L1 * cos(beta);
braco2PontaY = braco2BaseY + L2 * sin(beta);

braco2 = [braco2BaseX     braco2BaseY  ;... 
          braco2PontaX    braco2PontaY];

% Braço 3 *****************************************
      
% Exercício 17: complete o braco3 com as expressões para calcular os 
%               valores de x e y da base e da ponta do braco3.

braco3BaseX = % PREENCHER
braco3BaseY = % PREENCHER

braco3PontaX = % PREENCHER
braco3PontaY = % PREENCHER

braco3 = [braco3BaseX     braco3BaseY  ;... 
          braco3PontaX    braco3PontaY];

X = [braco1(:,1); braco2(:,1); braco3(:,1)];
Y = [braco1(:,2); braco2(:,2); braco3(:,2)];

figure('Name', 'Desenho do robô')
desenho = plot(X,Y);

% Exercício 18: para que serve a função axis?
limits = [min(X) max(X) min(Y) max(Y)] + [0 +0.1 -0.1 +0.1];
axis(limits)

% Exercício 19: coloque um título no plot e nos eixos.

% Bônus: use outras posições alvo e outros chutes iniciais. Há alguns
% exemplos no arquivo "valores.m"