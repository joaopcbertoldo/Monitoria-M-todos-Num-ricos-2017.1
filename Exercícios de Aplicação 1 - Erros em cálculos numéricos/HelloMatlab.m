% MATLAB é uma calculadora completona.

% Ele funciona com comandos, variáveis, funções, for, while... parece programação...
% É porque MATLAB funciona com uma linguagem interpretada
% Isto significa que cada comando é interpretado imediatamente na "Command Window" 
%(ela provavelmente está abaixo ou à direita deste texto), 
% ou seja, não é necessário compilar um programa

% Falando na outra janela... 
% Observe sua tela e veja que além do editor (janela onde está este
% texto),há:
% Command Window - onde se entra os comandos
% Current folder - onde pararecem os arquivos da past atual
% Workspace - onde ficam as variáveis e seus valores (veremos isso já já)
 
% Voltando...
% Se você digitar um comando no console (Command Window) ele será interpretado imediatamente
% Isso é útil para testar comandos que você está aprendendo
% Porém, é mais cômodo trabalhar com scripts (isto que você está lendo)
% Um script é uma sequência de comandos

%   !!! IMPORTANTE !!!   !!! IMPORTANTE !!!   !!! IMPORTANTE !!!   !!! IMPORTANTE !!!
% Veremos algumas coisas básicas em MATLAB para nos familiarizar com sua sintaxe através de exemplos. 
% Você deve tentar adaptar o que é feito nos exemplos ao que deseja fazer 
% Sinta-se livre para mudar as coisas nos comandos e para ver o que acontece 
% (no console vai ser mais fácil de testar) 
% Don't worry, vai ser moleza...
%   !!! IMPORTANTE !!!   !!! IMPORTANTE !!!   !!! IMPORTANTE !!!   !!! IMPORTANTE !!!

% Todo comentário comeÃ§a com '%'
% Então, tudo que você leu até aqui é comentário
% Comentários são ignorados pelo interpretador do MATLAB, eles não fazem nada

% Vamos começar...

% Para guardar um escalar em uma variável é assim:
x = 2

% Ou para guardar um vetor linha...
x = [10 12 33 0.4]

% Aperte F5 - vai rodar o script 

pause % esta coisinha aqui faz o script pausar
% ou seja, quando apertou F5, o script interpretou até a linha acima

% Não é necessário declarar os tipos das variáveis (coxa, né?)
% E elas podem mudar de tipo !!!
% Reparou que usamos a mesma variável para um escalar e para um vetor ?

% Detalhe: 
% quando fizemos x = 2;, x valia 2
% mas quando fizemos x = [10 12 33 0.4];
% o MATLAB ignorou oq tinha em x e escreveu o novo valor passado

% Vamos fazer novamente para você ver...

% clique no console e apert Ctrl+C (isto para a execução do script)

% Primeiro, dê um duplo clique na variável x
% Vai abrir o auxiliar de variáveis (útil para ver o valor de variáveis
% editá-las)
% faça x = 2 no console e veja a variável x
% agora com x = [10 12 33 0.4]

% Viu que outras células foram preenchidas?
% E reparou que ainda há um monte vazias?
% É porque em MATLAB tudo é matriz (escalar é matriz 1x1)
% E ele "sabe lidar" com isso sozinho

% Em frente!

% Rode o script novamente (F5)
% porém, quando pausar, aperte qualquer tecla no console em vez de Ctrl+C
% isso resume a execução

% OU, remova o primeiro "pause" do script

% Vamos fazer um vetor coluna...
y = [10; 88; 1.4; pi; 1+i]

pause
%  /\
% Rodou até aqui...

% Olhe o comando do vetor y com atenção 
% Viu que tem um pi e um número complexo ali?
% Pois é, eles já estão definidos! 
% Não precisa aproximar pi com 3.14 (amém!)

