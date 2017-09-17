% MATLAB � uma calculadora completona.

% Ele funciona com comandos, vari�veis, fun��es, for, while... parece programa��o...
% � porque MATLAB funciona com uma linguagem interpretada
% Isto significa que cada comando � interpretado imediatamente na "Command Window" 
%(ela provavelmente est� abaixo ou � direita deste texto), 
% ou seja, n�o � necess�rio compilar um programa

% Falando na outra janela... 
% Observe sua tela e veja que al�m do editor (janela onde est� este
% texto),h�:
% Command Window - onde se entra os comandos
% Current folder - onde pararecem os arquivos da past atual
% Workspace - onde ficam as vari�veis e seus valores (veremos isso j� j�)
 
% Voltando...
% Se voc� digitar um comando no console (Command Window) ele ser� interpretado imediatamente
% Isso � �til para testar comandos que voc� est� aprendendo
% Por�m, � mais c�modo trabalhar com scripts (isto que voc� est� lendo)
% Um script � uma sequ�ncia de comandos

%   !!! IMPORTANTE !!!   !!! IMPORTANTE !!!   !!! IMPORTANTE !!!   !!! IMPORTANTE !!!
% Veremos algumas coisas b�sicas em MATLAB para nos familiarizar com sua sintaxe atrav�s de exemplos. 
% Voc� deve tentar adaptar o que � feito nos exemplos ao que deseja fazer 
% Sinta-se livre para mudar as coisas nos comandos e para ver o que acontece 
% (no console vai ser mais f�cil de testar) 
% Don't worry, vai ser moleza...
%   !!! IMPORTANTE !!!   !!! IMPORTANTE !!!   !!! IMPORTANTE !!!   !!! IMPORTANTE !!!

% Todo coment�rio começa com '%'
% Ent�o, tudo que voc� leu at� aqui � coment�rio
% Coment�rios s�o ignorados pelo interpretador do MATLAB, eles n�o fazem nada

% Vamos come�ar...

% Para guardar um escalar em uma vari�vel � assim:
x = 2

% Ou para guardar um vetor linha...
x = [10 12 33 0.4]

% Aperte F5 - vai rodar o script 

pause % esta coisinha aqui faz o script pausar
% ou seja, quando apertou F5, o script interpretou at� a linha acima

% N�o � necess�rio declarar os tipos das vari�veis (coxa, n�?)
% E elas podem mudar de tipo !!!
% Reparou que usamos a mesma vari�vel para um escalar e para um vetor ?

% Detalhe: 
% quando fizemos x = 2;, x valia 2
% mas quando fizemos x = [10 12 33 0.4];
% o MATLAB ignorou oq tinha em x e escreveu o novo valor passado

% Vamos fazer novamente para voc� ver...

% clique no console e apert Ctrl+C (isto para a execu��o do script)

% Primeiro, d� um duplo clique na vari�vel x
% Vai abrir o auxiliar de vari�veis (�til para ver o valor de vari�veis
% edit�-las)
% fa�a x = 2 no console e veja a vari�vel x
% agora com x = [10 12 33 0.4]

% Viu que outras c�lulas foram preenchidas?
% E reparou que ainda h� um monte vazias?
% � porque em MATLAB tudo � matriz (escalar � matriz 1x1)
% E ele "sabe lidar" com isso sozinho

% Em frente!

% Rode o script novamente (F5)
% por�m, quando pausar, aperte qualquer tecla no console em vez de Ctrl+C
% isso resume a execu��o

% OU, remova o primeiro "pause" do script

% Vamos fazer um vetor coluna...
y = [10; 88; 1.4; pi; 1+i]

pause
%  /\
% Rodou at� aqui...

% Olhe o comando do vetor y com aten��o 
% Viu que tem um pi e um n�mero complexo ali?
% Pois �, eles j� est�o definidos! 
% N�o precisa aproximar pi com 3.14 (am�m!)

% Detalhe: apenas um n�mero � complexo, mas repare que o matlab considerou
% todos eles complexos (colocando parte Im = 0 nos reais)

