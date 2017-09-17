function [M,vec] = montaSistemaLinear( a, b, c, d, x0, xf, K )

% Dimensões
n = size(a,1);
m = size(b,2);
r = size(c,1);

% Matriz estados x
Me = zeros( K*n, (K-1)*n );

% Monta a matriz Me
for k = 1:K-1
    
    % Linhazona
    I = k;
    % Primeira linha 
    i = (I-1)*n + 1;
    % Linhas
    is = i:i+n-1;
    
    % Colunona
    J = k;
    % Primeira coluna
    j = (J-1)*n + 1;
    % Colunas
    js = j:j+n-1;
    
    % Escreve elementão identidade
    Me( is , js ) = eye(n);
    
    % Pula uma linhazona...
    I = I + 1;
    i = (I-1)*n + 1;
    is = i:i+n-1;
    
    % Escreve elementão "-a"
    Me( is , js ) = -a;
end

% Matriz comandos u
Mc = zeros( K*n, K*m );

% Monta a matriz Mc
for k = 1:K
    
    % Escreve só na diagonalzona...
    
    I = k;
    i = (I-1)*n + 1;
    is = i:i+n-1;
    
    J = k;
    j = (J-1)*m + 1;
    js = j:j+m-1;
    
    Mc( is , js ) = -b;
end

% Matriz total [ Me | Mc ]
M = [Me Mc];
 
% Vetor independente
vec = zeros( K*n, 1 );

% Estado inicial
vec(1:n) = a*x0;

% Estado final
vec( (end-n+1):end ) = -xf;

end

