function [mantissa, expoente] = paraFv3(x, F)
    % agora o bixo vai pegar...
    % vamos fazer com que m e M sejam genéricos 
    % ou seja, não vamos mais assumir que serão sempre -3 e 3 
    % seus valores serão passados pelo parâmetro F da chamada de "paraF"
    
    t = F(2);
    m = F(3);  % Olha eles 
    M = F(4);  % bem aqui
    
    % Só assumimos que beta = 10 (por enquanto...)
    
    disp('input (x)')
    disp(x)
    
    % agora veja o IF
    if abs(x) < 10^(m-1) 
        % você entende por que há um -1 alí ? 
        % se não, pergunte a alguém...
        mantissa = nan;
        expoente = nan;
        disp('Underflow')
        
     % notou que o IF está sem () ?
     
    % agora com overflow...
    elseif abs(x) > 10^M - 10^(M-t)  
    % este é mais complicadinho, mas tente entender esta fórmula
    % se não conseguir msm com os exemplos, peça ajuda
         mantissa = nan;
         expoente = nan;
         disp('Overflow')
     
    else
         for e = m : M % <-- substituímos os valores "hardcode" pelos parâmetros
             s = abs(x) / 10^e;
             if (s >= 10^-1*(1 - 0.5*10^-t) & s < (1 - 0.5*10^-t)) 
                 break;
             end
         end
         % encurtamos aquelas duas linhas da mantissa em uma só
         mantissa = sign(x)*(abs(s) - mod(abs(s), 10^-t));
         expoente = e;
         
         disp('mantissa')
         disp(mantissa)
         disp('expoente')
         disp(expoente) 
    end
     disp(' ') % um "salto de linha" 
     disp(' ')
end