% Detalhe: apenas um número é complexo, mas repare que o matlab considerou
% todos eles complexos (colocando parte Im = 0 nos reais)

% Agora uma matriz 3x3
z1 = [1 2 3; 4 5 6; 7 8 9] 
%                /\ /\
% veja que tem " " e ";"

% Mas, uma matriz 3x3 também pode ser vista como um vetor coluna 3x1 
% em que cada elemento é um vetor linha 1x3
% Está pasmo(a)? Observe...
z2 = [[1, 2, 3]; [4, 5, 6]; [7, 8, 9]]

% Resuma a execução e veja z1 e z2 (estão no console)

pause
% rodou até aqui

% Repare que cada linha que rodamos até aqui foi exibida no console
% mas se fizermos muitas contas, ele vai ficar poluído.
% Para evitar isso, use ; ao final dos comandos, assim eles não são
% exibidos.

% veja:
y
y;
% resuma a execução
pause;
% viu que só apareceu 1 vez?

% E se quisermos exibir um texto?
% Simples!
% função 'disp', de 'display'
% basta usá-la escrevendo o texto entre aspas simples
disp('Hello MATLAB')
% ou, você pode usar com variáveis também
disp(x)
% repare que, usando disp, não aparece o nome da variável

% resuma a execução (qualquer botão no console)
pause

% Duas coisinhas Úteis:
    % exclui todas as variáveis - útil para iniciar um script
    clear
    % limpa a tela - útil sempre
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

% Operações com matrizes? Foi isso que vc perguntou?
A = [1, 2; 3, 4];
3 * A        % este multiplica cada elemento de A pelo escalar
eye(2,2)     % este é legal, é a matriz identidade 2x2

pause 
% vc já entendeu o fluxo, né? basta ler até um pause, retomar para ver o
% código em ação e assim por diante...

% Veja a diferença destas operações:
% esta é a multiplicação de matrizes normal
disp(eye(2,2) * A) 
% Ex: I*A = ?

% esta é a multiplicação elemento a elemento 
% o de posição (1,1) multiplica o de (1,1) 
% o de (1,2) multiplica o de (1,2), etc
disp(eye(2,2) .* A)  
%           /\
% Tem um ponto antes do * !!!!!

pause
clc % isso faz o que mesmo?

% Isto é IMPORTANTE !!!
MATRIZ = [1, 3, 5; 7, 9, 11; 13, 15, 17]
MATRIZ = MATRIZ .* MATRIZ % multiplicação elemento a elemento, hein!

pause

% para acessar o elemento de uma matriz...
x = MATRIZ(1, 2) % PEGA o valor da linha 1, coluna 2
MATRIZ(2,3) = 999 % MUDA o valor da linha 2, coluna 3

pause
clc

% Para acabar(UFA!), um FOR... 
% Sim, dá pra fazer iteração (:

% mas antes..

%se você quiser um vetor do tipo [1, 2, ..., 100], faça
v1 = 1:100
pause

% e se eu quiser de 3 em 3 ???
v2 = 1:3:100
pause

% e se eu quise de -1.2 atÃ© 7.5 de 0.3 em 0.3 ???
v3 = -1.2:0.3:7.5
pause
clc

% Já deu pra pegar o espérito, né?

% Agora sim, o FOR !!!

% em MATLAB, um for é baseado em uma variável que muda de valor a cada iteração
% (QUE NOVIDADE...)
% o interessante é que os valores que ela assume são os valores de um vetor

% a sintaxe é assim "for p = [1, 3, 10, 20, -4]"

% na primeira iteração, p será¡ 1, dps 3, dps 10, etc

% vamos tentar
disp ('1º FOR')
for q = [1, 3, 4, -2]
    disp(q)
end

pause

% outro mais legal...
disp ('2º FOR')
for q = 1:10
    disp(q)
end

% entendeu tudo? 
% se sim, good job
% se não, don't worry, veremos mais disso por aí...

% FIM
