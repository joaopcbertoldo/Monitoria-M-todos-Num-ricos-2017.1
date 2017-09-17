function [mantissa, expoente] = paraFv5(x)
    global beta t m M
    
    disp('input (x)')
    disp(x)
    
    % uma solução para garantir que zero seja zero, não underflow:
    if x == 0
        mantissa = 0;
        expoente = 0;
        % ctrl c + ctrl v do print lá de baixo...
        disp('mantissa')
        disp(mantissa)
        disp('expoente')
        disp(expoente)
        disp('resultado')
        disp(0) 
    
    % underflow
    elseif abs(x) < beta^(m-1) 
        mantissa = nan;
        expoente = nan;
        disp('Underflow')
        
     % overflow
     elseif abs(x) > beta^M - beta^(M-t)
         mantissa = nan;
         expoente = nan;
         disp('Overflow')
     
     % números representáveis em F(beta, t, m, M)
     else
         for e = m : M
             s = abs(x) / beta^e;
             if (s >= beta^-1*(1 - 0.5*beta^-t) & s < (1 - 0.5*beta^-t))
                 break;
             end
         end
         mantissa = sign(x)*(abs(s) - mod(abs(s), beta^-t));
         
         % uma solução para a correção do arredondamento:
         if (mod(abs(s), beta^-t) >= 0.5*beta^-t)
             mantissa = mantissa + sign(x)*beta^-t;
             % você enxerga oq este "sign" está fazendo ? 
             % Exercício: faça uns dois ou três exemplos na mão
             % para entender melhor o que estamos fazendo aqui.
             % Sugestão: use os exemplos que deram problema na v4
         end 
         expoente = e;
         
         resultado = mantissa * beta^expoente;
         disp('mantissa')
         disp(mantissa)
         disp('expoente')
         disp(expoente)
         disp('resultado')
         disp(resultado)
     end
    disp(' ')
    disp(' ')
end
