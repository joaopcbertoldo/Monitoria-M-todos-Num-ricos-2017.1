function [mantissa, expoente] = paraFv4(x)
    % Desta vez, vamos usar variáveis globais!
    % As var. globais são mesmas em todos os escopos 
    % (dentro e fora de funções)
    global beta t m M
    % com esta linha, estamos dizendo que, quando usarmos estas 4 variáveis, 
    % estaremos nos referindo às variáveis globais com estes nomes (beta, t, m, M)
    
    % não assumiremos beta = 10...
    % em geral, vamos substituir "10" por "beta"
    
    disp('input (x)')
    disp(x)
    
    % antes: if abs(x) < 10^(m-1) 
    if abs(x) < beta^(m-1) 
        mantissa = nan;
        expoente = nan;
        disp('Underflow')
        
     % antes: elseif abs(x) > 10^M - 10^(M-t)
     elseif abs(x) > beta^M - beta^(M-t)
         mantissa = nan;
         expoente = nan;
         disp('Overflow')
     
     else
         for e = m : M
             % antes: s = abs(x) / 10^e
             s = abs(x) / beta^e;
             % antes: if (s >= 10^-1*(1 - 0.5*10^-t) & s < (1 - 0.5*10^-t))
             if (s >= beta^-1*(1 - 0.5*beta^-t) & s < (1 - 0.5*beta^-t))
                 break;
             end % <-- devemos sempre fechar os IFs, FUNCTIONs, FORs com "end"
         end     %      é como se estivessemos fechando um {} em C
         % antes: sign(x)*(abs(s) - modulo(abs(s), 10^-t));
         mantissa = sign(x)*(abs(s) - mod(abs(s), beta^-t));
         expoente = e;
         
         % Também vamos recalcular o input a partir da mantissa e do
         % expoente.
         % Deveria dar a mesma coisa, mas pode haver arredondamentos!
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
