% Dimensões
n = size(a,1);
m = size(b,2);
r = size(c,1);

% mudar pra usar kron...

aux1 = eye(K+1);

% Matriz estados x superior
MeSup = zeros( (K+1)*n, K*n );

% Monta a matriz de estados superior
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
    
    % Identidade...
    MeSup( is , js ) = eye(n);
    
    % Pula uma linhazona
    I = I+1;
    i = (I-1)*n + 1;
    is = i:i+n-1;
    
    if k < K-1
        % Escreve elementão "-a"
        MeSup( is , js ) = -a;
    else
        % Na última linha é apenas a identidade
        MeSup( is , js ) = eye(n);
    end
end

% Matriz comandos superior
McSup = zeros( (K+1)*n, K*m );

% Monta a matriz comandos superior
for k = 0:K-1
    
    % Escreve só na diagonalzona...
    I = k+1;
    i = (I-1)*n + 1;
    is = i:i+n-1;
    
    J = k+1;
    j = (J-1)*m + 1;
    js = j:j+m-1;
    
    % Escreve vetor "-b"
    McSup( is , js ) = -b;
end

% Matriz estados x inferior
MeInf = zeros( K, K*n );

% Monta a matriz de estados inferior
for k = 0:K-1
    % Linha de k
    i = k+1;
    % Colunona de k
    J = k+1;
    j = (J-1)*n + 1;
    js = j:j+n-1;
    % Escreve vetor que recupera o tetab do estado
    % e multiplica pela constante do controlador...
    MeInf( i , js ) = Kp.*[1 0 0];
end

% Matriz comandos inferior
McInf = zeros( K, K*m );

% Monta a matriz comandos inferior
for k = 0:K-1
    % Linha e coluna
    i = k+1;  j = k+1;
    % Sinal de controle k
    McInf( i , j ) = 1;
end

% Matriz total : [ MeSup  McSup 
%                  MeInf  McInf ]
M = [ MeSup   McSup  ;...
      MeInf   McInf ];

% Vetor independente superior
vetSup = zeros( (K+1)*n, 1 );

% Estado inicial
vetSup( 1:n ) = a*x0;

% Estado final
vetSup( (end-n+1):end ) = xf;

% Vetor independente inferior
vetInf = xf(1)*Kp.*ones( K, 1 );

% Primeiro sinal de comando
vetInf(1) = 0;

% Vetor independente
vet = [ vetSup  ;...
        vetInf ];