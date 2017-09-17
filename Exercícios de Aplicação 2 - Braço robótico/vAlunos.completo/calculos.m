               
% Plots
global margemX margemY repeticoesVideo
margemX = 0.05; % m
margemY = 0.05; % m
repeticoesVideo = 3; 

%% Par�metros da trajet�ria desejada

disp('Carregando caracter�sticas da par�bola')

% posi��o inicial: (x0, y0)
% posi��o no topo da par�bola: (xT, yT)
% posi��o final: (xF, yF)

% [INFORMA��ES DADAS] -> (x,y)
x0 = 1.80;      % m    inicial
y0 = 0.2;       % m    inicial
flecha = 0.3;   % m    flecha da par�bola -> define o topo
xF = 1.20;      % m    final

% [INFORMA��ES DADAS] -> gama
gamaTrajB = -90;
gamaTrajDelta = 0;
gamaTrajA = gamaTrajDelta / 100; 

% [INFORMA��ES CALCULADAS]
yF = y0;            % m   final
xT = (x0 + xF) / 2; % m   topo
yT = y0 + flecha;   % m   topo


%% Sistema de posicionamento do rob�
disp('Criando fun��o simb�lica da posi��o da garra f(alpha, beta, gama) = (x,y,gama)')

global pRobo pRoboG
syms alpha beta gama grau grau2rad
syms xRobo yRobo angRobo xRoboG yRoboG angRoboG
syms pRobo pRoboG

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


%% Resolu��o da equa��o da par�bola desejada (sistema linear)

disp('Calculando a equa��o da par�bola ')

M = [x0^2 x0 1; 
     xT^2 xT 1;
     xF^2 xF 1];
 
P = [y0 yT yF]';

SOLUCAO = M\P;
a = SOLUCAO(1); % 1/m^2
b = SOLUCAO(2); % 1/m
c = SOLUCAO(3); % 1


%% Trajet�ria (x,y)

disp('Criando a fun��o simb�lica f(t) = (x,y) da par�bola')

% t � um escalar no intervalo [0,100]
% que representa a % (porcentagem) da trajet�ria
syms xTraj yTraj t
                     
xTraj(t) = x0 + (xF - x0)*(t/100);
yTraj(t) = a*xTraj(t)^2 + b*xTraj(t) + c;

% libera as vari�veis
clear M P a b c 
clear x0 y0 xT yT xF yF flecha


%% Trajet�ria angular (gama)

disp('Criando a fun��o simb�lica f(t) = gama do angulo da garra.')

syms gamaTraj gamaTrajG
gamaTrajG(t) = gamaTrajA * t + gamaTrajB; % graus
gamaTraj(t) =  gamaTrajG(t)*pi/180;       % rad


%% Trajet�ria 

disp('Criando a fun��o simb�lica da trajet�ria')

global pTraj pTrajG
syms pTraj pTrajG

pTraj(t) = [xTraj(t) yTraj(t) gamaTraj(t)]';
pTrajG(t) = [xTraj(t) yTraj(t) gamaTrajG(t)]';

clear xTraj yTraj gamaTraj gamaTrajG t


%% Resolu��o do problema

disp('Computa��o das configura��es')

global NPassos

% Vetor de posi��es configura��es (teta1,teta2,gama) do rob�
Z = zeros(NPassos,3);
% Vetor de posi��es 3D DESEJADAS (posi��es ideais)
pIdeal = zeros(NPassos, 3);
% Vetor de posi��es 3D alcan�adas com o m�todo
p = zeros(NPassos, 3);

% Passos 0% a 100%
T = linspace(0, 100, NPassos); 

for i = 1:length(T)
    % Pega o t -> % da trajet�ria
    t = T(i);
    
    % Calcula o ponto em que QUEREMOS o rob� no passo t
    pAlvo = double(pTraj(t));
    
    % Guarda no vetor de posi��es ideais
    pIdeal(i,:) = pAlvo';
    
    % Se for a 1� posi��o
    if(t == 0)
        global chutePosicao0
        % Carrega o chute inicial da 1� posi��o
        Z0 = chutePosicao0*pi/180;
    else
        % Pega a posi��o anterior como chute inicial da posi��o atual
        Z0 = Z(i-1,:)';
    end
    
    % Calcula a configura��o para a posi��o alvo
    Znewton = newton(Z0, pAlvo)';
    
    % Guarda a configura��o no vetor de configura��es
    Z(i,:) = Znewton;
    
    % Calcula e guarda a posi��o no vetor de posi��es alcan�adas
    p(i,:) = double( pRobo( Znewton(1), Znewton(2), Znewton(3) ) )';
end

disp('Computa��o dos angulos dos motores e valida��o')

% Calcula os angulos dos motores
teta = [Z(:,1) (Z(:,2) - Z(:,1)) (Z(:,3) - Z(:,2))];
teta = teta .* (180/pi);

% Checa se os angulos dos motores est�o OK
if min(teta(:)) >= -135 && max(teta(:)) <= 135
    disp('�ngulos dos motores OK.')
else
    disp('ERRO: ocorreu configura��o im poss�vel.')
end

clear i t pAlvo Z0