% Agora uma matriz 3x3
z1 = [1 2 3; 4 5 6; 7 8 9] 
%                /\ /\
% veja que tem " " e ";"

% Mas, uma matriz 3x3 tamb�m pode ser vista como um vetor coluna 3x1 
% em que cada elemento � um vetor linha 1x3
% Est� pasmo(a)? Observe...
z2 = [[1, 2, 3]; [4, 5, 6]; [7, 8, 9]]

% Resuma a execu��o e veja z1 e z2 (est�o no console)

pause
% rodou at� aqui

% Repare que cada linha que rodamos at� aqui foi exibida no console
% mas se fizermos muitas contas, ele vai ficar polu�do.
% Para evitar isso, use ; ao final dos comandos, assim eles n�o s�o
% exibidos.

% veja:
y
y;
% resuma a execu��o
pause;
% viu que s� apareceu 1 vez?

% E se quisermos exibir um texto?
% Simples!
% fun��o 'disp', de 'display'
% basta us�-la escrevendo o texto entre aspas simples
disp('Hello MATLAB')
% ou, voc� pode usar com vari�veis tamb�m
disp(x)
% repare que, usando disp, n�o aparece o nome da vari�vel

% resuma a execu��o (qualquer bot�o no console)
pause

% Duas coisinhas �teis:
    % exclui todas as vari�veis - �til para iniciar um script
    clear
    % limpa a tela - �til sempre
    clc

% retome 
pause

% Chega de bobeira, vamos fazer umas contas
a = 2
b = 3

soma = a + b
subtracao = a - b
multiplicacao = a * b
divisao = a / b

% resuma
pause
clc % limpa a tela

% Opera��es com matrizes? Foi isso que vc perguntou?
A = [1, 2; 3, 4];
3 * A        % este multiplica cada elemento de A pelo escalar
eye(2,2)     % este � legal, � a matriz identidade 2x2

pause 
% vc j� entendeu o fluxo, n�? basta ler at� um pause, retomar para ver o
% c�digo em a��o e assim por diante...

% Veja a diferen�a destas opera��es:
% esta � a multiplica��o de matrizes normal
disp(eye(2,2) * A) 
% Ex: I*A = ?

% esta � a multiplica��o elemento a elemento 
% o de posi��o (1,1) multiplica o de (1,1) 
% o de (1,2) multiplica o de (1,2), etc
disp(eye(2,2) .* A)  
%           /\
% Tem um ponto antes do * !!!!!

pause
clc % isso faz o que mesmo?

% Isto � IMPORTANTE !!!
MATRIZ = [1, 3, 5; 7, 9, 11; 13, 15, 17]
MATRIZ = MATRIZ .* MATRIZ % multiplica��o elemento a elemento, hein!

pause

% para acessar o elemento de uma matriz...
x = MATRIZ(1, 2) % PEGA o valor da linha 1, coluna 2
MATRIZ(2,3) = 999 % MUDA o valor da linha 2, coluna 3

pause
clc

% Para acabar(UFA!), um FOR... 
% Sim, d� pra fazer itera��o (:

% mas antes..

%se voc� quiser um vetor do tipo [1, 2, ..., 100], fa�a
v1 = 1:100
pause

% e se eu quiser de 3 em 3 ???
v2 = 1:3:100
pause

% e se eu quise de -1.2 até 7.5 de 0.3 em 0.3 ???
v3 = -1.2:0.3:7.5
pause
clc

% J� deu pra pegar o esp�rito, n�?

% Agora sim, o FOR !!!

% em MATLAB, um for � baseado em uma vari�vel que muda de valor a cada itera��o
% (QUE NOVIDADE...)
% o interessante � que os valores que ela assume s�o os valores de um vetor

% a sintaxe � assim "for p = [1, 3, 10, 20, -4]"

% na primeira itera��o, p ser� 1, dps 3, dps 10, etc

% vamos tentar
disp ('1� FOR')
for q = [1, 3, 4, -2]
    disp(q)
end

pause

% outro mais legal...
disp ('2� FOR')
for q = 1:10
    disp(q)
end

% entendeu tudo? 
% se sim, good job
% se n�o, don't worry, veremos mais disso por a�...

% FIM
