% É assim que definimos uma função em MATLAB
%    \/
function [mantissa, expoente] = paraFv1(x, F) 
% Primeiro "function"
% Depois o nome da(s) variável(eis) de retorno (sim, dá pra retornar mais 
% de uma coisa)
% Depois do "=" vem o nome da função (é com este nome que vamos chamá-la ela)
% !!!! o nome da função deve ser o mesmo que o do arquivo
% Depois os argumento 
% x é o número que queremos converter
% F é a base em que queremos representar
% repare que eles não têm tipo

    % Lembre que :
                % beta = 10
                % m = -3 
                % M = 3
    
    % Vamos pegar o valor de t
    % lembra de como acessar um elemento de uma matriz ?
    t = F(2); 
    % neste caso, a matriz é um vetor (uma das dimensões é 1), 
    % então basta dar um único valor de endereço (apenas F(2) em vez de F(1,2))
    
    % Sabemos que o menor valor possível no sistema F(10, t, -3, 3) é 0.0001...
    % EM MÓDULO!!! 
    % o -0.0001 também pode ser representado
    % Use a função 'abs' para ter o módulo de um número - 
    % 'abs' vem de 'absolute value' 
    % teste com valores positivos e negativos no console
        
    % Voltando...
    % Então, qualquer valor menor que 0.0001 (em módulo) é um underflow
    % Adivinha como vamos verificar isso... 
    % Usando IF !
    
    % Observe a sintaxe: if (<expressão>) 
    %                        <ações> 
    %                    end
    % não há {}
    % e para encadear else if é como C, mas com elseif tudo junto
    % assim: if (<expressão>)
    %            <ações> 
    %        elseif (<expressões>) 
    %            <ações> 
    %        end

    % Vamos lá¡
    if (abs(x) < 0.0001)
        mantissa = 'underflow'; 
        expoente = 'underflow';
        % espera-se que mantissa e expoente sejam números, 
        % mas estamos passando string como retorno ?! 
        % ...sem crise, no MATLAB pode
     
     % tambémm temos que verificar se há¡ overflow... 
     % Preencha este if com o valor máximo do sistema F(10, t, -3, 3)
     elseif (abs(x) > ) % <-- PREENCHA AQUI
         mantissa = 'overflow';
         expoente = 'overflow';
     
     % se não for underflow nem overflow...
     else
        % "e" de "expoente"
         for e = -3 : 3
             % lembrete1: no FOR, em cada iteração, 'e' terá um valor do vetor -3: 3
            % lembrete2: -3:3 = [-3, -2, -1, 0, 1, 2, 3]
            
            % fórmulinha 2.1 da Neide na página 39 
            % link do livro: https://drive.google.com/open?id=0By-cUb6hX6BcU3Y1bm5GVk14bHM
             s = abs(x) / 10^e;
             if (s >= 10^-1*(1 - 0.5*10^-t) & s < (1 - 0.5*10^-t))  
                 break; % isto força o programa a sair do FOR
                 % Ou seja, sai do FOR quando o valor de "e" for o adequado para |x| = s * beta^e
             end
         end
         
         % digite 'help mod' no console e descubra pra que serve esta função...
         % Exercócio: explique bem brevemente o que esta linha faz 
         %(escreva aqui mesmo)
         mantissa = abs(s) - mod(abs(s), 10^-t);
         % digite 'help sign' no console para ver o que esta funÃ§Ã£o faz
         mantissa = sign(x)*mantissa;
         expoente = e;
    end 
    
