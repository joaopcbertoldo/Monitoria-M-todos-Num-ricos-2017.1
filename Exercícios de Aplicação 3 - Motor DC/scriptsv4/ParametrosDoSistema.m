%% Par�metros mec�nicos do bra�o

% Geometria 
    % Comprimento
    lb = 1.00;  % m 
    
    % Largura
    wb = 0.22;  % m
    
    % Espessura
    eb = 0.15;  % m
    
    % Volume
    Vb = lb * wb * eb; % m^3

% Material
    % Densidade
    mu_aco = 8; % kg/m^3

% Massa, momento de in�rcia e atrito viscoso do acoplamento
    % Massa
    mb = mu_aco * Vb; % kg
    
    % Momento de in�rcia do bra�o em torno do eixo que passa pelo CG
    Jb_cg = mb/12 * (wb^2 + lb^2); % kg*m^2
    
    % Dist�ncia entre o eixo do CG e do eixo de acoplamento
    d_E = 0.40; % m
    
    % Momento de in�rcia do bra�o em torno do eixo de acoplamento
    Jb = Jb_cg + mb * d_E^2; % kg*m^2
    
    % Coeficiente de atrito viscoso no eixo de acoplamento
    fb = 0.2; % N*m/(rad/s)
    
%% Par�metros do motor cc

% Par�metros mec�nicos
    % Rela��o de engrenamento 
    re = 60; % 60:1

    % Momento de in�rcia do motor (interno)
    Jm = 0.02; % kg*m^2
    
    % Coeficiente de atrito viscoso no eixo do motor (interno)
    fm = 0.2; % N*m/(rad/s)
    
% Par�metros el�tricos
    % Constante de torque
    Km = 0.1; % ????
    
    % Resist�ncia el�trica do motor
    Rm = 2; % Ohm
    
    % Indut�ncia do motor
    Lm = 0.5; % H
    
    % Constante de proporcionalidade do controlador
    Kp = 15;

%% Par�metros mec�nicos equivalentes

    % In�rcia equivalente
    Jeq = Jm/re + Jb*re; % kg*m^2   
    
    % Atrito viscoso equivalente
    feq = fm/re + Jb*re; % N*m/(rad/s)