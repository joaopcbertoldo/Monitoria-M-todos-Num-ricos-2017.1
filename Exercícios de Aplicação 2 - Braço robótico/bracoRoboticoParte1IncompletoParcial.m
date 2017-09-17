% Exercício de aplicação 2 - Braço robótico - Parte I

% Objetivo - encontrar uma solução numérica para os ângulos dos motores de
%            do braço robótico de maneira que a garra esteja em uma dada
%            posição (x,y) o plano cartesiano e com o ângulo da garra em um
%            dado ângulo em relação à horizontal.

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
%             vetor de ângulos ou ao vetor posição da garra do robô? Se 
%             não souber, siga até o código do método de Newton e volte
%             aqui para responder.

% Máximo de iterações.
iMax = 20;
% Condição de parada no caso de o método não convergir.

% Notação
%   Z = vetor dos ângulos com a horizontal (alpha,beta,gama).
%       ATENÇÃO: NÃO são os ângulos dos motores. 

% Chute inicial 
Z0 = [-20 0 0]'; % [º]

% Exercício 2: o que é o "chute inicial"? Ou seija, o que significa falar
%             "chute inicial" neste contexto?

% Posição alvo
xAlvo     = 1.80;   % [m]
yAlvo     = 0.10;   % [m]
gamaAlvo  = -90;    % [º] 
% Conversão pra rad
gamaAlvo = gamaAlvo*pi/180;

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
formatSpec = strcat(formatSpec,'\t iMax = %g\n\n');
% Nem com esta...
formatSpec = strcat(formatSpec,'\t Chute inicial (Z0):\n');
formatSpec = strcat(formatSpec,'\t\t alpha = %g º \n');
formatSpec = strcat(formatSpec,'\t\t beta = %g º \n');
formatSpec = strcat(formatSpec,'\t\t gama = %g º\n\n');
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

% Converte o chute inicial para rad
Zk = Z0 * pi / 180; 

% Vetor para guardar as configurações Z das iterações
ZIter = [];

% Vetor para guardar as posições r das iterações
rIter = [];

% Contador de iterações
i = 0;

% Erro relativo: erro com a solução numérica da iteração seguinte com a
%                atual.
err = inf; 

% Exercício 4: o que é "inf"?

% Exercício 5: Pra que serve isto \/ ?
while    (err > precisao && i <= iMax)
    
    % Guarda o valor de Z da iteração
    ZIter = [ZIter ; Zk];
    
    % Pega o alpha, beta e gama da configuração atual
    alpha = Zk(1);
    beta = Zk(2);
    gama = Zk(3);
    
    % Calcula H(alpha,beta,gama) = [ f(alpha,beta,gama)
    %                                g(alpha,beta,gama)
    %                                h(alpha,beta,gama) ]
    
    % Exercício 6: preencha com as expreções de "f", "g" e "h". 
     f = ;
     g = ;
     h = ;
    
    % Coloca os resultados em H 3x1
    H = [f g h]';
    
    % Exercício 7: H é um vetor de números ou expressões?
    
    % Guarda o valor da posição da iteração
    rIter = [rIter ; (H + [xAlvo yAlvo gamaAlvo]')];
    
    % Exercício 8: preencha as expressões dos elementos da matriz Jacobiana.
    
    % Notação: "Jij" é o elemento da linha "i" e coluna "j" na matriz
    %          Jacobiana.
    
    % 1ª linha da matriz Jacobiana
    J11 = ;
    J12 = ;
    J13 = ;
    
    % 2ª linha da matriz Jacobiana
    J21 = ;
    J22 = ;
    J23 = ;
    
    % 3ª linha da matriz Jacobiana
    J31 = ;
    J32 = ;
    J33 = ;
    
    % Monta a matriz Jacobiana 3x3
    J = [J11 J12 J13; 
         J21 J22 J23; 
         J31 J32 J33];
     
    % Exercício 9: J é uma matriz de números ou expressões?
    
    % Calcula o passo seguinte (Zk_1 é o "Z k mais 1")
    Zk_1 = ;
    
    % Exercício 10: preencha com o lado direito da equação do método de
    %             Newton.
    
    % Exercício 11: o que é análogo ao Jacobiano no caso 1D?
    
    % Calcula o erro relativo
    %err = ;
    
    % Exercício 12: preencha com a expressão de cálculo do erro relativo.
    %              O erro relativo neste caso será o módulo do vetor
    %              diferença entre um chute e outro.
    
    % Transforma o passo seguinte no passo atual
    Zk = Zk_1;
    
    % Incrementa o contador de iterações
    i = i + 1;
end

% A resposta é o passo atual
Z = Zk;

% Em graus...
Zgraus = Z.*180/pi;

% Se você não tiver rrespondido o Exercício 1, volte nele e responda.

alpha = Z(1); % rad
beta = Z(2);  % rad
gama = Z(3);  % rad

alphaGraus = Zgraus(1); % º
betaGraus = Zgraus(2);  % º
gamaGraus = Zgraus(3);  % º

% Não se preocupe com esta parte
formatSpec = 'Resposta Z (configurações do robô com referência na horizontal):\n';
formatSpec = strcat(formatSpec,'\t alpha = %g º\n');
formatSpec = strcat(formatSpec,'\t beta = %g º\n');
formatSpec = strcat(formatSpec,'\t gama = %g º\n');
fprintf(formatSpec,alphaGraus,betaGraus,gamaGraus);

%% Verificação dos ângulos dos motores.

% Obs: assegure-se de que o código do método de Newto está rodando
%      corretamente e retornando uma resposta antes de prosseguir.

% Exercício 13: calcule os ângulos dos motores e verifique se os valores
%               estão dentro dos limite (na expresão do IF).

% teta1 = ; 
% teta2 = ;
% teta3 = ;

% teta1Graus = teta1*180/pi; 
% teta2Graus = teta2*180/pi;
% teta3Graus = teta3*180/pi;

% if % PREENCHA -> true se os ângulos forem válidos
%     disp('Ângulos dos motores OK!')
% else
%     disp('Oops, problema nos motores...')
% end

% Descomente aqui se você preencheu acima.
% formatSpec = 'Resposta dos tetas (ângulos dos motores)\n';
% formatSpec = strcat(formatSpec,'\t teta1 = %g º\n');
% formatSpec = strcat(formatSpec,'\t teta2 = %g º\n');
% formatSpec = strcat(formatSpec,'\t teta3 = %g º\n');
% fprintf(formatSpec,teta1Graus,teta2Graus,teta3Graus);
