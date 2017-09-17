% Agora vamos fazer a pr�pria fun��o printar o resultado
% Para n�o ter que ficar reescrevendo no script...

% nada mudou por aqui...
function [mantissa, expoente] = paraFv2(x, F)
               % s� o nome da fun��o /\, pq � outro arquivo
    % nem aqui...
    t = F(2);
    % OBS: F n�o tem tipo
    % Ent�o, nada garante que F tenha o elemento de posi��o 2...
    % ...� precisso "confiar" no usu�rio da fun��o
    
    % lembrete: assumimos beta = 10, m = -3, M = 3 
    
    % vamos mostrar o input
    disp('input (x)')
    disp(x)
    
    if (abs(x) < 0.0001)
        mantissa = nan; 
        expoente = nan;
        disp('Underflow')
        
     elseif (abs(x) > 999)
         mantissa = nan; % usar o nan � "mais correto" que retornar uma string
         expoente = nan;
         % idem ao underflow
         disp('Overflow')
     
    else
         %tudo igual por aqui
         for e = -3 : 3
             s = abs(x) / 10^e;
             %                             \/ isso (&) é um AND lógico 
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
