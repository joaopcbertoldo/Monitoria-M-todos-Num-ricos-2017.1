% Script de teste da fun��o paraF vers�o 5
clear
clc
global beta t m M
beta = 10;
t = 3;
m = -3;
M = 3;
disp('F(10, 3, -3, 3)')
disp(' ') 

X = [432.123, 0.0135231, -125.676, -.25, 7481, 0.000034, 0, 99.99];

for x = X
    paraFv5(x);
end

% suas corre��es resultaram no mesmo resultado que aqui ?
% verifique antes de continuar

% lembrete: Ctrl+C para a execu��o do script, qualquer outro bot�o continua
pause
clc

% vamos testar outras bases...

% ######### F(5, 4, -2, 3) ############

% lembre-se: declaramos estas vari�veis como globais
% basta mud�-las que isto vai afetar  nossa fun��o paraF
beta = 5;
t = 4;
m = -2;
M = 3;
disp('F(5, 4, -2, 3)')
disp(' ') 
for x = X
    paraFv5(x);
end

% Exerc�cio 1 (FA�A ESTE PRIMEIRO)

% que tal tamb�m guardar os resultados?
% cada input tem um resultado de 2 valores (mantissa e expoente)
% n�o d� para fazer uma matriz com 3 colunas (input, mantissa, expoente) 
% e em uma linha para cada input?

% Dicas:

% 1) voc� pode colocar uma matriz dentro da outra
% exemplo: x = [1 2], y = [x 3] resulta em y = [1 2 3]
% 
% 2) para selecionar uma coluna inteira, basta dizer qual
% coluna se quer e que queremos todas as linhas usando ":"
% exemplo: x = [1 2; 1 2; 1 2; 1 2] -> x(:,1) resulta [1; 1; 1; 1]

% 3) se vc n�o lembra como recuperar os dois valores de retorno da fun��o, 
%    volte no script de teste da vers�o 1 e veja ;)

% Lembrete: o �ndice de matrizes em MATLAB come�am em 1, n�o em 0

% Exerc�cio 2: verifique se os overflows/underflows est�o funcionando como esperado
% Exerc�cio 3: verifique se os arredondamentos est�o ok
