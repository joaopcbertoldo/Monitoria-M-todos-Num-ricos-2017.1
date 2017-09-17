%% Espaço de estados

% x = [ tetab 
%       tetabp 
%         im   ]
% u = vm

% Domínio contínuo
    % xp = A*x + B*u
    A = [0       1          0     ;...
         0   -feq/Jeq     Km/Jeq  ;...
         0   -Km/re/Lm   -Rm/Lm  ];
 
    B = [0 0 1/Lm]';
    
    % u = G * x_, x_ = xref - x
    G = [Kp Kd 0];

    % xp = M*x + BG*x
    % M = A - BG
    M = A - B*G;