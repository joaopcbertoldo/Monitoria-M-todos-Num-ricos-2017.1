% Script de teste da fun��oo paraF vers�o 2

% limpa o nosso ambiente
clear
clc

% como antes...
F = [nan 3 nan nan];
t = F(2);
disp('F(10, 3, -3, 3)')
disp(' ') % salto de linha

x = 432.123; % <-- agora tem ; aqui, pq j� estamos mostrando o valor do input
             % l� dentro da fun��o
[mantissa, expoente] = paraFv2(x, F);

x = 0.0135231;
[mantissa, expoente] = paraFv2(x, F);

x = -125.676;
[mantissa, expoente] = paraFv2(x, F);

x =  -.25;
[mantissa, expoente] = paraFv2(x, F);

x = 7481;
[mantissa, expoente] = paraFv2(x, F);

x = 0.000034;
[mantissa, expoente] = paraFv2(x, F);

% aperte F5 para rodar o script

% repare que guardamos os resultados das chamadas de fun��o, mas nem os usamos 
% experimente deletar a parte � esquerda da chamada da fun��o

% o script j� ficou melhor, n�?
% mas a fun��o paraF nem tanto...
