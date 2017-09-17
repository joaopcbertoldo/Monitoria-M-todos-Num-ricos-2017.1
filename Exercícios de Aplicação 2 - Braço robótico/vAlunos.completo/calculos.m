               
% Plots
global margemX margemY repeticoesVideo
margemX = 0.05; % m
margemY = 0.05; % m
repeticoesVideo = 3; 

%% Parâmetros da trajetória desejada

disp('Carregando características da parábola')

% posição inicial: (x0, y0)
% posição no topo da parábola: (xT, yT)
% posição final: (xF, yF)

% [INFORMAÇÕES DADAS] -> (x,y)
x0 = 1.80;      % m    inicial
y0 = 0.2;       % m    inicial
flecha = 0.3;   % m    flecha da parábola -> define o topo
xF = 1.20;      % m    final

% [INFORMAÇÕES DADAS] -> gama
gamaTrajB = -90;
gamaTrajDelta = 0;
gamaTrajA = gamaTrajDelta / 100; 

% [INFORMAÇÕES CALCULADAS]
yF = y0;            % m   final
xT = (x0 + xF) / 2; % m   topo
yT = y0 + flecha;   % m   topo


%% Sistema de posicionamento do robô
disp('Criando função simbólica da posição da garra f(alpha, beta, gama) = (x,y,gama)')

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


%% Resolução da equação da parábola desejada (sistema linear)

disp('Calculando a equação da parábola ')

M = [x0^2 x0 1; 
     xT^2 xT 1;
     xF^2 xF 1];
 
P = [y0 yT yF]';

SOLUCAO = M\P;
a = SOLUCAO(1); % 1/m^2
b = SOLUCAO(2); % 1/m
c = SOLUCAO(3); % 1


%% Trajetória (x,y)

disp('Criando a função simbólica f(t) = (x,y) da parábola')

% t é um escalar no intervalo [0,100]
% que representa a % (porcentagem) da trajetória
syms xTraj yTraj t
                     
xTraj(t) = x0 + (xF - x0)*(t/100);
yTraj(t) = a*xTraj(t)^2 + b*xTraj(t) + c;

% libera as variáveis
clear M P a b c 
clear x0 y0 xT yT xF yF flecha


%% Trajetória angular (gama)

disp('Criando a função simbólica f(t) = gama do angulo da garra.')

syms gamaTraj gamaTrajG
gamaTrajG(t) = gamaTrajA * t + gamaTrajB; % graus
gamaTraj(t) =  gamaTrajG(t)*pi/180;       % rad


%% Trajetória 

disp('Criando a função simbólica da trajetória')

global pTraj pTrajG
syms pTraj pTrajG

pTraj(t) = [xTraj(t) yTraj(t) gamaTraj(t)]';
pTrajG(t) = [xTraj(t) yTraj(t) gamaTrajG(t)]';

clear xTraj yTraj gamaTraj gamaTrajG t


%% Resolução do problema

disp('Computação das configurações')

global NPassos

% Vetor de posições configurações (teta1,teta2,gama) do robô
Z = zeros(NPassos,3);
% Vetor de posições 3D DESEJADAS (posições ideais)
pIdeal = zeros(NPassos, 3);
% Vetor de posições 3D alcançadas com o método
p = zeros(NPassos, 3);

% Passos 0% a 100%
T = linspace(0, 100, NPassos); 

for i = 1:length(T)
    % Pega o t -> % da trajetória
    t = T(i);
    
    % Calcula o ponto em que QUEREMOS o robô no passo t
    pAlvo = double(pTraj(t));
    
    % Guarda no vetor de posições ideais
    pIdeal(i,:) = pAlvo';
    
    % Se for a 1ª posição
    if(t == 0)
        global chutePosicao0
        % Carrega o chute inicial da 1ª posição
        Z0 = chutePosicao0*pi/180;
    else
        % Pega a posição anterior como chute inicial da posição atual
        Z0 = Z(i-1,:)';
    end
    
    % Calcula a configuração para a posição alvo
    Znewton = newton(Z0, pAlvo)';
    
    % Guarda a configuração no vetor de configurações
    Z(i,:) = Znewton;
    
    % Calcula e guarda a posição no vetor de posições alcançadas
    p(i,:) = double( pRobo( Znewton(1), Znewton(2), Znewton(3) ) )';
end

disp('Computação dos angulos dos motores e validação')

% Calcula os angulos dos motores
teta = [Z(:,1) (Z(:,2) - Z(:,1)) (Z(:,3) - Z(:,2))];
teta = teta .* (180/pi);

% Checa se os angulos dos motores estão OK
if min(teta(:)) >= -135 && max(teta(:)) <= 135
    disp('Ângulos dos motores OK.')
else
    disp('ERRO: ocorreu configuração im possível.')
end

clear i t pAlvo Z0
