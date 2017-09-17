% Exerc�cio de aplica��o 4 - Malha de controle

% Objetivo - usar o m�todo das pot�ncias para determinar os autovalores 
%            de uma matriz a fim de determinar se uma malha de controle �
%            est�vel ou n�o.

% Instru��es de entrega 
% ... e envi�-lo para
% joao.bertoldo@gmail.com (monitor) com c�pia para efcosta@icmc.usp.br 
% (docente) com o assunto "Exerc�cio Adicional 3 - xx", onde "xx"� o seu
% nome.

%% Flush
close all
clear all
clc

 %% Modelagem
    % Carrega par�metros do modelo
    MalhaDeControle_1_Parametros;  
    
    % Constante de proporcionalidade Kp
    Kp = 20;
    
    % Monta o espa�o de estados do modelo
    MalhaDeControle_2_EspEst;      
    
%% Maior autovalor
    % M�todo refer�ncia
    maiorAutoVal = max(real(eig(M)))
    
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% M�todo implementado (preencha-o e depois descomente aqui)
%     maiorAutoVal = encontraMaiorAutoValor(M)
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%% Tratamento da solu��o
    
    if maiorAutoVal < 0 
        disp('Ufa... o sistema � est�vel.')
    else
        disp('N�o ligue na tomada, o sistema � INST�VEL!')
    end