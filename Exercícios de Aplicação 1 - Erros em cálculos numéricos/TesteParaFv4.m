% Script de teste da função paraF versão 1.4
clear
clc
% "invocamos" as variáveis globais 
global beta t m M
% isto serve para avisar o MATLAB que queremos nos referir a 
% beta, t, m e M globais, ou seja, são as mesmas que estavam lá na função

% vamos atribuit valores a elas
beta = 10;
t = 3;
m = -3;
M = 3;

disp('F(10, 3, -3, 3)')
disp(' ') 

%                                       adicionamos dois valores novos
%                                                       \/    \/
X = [432.123, 0.0135231, -125.676, -.25, 7481, 0.000034, 0, 99.99];

for x = X
    paraFv4(x);
end

% F5...

% percebeu que tem dois errinhos no valores novos?
% o zero dá underflow, mas deveria dar zero, não?
% e o 99.99 não deveria ter arredondado para 100?

% na verdade, se você prestou bastante atenção, 
% já deve ter percebido desde o início que o -125.676 está sendo arredondado
% para -125... mas ele não está mais próximo do -126?

% Exercício: mude o código para corrigir estes dois problemas:
    % 1) zero não deve dar zero em vez de underflow
    % 2) os arredondamentos devem ser feitos corretamente
