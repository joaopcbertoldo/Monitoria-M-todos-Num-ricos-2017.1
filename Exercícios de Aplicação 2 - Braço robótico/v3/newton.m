function [Z] = newton(Z0, XAlvo)
% Fun��o que encontra configura��o dos �ngulos (alpha,beta,gama) do rob�
% para que a garra fique na posi��o 3D XAlvo (x,y,gama). Z0 � a
% configura��o de chute para o m�todo num�rico.

Zk = Z0;

global L1 L2 L3 Altura

% Carrega configura��es do m�todo num�rico
global precision iMax
i = 0;
err = inf; % Seta o erro como infinito
while (err > precision && i <= iMax)
    % Pega o alpha, beta e gama da configura��o atual
    alpha = Zk(1);
    beta = Zk(2);
    gama = Zk(3);
    
    % Calcula H(alpha,beta,gama) = ( f(...), g(...), h(...) )
    f = L1*cos(alpha) + L2*cos(beta) + L3*cos(gama) - XAlvo(1);
    g = L1*sin(alpha) + L2*sin(beta) + L3*sin(gama) + Altura - XAlvo(2);
    h = gama - XAlvo(3);
    
    % Coloca os resultados (n�meros) em um vetor H 3x1
    H = [f g h]';
    
    % Calcula os valores da matriz Jacobiana
    J11 = -L1*sin(alpha);
    J12 = -L2*sin(beta);
    J13 = -L3*sin(gama);
    
    J21 = L1*cos(alpha);
    J22 = L2*cos(beta);
    J23 = L3*cos(gama);
    
    % Coloca os resultados (n�meros) em uma matriz J 3x3
    J = [J11 J12 J13; 
         J21 J22 J23; 
         0 0 1];
    
    % Calcula o passo seguinte
    Zk_1 = Zk - J \ H;
    
    % Calcula o erro relativo
    err = norm(Zk_1 - Zk);
    
    % Transforma o passo atual no passo seguinte
    Zk = Zk_1;
    
    % Conta a itera��o
    i = i + 1;
end

% Resposta � o passo atual
Z = Zk;

end
