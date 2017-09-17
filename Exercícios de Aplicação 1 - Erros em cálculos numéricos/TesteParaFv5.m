% Script de teste da função paraF versão 5
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

% suas correções resultaram no mesmo resultado que aqui ?
% verifique antes de continuar

% lembrete: Ctrl+C para a execução do script, qualquer outro botão continua
pause
clc

% vamos testar outras bases...

% ######### F(5, 4, -2, 3) ############

% lembre-se: declaramos estas variáveis como globais
% basta mudá-las que isto vai afetar  nossa função paraF
beta = 5;
t = 4;
m = -2;
M = 3;
disp('F(5, 4, -2, 3)')
disp(' ') 
for x = X
    paraFv5(x);
end

% Exercício 1 (FAÇA ESTE PRIMEIRO)

% que tal também guardar os resultados?
% cada input tem um resultado de 2 valores (mantissa e expoente)
% não dá para fazer uma matriz com 3 colunas (input, mantissa, expoente) 
% e em uma linha para cada input?

% Dicas:

% 1) você pode colocar uma matriz dentro da outra
% exemplo: x = [1 2], y = [x 3] resulta em y = [1 2 3]
% 
% 2) para selecionar uma coluna inteira, basta dizer qual
% coluna se quer e que queremos todas as linhas usando ":"
% exemplo: x = [1 2; 1 2; 1 2; 1 2] -> x(:,1) resulta [1; 1; 1; 1]

% 3) se vc não lembra como recuperar os dois valores de retorno da função, 
%    volte no script de teste da versão 1 e veja ;)

% Lembrete: o índice de matrizes em MATLAB começam em 1, não em 0

% Exercício 2: verifique se os overflows/underflows estão funcionando como esperado
% Exercício 3: verifique se os arredondamentos estão ok
