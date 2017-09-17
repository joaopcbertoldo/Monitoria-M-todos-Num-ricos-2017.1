function [M,vec] = montaSistemaLinear2( a, b, c, d, x0, xf, K )
 Kp = 0.1;
% Dimensões
n = size(a,1);
m = size(b,2);
r = size(c,1);

% Matriz estados x
MeUp = zeros( (K+1)*n, K*n );

% Monta a matriz Me
for k = 0:K-1
    
    % Linhazona
    I = k+1;
    % Primeira linha 
    i = (I-1)*n + 1;
    % Linhas
    is = i:i+n-1;
    
    % Colunona
    J = k+1;
    % Primeira coluna
    j = (J-1)*n + 1;
    % Colunas
    js = j:j+n-1;
    
    MeUp( is , js ) = eye(n);
    
    I = I+1;
        % Primeira linha 
        i = (I-1)*n + 1;
        % Linhas
        is = i:i+n-1;
    
    if k < K-1
        % Escreve elementão identidade
        % Escreve elementão "-a"
        MeUp( is , js ) = -a;
    else
        MeUp( is , js ) = eye(n);
    end
end

% Matriz comandos u
McUp = zeros( (K+1)*n, K*m );

% Monta a matriz Mc
for k = 0:K-1
    
    % Escreve só na diagonalzona...
    I = k+1;
    i = (I-1)*n + 1;
    is = i:i+n-1;
    
    J = k+1;
    j = (J-1)*m + 1;
    js = j:j+m-1;
    
    McUp( is , js ) = -b;
end


% Matriz estados x
MeDown = zeros( K, K*n );

% Monta a matriz Me
for k = 0:K-1
    i = k+1;
    J = k+1;
    j = (J-1)*n + 1;
    js = j:j+n-1;
%     MeDown( i , js ) = Kp.*[1 0 0];
end

% Matriz comandos u
McDown = zeros( K, K*m );

% Monta a matriz Mc
for k = 0:K-1
    i = k+1;
    j = k+1;
    McDown( i , j ) = 1;
    if k <= K-2
        McDown( i , j+1 ) = -1;
    else
        McDown( i , j-1 ) = -1;
    end
end

% Matriz total [ Me | Mc ]
M = [ MeUp   McUp  ;...
     MeDown McDown];
MUp = [MeUp McUp];
% Vetor independente
vecUp = zeros( (K+1)*n, 1 );

% Estado final
vecUp( (end-n+1):end ) = xf;

% Vetor independente
vecDown = zeros( K, 1 );
% vecDown = xf(1)*Kp.*ones( K, 1 );

vec = [vecUp;vecDown];

end

