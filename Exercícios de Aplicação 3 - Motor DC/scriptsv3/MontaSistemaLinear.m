% Dimensões
n = size(a,1);
m = size(b,2);
r = size(c,1);

% Matriz de estados xk superior
aux = [eye(K+1); zeros(1,K+1)];
aux(end,end) = 1;
aux = kron(aux,eye(n));
MeSup = aux;
aux = [diag(ones(K,1),-1); zeros(1,K+1)];
aux = kron(aux,-a);
MeSup = MeSup + aux;

% Matriz comandos uk superior
aux = [diag(ones(K,1),-1); zeros(1,K+1)];
aux = kron(aux,-b);
McSup = aux;

% Matriz estados xk inferior
MeInf = kron(eye(K+1),Kp.*[1 0 0]);

% Matriz comandos uk inferior
McInf = eye(K+1);

% Matriz total : [ MeSup  McSup 
%                  MeInf  McInf ]
M = [ MeSup   McSup  ;...
      MeInf   McInf ];

% Vetor independente superior
aux = zeros(K+2,1);
aux(1) = 1;
vetSup = kron(aux,x0);
aux = zeros(K+2,1);
aux(end) = 1;
vetSup = vetSup + kron(aux,xf);

% Vetor independente inferior
vetInf = kron(ones(K+1,1),xf(1)*Kp);

% Vetor independente total :
% [ vetSup
%   vetInf ];
vet = [ vetSup  ;...
        vetInf ];
