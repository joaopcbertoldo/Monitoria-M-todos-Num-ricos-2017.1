clear
clc
close all


%% Características do robô

L1 = 1.5; % m
L2 = 1.0; % m 
L3 = 0.5; % m
Altura = 1.0; % m


%% Sistema de posicionamento do robô

syms alpha beta gama grau grau2rad
syms xRobo yRobo angRobo xRoboG yRoboG angRoboG
syms pRobo pRoboG
global pRobo pRoboG

grau2rad(grau) = grau*pi/180;

xRobo(alpha, beta, gama) = L1*cos(alpha) + L2*cos(beta) + L3*cos(gama); 
yRobo(alpha, beta, gama) = Altura + L1*sin(alpha) + L2*sin(beta) + L3*sin(gama);
angRobo(alpha, beta, gama) = gama;

xRoboG(alpha, beta, gama) = xRobo(grau2rad(alpha), grau2rad(beta), grau2rad(gama)); 
yRoboG(alpha, beta, gama) = yRobo(grau2rad(alpha), grau2rad(beta), grau2rad(gama));
angRoboG(alpha, beta, gama) = gama;

pRobo(alpha, beta, gama) = [xRobo yRobo angRobo]';
pRoboG(alpha, beta, gama) = [xRoboG yRoboG angRoboG]';

clear alpha beta gama xRobo yRobo angRobo xRoboG yRoboG angRoboG grau2rad grau


%% Parâmetros da trajetória desejada

% posição inicial: (x0, y0)
% posição no topo da parábola: (xT, yT)
% posição final: (xF, yF)

% [INFORMAÇÕES DADAS]
x0 = 2.1;      % m    inicial
y0 = 0.1;      % m    inicial
flecha = 0.10; % m    flecha da parábola -> define o topo
xF = 1.9;      % m    final
gamaCTE = -90*pi/180; %rad cte

% [INFORMAÇÕES CALCULADAS]
yF = y0;            % m   final
xT = (x0 + xF) / 2; % m   topo
yT = y0 + flecha;   % m   topo


%% Resolução da equação da parábola desejada (sistema linear)

M = [x0^2 x0 1; 
     xT^2 xT 1;
     xF^2 xF 1];
 
P = [y0 yT yF]';

SOLUCAO = M\P;
a = SOLUCAO(1); % 1/m^2
b = SOLUCAO(2); % 1/m
c = SOLUCAO(3); % 1


%% Trajetória (x,y)

% t é um escalar no intervalo [0,100]
% que representa a % (porcentagem) da trajetória
syms xTraj yTraj t
                     
xTraj(t) = x0 + (xF - x0)*(t/100);
yTraj(t) = a*xTraj(t)^2 + b*xTraj(t) + c;

% libera as variáveis
clear M P SOLUCAO a b c 
clear x0 y0 xT yT xF yF flecha


%% Trajetória angular (gama)

syms gamaTraj gamaTrajG
gamaTraj(t) = gamaCTE;         % rad
gamaTrajG(t) = gamaCTE*180/pi;  % graus

clear gamaCTE

%% Trajetória 

syms pTraj pTrajG
global pTraj pTrajG

pTraj(t) = [xTraj(t) yTraj(t) gamaTraj(t)]';
pTrajG(t) = [xTraj(t) yTraj(t) gamaTrajG(t)]';

clear xTraj yTraj gamaTraj gamaTrajG t

%% Configurações de imagem para visualização

xMin = 0.00; % "m" 
xMax = 2.20; % "m" 
yMin = 0.00; % "m" 
yMax = 1.85; % "m" 
plotLimits = [xMin xMax yMin yMax];
clear xMin xMax yMin yMax

xMin = 1.89; % "m" 
xMax = 2.11; % "m" 
yMin = 0.09; % "m" 
yMax = 0.21; % "m" 
closeLimits = [xMin xMax yMin yMax];
clear xMin xMax yMin yMax


%% Configurações da solução numérica

global precision iMax
precision = 10^-6; % 1 um (micrômetro)
iMax = 100;

clc