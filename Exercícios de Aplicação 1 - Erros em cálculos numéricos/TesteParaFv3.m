% Script de teste da fun��o paraF vers�o 3

% voc� j� conhece essa dupla
clear
clc

% agora temos que passar os valores de m e M tamb�m
% mas ainda assumimos beta = 10
F = [nan, 3, -3, 3];
% pegamos t (como sempre)
t = F(2);
% e agora m e M tamb�m
m = F(3);
M = F(4);

disp('F(10, 3, -3, 3)')
disp(' ') 

% OBS: m e M n�o precisam ser sempre -2 e 2, -3 e 3, -4 e 4, ... 
% eles podem ser "assim�tricos" e, na vida real (com os floats e doubles), 
% s�o

% lembra-se de como o FOR funciona no Scilab? 
% olha que maneiro...
X = [432.123, 0.0135231, -125.676, -.25, 7481, 0.000034];
% um vetor com os valores que queremos para x
% e... 
% voil�! 
for x = X
     paraFv3(x, F);
end
% bem melhor que v�rias linhas repetidas, n�o?

% agora rode e veja no que d�
