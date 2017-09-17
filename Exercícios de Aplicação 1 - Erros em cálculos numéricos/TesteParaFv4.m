% Script de teste da fun��o paraF vers�o 1.4
clear
clc
% "invocamos" as vari�veis globais 
global beta t m M
% isto serve para avisar o MATLAB que queremos nos referir a 
% beta, t, m e M globais, ou seja, s�o as mesmas que estavam l� na fun��o

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
% o zero d� underflow, mas deveria dar zero, n�o?
% e o 99.99 n�o deveria ter arredondado para 100?

% na verdade, se voc� prestou bastante aten��o, 
% j� deve ter percebido desde o in�cio que o -125.676 est� sendo arredondado
% para -125... mas ele n�o est� mais pr�ximo do -126?

% Exerc�cio: mude o c�digo para corrigir estes dois problemas:
    % 1) zero n�o deve dar zero em vez de underflow
    % 2) os arredondamentos devem ser feitos corretamente
