% Computa tetab, tetabp, tetabpp e im
tetabpp_0 = -Km/re/Lm*tetabp_0  -Rm/Lm*im_0;

% Inicializa a lista de sa�das
y = [tetab_0 tetabp_0 tetabpp_0 im_0];

% Itera para cada instante de tempo
for k = 1:K-1
    % Calcula os �ndices
    index = (k-1)*3 + (1:3);
    
    % Estado no instante "k"
    xk = Sol( index );
    
    % Sa�das no instante "k"
    yk = c*xk;
    
    % Adiciona na lista de sa�das
    y = [ y    ;...
          yk' ]; 
end

tetabpp_f = -Km/re/Lm*tetabp_f  -Rm/Lm*im_f; 

% Finaliza a lista de sa�das
    y = [                 y                ;...
          tetab_f tetabp_f tetabpp_f im_f ]; 

% Pega a posi��o angular
tetab   = y(:,1);

% Pega a velocidade angular
tetabp  = y(:,2);

% Pega a acelera��o angular
tetabpp = y(:,3);

% Pega a corrente no motor
im = y(:,4);