% Dimensões
n = size(a,1);
m = size(b,2);
r = size(c,1);

% Matriz de estados xk superior
aux1 = eye(K);
aux1 = [aux1; zeros(1,K)];
aux1(end,end) = 1;
aux1 = kron(aux1,eye(n));
aux2 = diag(ones(K-1,1),-1);
aux2 = [aux2; zeros(1,K)];
aux2 = kron(aux2,-a);
MeSup = aux1 + aux2;

% Matriz comandos uk superior
aux1 = eye(K);
aux1 = [aux1; zeros(1,K)];
aux1(1,1) = 0;
aux1 = kron(aux1,-b);
McSup = aux1;

% Matriz estados xk inferior
aux1 = eye(K);
aux1 = kron(aux1,Kp.*[1 0 0]);
MeInf = aux1;

% Matriz comandos uk inferior
McInf = eye(K);

% Matriz total : [ MeSup  McSup 
%                  MeInf  McInf ]
M = [ MeSup   McSup  ;...
      MeInf   McInf ];

% Vetor independente superior
aux1 = zeros(K+1,1);
aux1(1) = 1;
aux1 = kron(aux1,x0);
aux2 = zeros(K+1,1);
aux2(end) = 1;
aux2 = kron(aux2,xf);
vetSup = aux1 + aux2;

% Vetor independente inferior
aux1 = ones(K,1);
aux1 = kron(aux1,xf(1)*Kp);
vetInf = aux1;

% Primeiro sinal de comando
%vetInf(1) = 0;

% Vetor independente
vet = [ vetSup  ;...
        vetInf ];
    
M = M(1:end-3,:);
vet = vet(1:end-3,:);
size(M)