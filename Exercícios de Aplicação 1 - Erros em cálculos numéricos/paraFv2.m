% Agora vamos fazer a própria função printar o resultado
% Para não ter que ficar reescrevendo no script...

% nada mudou por aqui...
function [mantissa, expoente] = paraFv2(x, F)
               % só o nome da função /\, pq é outro arquivo
    % nem aqui...
    t = F(2);
    % OBS: F não tem tipo
    % Então, nada garante que F tenha o elemento de posição 2...
    % ...é precisso "confiar" no usuário da função
    
    % lembrete: assumimos beta = 10, m = -3, M = 3 
    
    % vamos mostrar o input
    disp('input (x)')
    disp(x)
    
    if (abs(x) < 0.0001)
        mantissa = nan; 
        expoente = nan;
        disp('Underflow')
        
     elseif (abs(x) > 999)
         mantissa = nan; % usar o nan é "mais correto" que retornar uma string
         expoente = nan;
         % idem ao underflow
         disp('Overflow')
     
    else
         %tudo igual por aqui
         for e = -3 : 3
             s = abs(x) / 10^e;
             %                             \/ isso (&) Ã© um AND lÃ³gico 
             if (s >= 10^-1*(1 - 0.5*10^-t) & s < (1 - 0.5*10^-t))
                 break;
             end
         end
         mantissa = abs(s) - mod(abs(s), 10^-t);
         mantissa = sign(x)*mantissa; % Descubra o que "sign" faz
         expoente = e;
         disp('mantissa')
         disp(mantissa)
         disp('expoente')
         disp(expoente) 
    end
     disp(' ') % um "salto de linha" 
     disp(' ')
end
