function [mantissa, expoente] = paraFv3(x, F)
    % agora o bixo vai pegar...
    % vamos fazer com que m e M sejam gen�ricos 
    % ou seja, n�o vamos mais assumir que ser�o sempre -3 e 3 
    % seus valores ser�o passados pelo par�metro F da chamada de "paraF"
    
    t = F(2);
    m = F(3);  % Olha eles 
    M = F(4);  % bem aqui
    
    % S� assumimos que beta = 10 (por enquanto...)
    
    disp('input (x)')
    disp(x)
    
    % agora veja o IF
    if abs(x) < 10^(m-1) 
        % voc� entende por que h� um -1 al� ? 
        % se n�o, pergunte a algu�m...
        mantissa = nan;
        expoente = nan;
        disp('Underflow')
        
     % notou que o IF est� sem () ?
     
    % agora com overflow...
    elseif abs(x) > 10^M - 10^(M-t)  
    % este � mais complicadinho, mas tente entender esta f�rmula
    % se n�o conseguir msm com os exemplos, pe�a ajuda
         mantissa = nan;
         expoente = nan;
         disp('Overflow')
     
    else
         for e = m : M % <-- substitu�mos os valores "hardcode" pelos par�metros
             s = abs(x) / 10^e;
             if (s >= 10^-1*(1 - 0.5*10^-t) & s < (1 - 0.5*10^-t)) 
                 break;
             end
         end
         % encurtamos aquelas duas linhas da mantissa em uma s�
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
