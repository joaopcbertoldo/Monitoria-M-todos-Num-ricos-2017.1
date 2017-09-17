clear
clc
close all


%% Caracter�sticas do rob�

L1 = 1.5; % m
L2 = 1.0; % m 
L3 = 0.5; % m
Altura = 1.0; % m


%% Sistema de posicionamento do rob�

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


%% Par�metros da trajet�ria desejada

% posi��o inicial: (x0, y0)
% posi��o no topo da par�bola: (xT, yT)
% posi��o final: (xF, yF)

% [INFORMA��ES DADAS]
x0 = 2.1;      % m    inicial
y0 = 0.1;      % m    inicial
flecha = 0.10; % m    flecha da par�bola -> define o topo
xF = 1.9;      % m    final
gamaCTE = -90*pi/180; %rad cte

% [INFORMA��ES CALCULADAS]
yF = y0;            % m   final
xT = (x0 + xF) / 2; % m   topo
yT = y0 + flecha;   % m   topo


%% Resolu��o da equa��o da par�bola desejada (sistema linear)

M = [x0^2 x0 1; 
     xT^2 xT 1;
     xF^2 xF 1];
 
P = [y0 yT yF]';

SOLUCAO = M\P;
a = SOLUCAO(1); % 1/m^2
b = SOLUCAO(2); % 1/m
c = SOLUCAO(3); % 1


%% Trajet�ria (x,y)

% t � um escalar no intervalo [0,100]
% que representa a % (porcentagem) da trajet�ria
syms xTraj yTraj t
                     
xTraj(t) = x0 + (xF - x0)*(t/100);
yTraj(t) = a*xTraj(t)^2 + b*xTraj(t) + c;

% libera as vari�veis
clear M P SOLUCAO a b c 
clear x0 y0 xT yT xF yF flecha


%% Trajet�ria angular (gama)

syms gamaTraj gamaTrajG
gamaTraj(t) = gamaCTE;         % rad
gamaTrajG(t) = gamaCTE*180/pi;  % graus

clear gamaCTE

%% Trajet�ria 

syms pTraj pTrajG
global pTraj pTrajG

pTraj(t) = [xTraj(t) yTraj(t) gamaTraj(t)]';
pTrajG(t) = [xTraj(t) yTraj(t) gamaTrajG(t)]';

clear xTraj yTraj gamaTraj gamaTrajG t

%% Configura��es de imagem para visualiza��o

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


%% Configura��es da solu��o num�rica

global precision iMax
precision = 10^-6; % 1 um (micr�metro)
iMax = 100;

clc