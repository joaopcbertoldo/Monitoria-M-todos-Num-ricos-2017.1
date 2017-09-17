% Exercício de aplicação 4 - Malha de controle

% Objetivo - usar o método das potências para determinar os autovalores 
%            de uma matriz a fim de determinar se uma malha de controle é
%            estável ou não.

% Instruções de entrega 
% ... e enviá-lo para
% joao.bertoldo@gmail.com (monitor) com cópia para efcosta@icmc.usp.br 
% (docente) com o assunto "Exercício Adicional 4 - xx", onde "xx" é o seu
% nome.

%% Flush
close all
clear all
clc

 %% Modelagem
    % Carrega parâmetros do modelo
    Estabilidade_1_Parametros;  
    
    % Constante de proporcionalidade Kp
    Kp = 20;
    
    % Monta o espaço de estados do modelo
    Estabilidade_2_EspEst;      
    
%% Maior autovalor
    % Método referência
    maiorAutoVal = max(real(eig(F)))
    
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% Método implementado (preencha-o e depois descomente aqui)
%     maiorAutoVal = encontraMaiorAutoValor(F)
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%% Tratamento da solução
    
    if maiorAutoVal < 0 
        disp('Ufa... o sistema é estável.')
    else
        disp('Não ligue na tomada, o sistema é INSTÁVEL!')
    end