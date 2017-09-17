% Dimensões
n = size(a,1);
m = size(b,2);
r = size(c,1);

% Matriz de estados xk superior
aux = [eye(K-1); zeros(1,K-1)];
MeSup = kron(aux,eye(n));

aux = [diag(ones(K-2,1),-1); zeros(1,K-1)];
aux(end,end) = 1;
MeSup = MeSup + kron(aux,-a);

% Matriz comandos uk superior
aux = eye(K);
McSup = kron(aux,-b);

% Matriz estados xk inferior
MeInf = zeros(K-3,(K-1)*3);

% Matriz comandos uk inferior
McInf = zeros(K-3,K);
for k = 1:(K-3)
    McInf(k,k+1) = 1;
    McInf(k,k+2) = -1;
end

% Matriz total : [ MeSup  McSup 
%                  MeInf  McInf ]
M = [ MeSup   McSup  ;...
      MeInf   McInf ];

% Vetor independente superior
aux = zeros(K,1);
aux(1) = 1;
vetSup = kron(aux,a*x0);
aux = zeros(K,1);
aux(end) = 1;
vetSup = vetSup + kron(aux,-xf);

% Vetor independente inferior
vetInf = zeros(K-3,1);

% Vetor independente total :
% [ vetSup
%   vetInf ];
vet = [ vetSup  ;...
        vetInf ];
