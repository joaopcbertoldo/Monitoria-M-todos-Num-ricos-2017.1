%% Estados inicial e final

% x = [ tetab 
%       tetabp 
%        im   ]

% x0 
x0 = [tetab_0   tetabp_0   im_0]';

% xf
xf = [tetab_f   tetabp_f   im_f]';

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
    
    % y = C*x + D*u
    C = [ 1           0                 0     ;...
          0           1                 0     ;...      
          0       -feq/Jeq            Km/Jeq  ;...
          0           0                 1    ];
    
    D = [0 0 0 0]';
 
    % Espaço de estados contínuo
    sys_c = ss(A,B,C,D);

% Domínio discreto
    % Espaço de estados discreto
    sys_d = c2d(sys_c, Ts);
    
    % xk+1 = a*xk + b*uk
    a = sys_d.a;
    b = sys_d.b;

    % yk = c*xk + d*uk
    c = sys_d.c;
    d = sys_d.d;