% Computa os indices de tetab, tetabp, im e vm dentro do vetor solução
    % index de tetab
    index_tetab = (0:K-2) * 3 + 1;
    
    % index de tetabp
    index_tetabp = (0:K-2) * 3 + 2;
    
    % index de im
    index_im = (0:K-2) * 3 + 3;

% Pega os valores do vetor solução
    % tetab
    tetab = [tetab_0; Sol(index_tetab); tetab_f];

    % tetabp
    tetabp = [tetabp_0; Sol(index_tetabp); tetabp_f];
    
    % im
    im = [im_0; Sol(index_im); im_f];