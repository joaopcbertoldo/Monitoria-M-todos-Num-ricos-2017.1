% � assim que definimos uma fun��o em MATLAB
%    \/
function [mantissa, expoente] = paraFv1(x, F) 
% Primeiro "function"
% Depois o nome da(s) vari�vel(eis) de retorno (sim, d� pra retornar mais 
% de uma coisa)
% Depois do "=" vem o nome da fun��o (� com este nome que vamos cham�-la ela)
% !!!! o nome da fun��o deve ser o mesmo que o do arquivo
% Depois os argumento 
% x � o n�mero que queremos converter
% F � a base em que queremos representar
% repare que eles n�o t�m tipo

    % Lembre que :
                % beta = 10
                % m = -3 
                % M = 3
    
    % Vamos pegar o valor de t
    % lembra de como acessar um elemento de uma matriz ?
    t = F(2); 
    % neste caso, a matriz � um vetor (uma das dimens�es � 1), 
    % ent�o basta dar um �nico valor de endere�o (apenas F(2) em vez de F(1,2))
    
    % Sabemos que o menor valor poss�vel no sistema F(10, t, -3, 3) � 0.0001...
    % EM M�DULO!!! 
    % o -0.0001 tamb�m pode ser representado
    % Use a fun��o 'abs' para ter o m�dulo de um n�mero - 
    % 'abs' vem de 'absolute value' 
    % teste com valores positivos e negativos no console
        
    % Voltando...
    % Ent�o, qualquer valor menor que 0.0001 (em m�dulo) � um underflow
    % Adivinha como vamos verificar isso... 
    % Usando IF !
    
    % Observe a sintaxe: if (<express�o>) 
    %                        <a��es> 
    %                    end
    % n�o h� {}
    % e para encadear else if � como C, mas com elseif tudo junto
    % assim: if (<express�o>)
    %            <a��es> 
    %        elseif (<express�es>) 
    %            <a��es> 
    %        end

    % Vamos l�
    if (abs(x) < 0.0001)
        mantissa = 'underflow'; 
        expoente = 'underflow';
        % espera-se que mantissa e expoente sejam n�meros, 
        % mas estamos passando string como retorno ?! 
        % ...sem crise, no MATLAB pode
     
     % tamb�mm temos que verificar se h� overflow... 
     % Preencha este if com o valor m�ximo do sistema F(10, t, -3, 3)
     elseif (abs(x) > ) % <-- PREENCHA AQUI
         mantissa = 'overflow';
         expoente = 'overflow';
     
     % se n�o for underflow nem overflow...
     else
        % "e" de "expoente"
         for e = -3 : 3
             % lembrete1: no FOR, em cada itera��o, 'e' ter� um valor do vetor -3: 3
            % lembrete2: -3:3 = [-3, -2, -1, 0, 1, 2, 3]
            
            % f�rmulinha 2.1 da Neide na p�gina 39 
            % link do livro: https://drive.google.com/open?id=0By-cUb6hX6BcU3Y1bm5GVk14bHM
             s = abs(x) / 10^e;
             if (s >= 10^-1*(1 - 0.5*10^-t) & s < (1 - 0.5*10^-t))  
                 break; % isto for�a o programa a sair do FOR
                 % Ou seja, sai do FOR quando o valor de "e" for o adequado para |x| = s * beta^e
             end
         end
         
         % digite 'help mod' no console e descubra pra que serve esta fun��o...
         % Exerc�cio: explique bem brevemente o que esta linha faz 
         %(escreva aqui mesmo)
         mantissa = abs(s) - mod(abs(s), 10^-t);
         % digite 'help sign' no console para ver o que esta função faz
         mantissa = sign(x)*mantissa;
         expoente = e;
    end 
    
