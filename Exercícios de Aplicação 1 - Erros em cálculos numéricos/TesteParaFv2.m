% Script de teste da funçãoo paraF versão 2

% limpa o nosso ambiente
clear
clc

% como antes...
F = [nan 3 nan nan];
t = F(2);
disp('F(10, 3, -3, 3)')
disp(' ') % salto de linha

x = 432.123; % <-- agora tem ; aqui, pq já estamos mostrando o valor do input
             % lá dentro da função
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

% repare que guardamos os resultados das chamadas de função, mas nem os usamos 
% experimente deletar a parte à esquerda da chamada da função

% o script já ficou melhor, né?
% mas a função paraF nem tanto...
