%************************************************************************
L1 = 1.0; % m
L2 = 1.0; % m 
L3 = 0.5; % m
Altura = 1.0; % m

    % [INFORMAÇÕES DADAS] -> (x,y)
    x0 = 1.80;      % m    inicial
    y0 = 0.1;      % m    inicial
    flecha = 0.9; % m    flecha da parábola -> define o topo
    xF = 1.00;      % m    final

    % [INFORMAÇÕES DADAS] -> gama
    gamaTrajB = -100;
    gamaTrajDelta = 20;
    gamaTrajA = gamaTrajDelta / 100; 

    
    

    % [INFORMAÇÕES DADAS] -> (x,y)
    x0 = 1.50;      % m    inicial
    y0 = 0.1;      % m    inicial
    flecha = 0.3; % m    flecha da parábola -> define o topo
    xF = 1.20;      % m    final

    % [INFORMAÇÕES DADAS] -> gama
    gamaTrajB = -120;
    gamaTrajDelta = 60;
    gamaTrajA = gamaTrajDelta / 100; 
    
    
    
    
    % [INFORMAÇÕES DADAS] -> (x,y)
    x0 = 1.50;      % m    inicial
    y0 = 0.1;      % m    inicial
    flecha = 0.3; % m    flecha da parábola -> define o topo
    xF = 1.00;      % m    final

    % [INFORMAÇÕES DADAS] -> gama
    gamaTrajB = -120;
    gamaTrajDelta = 60;
    gamaTrajA = gamaTrajDelta / 100; 
    
    
    
    
    
    % [INFORMAÇÕES DADAS] -> (x,y)
    x0 = 1.80;      % m    inicial
    y0 = 0.1;       % m    inicial
    flecha = 0.75;   % m    flecha da parábola -> define o topo
    xF = 0.50;      % m    final

    % [INFORMAÇÕES DADAS] -> gama
    gamaTrajB = -30;
    gamaTrajDelta = -90;
    gamaTrajA = gamaTrajDelta / 100; 



    
    
    % [INFORMAÇÕES DADAS] -> (x,y)
    x0 = 1.00;      % m    inicial
    y0 = 0.1;       % m    inicial
    flecha = 0.5;   % m    flecha da parábola -> define o topo
    xF = 1.50;      % m    final

    % [INFORMAÇÕES DADAS] -> gama
    gamaTrajB = -45;
    gamaTrajDelta = -90;
    gamaTrajA = gamaTrajDelta / 100; 
    
    
    
    % [INFORMAÇÕES DADAS] -> (x,y)
    x0 = 1.35001;      % m    inicial
    y0 = 0.4;       % m    inicial
    flecha = 0.001;   % m    flecha da parábola -> define o topo
    xF = 1.35;      % m    final

    % [INFORMAÇÕES DADAS] -> gama
    gamaTrajB = 0;
    gamaTrajDelta = -150;
    gamaTrajA = gamaTrajDelta / 100; 

global NPassos chutePosicao0
NPassos = 25;
chutePosicao0 = [30 -50 -90]';