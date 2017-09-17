% Script de teste da função paraF versão 1

% limpa as variáveis
clear
% limpa a tela
clc

% Vamos escrever os valores do sistema F(beta, t, m, M)
F = [nan 3 nan nan];
% assumimos que beta = 10, m = -3 e M = 3
% basta preencher t, que é 3
% "nan" é um valor especial que significa "not a number"

% pegamos o valor de t (número de dígitos significativos)
t = F(2); % <-- ponto e vírgula para não mostrar este valor

% vamos sinalizar que o sistema é o F(10, 3, -3, 3)
disp('F(10, 3, -3, 3)')

% para cada pause, observe o valor da mantissa e do expoente

x = 432.123
[mantissa, expoente] = paraFv1(x, F);
mantissa % <-- para visualizarmos 
expoente % <-- os valores
pause
clc
% lembrete: é preciso apertar alguma tecla para voltar a rodar

x = 0.0135231
[mantissa, expoente] = paraFv1(x, F);
mantissa
expoente
pause
clc

x = -125.676
[mantissa, expoente] = paraFv1(x, F);
mantissa
expoente
pause
clc

% obs: nÃ£o precisa digitar o zero antes do ponto
x = -.25
[mantissa, expoente] = paraFv1(x, F);
mantissa
expoente
pause
clc

x = 7481
[mantissa, expoente] = paraFv1(x, F);
mantissa
expoente
pause
clc

x = 0.000034
[mantissa, expoente] = paraFv1(x, F);
mantissa
expoente
clc
