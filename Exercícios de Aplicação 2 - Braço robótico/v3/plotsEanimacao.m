close all

%% Configurações de imagem para visualização

disp('Carregando configurações dos plots.')

xMin = 0.00; % m 
xMax = 2.20; % m 
yMin = 0.00; % m 
yMax = 1.85; % m 

animacaoLimits = [xMin xMax yMin yMax];
clear xMin xMax yMin yMax

global margemX margemY
todasPosicoes = [pIdeal; p];
xMin = min(todasPosicoes(:,1)) - margemX;
xMax = max(todasPosicoes(:,1)) + margemX;
yMin = min(todasPosicoes(:,2)) - margemY;
yMax = max(todasPosicoes(:,2)) + margemY;

closeLimits = [xMin xMax yMin yMax];
clear xMin xMax yMin yMax

%% Plot dos ângulos

disp('Plotando os ângulos do robô')

figure('Name', 'Configurações do robô')
set(gcf, 'Position', get(0,'Screensize')); % Maximiza a figura.

subplot(211);
title('Ângulos medidos a partir da horizontal (alpha,beta,gama)')
xlabel('t [%]')
ylabel('[º]')

angulosPlot = plot(T, Z(:,1) * 180/pi, T, Z(:,2) * 180/pi, T, Z(:,3) * 180/pi);

angulosPlot(1).LineWidth = 2;
angulosPlot(2).LineWidth = 2;
angulosPlot(3).LineWidth = 2;
legend('alpha', 'beta', 'gama')

subplot(212);
title('Ângulos dos braços nos motores')
xlabel('t [%]')
ylabel('[º]');

tetasPlot = plot(T, teta(:,1), T, teta(:,2), T, teta(:,3));

tetasPlot(1).LineWidth = 2;
tetasPlot(2).LineWidth = 2;
tetasPlot(3).LineWidth = 2;
legend('Motor 1', 'Motor 2', 'Motor 3')

%% Plot das posições (x,y)

disp('Plotando as posições (x,y) ideais e reais.')

x = p(:,1)';
y = p(:,2)';

xIdeal = pIdeal(:,1)';
yIdeal = pIdeal(:,2)';

figure('Name', 'Trajetórias ideal e real')
set(gcf, 'Position', get(0,'Screensize')); % Maximiza a figura.
hold on

trajIdeal = plot(xIdeal, yIdeal, 'g');
trajIdeal.LineWidth = 2.5;

trajReal = plot(x, y, 'o');

xlabel('x [m]')
ylabel('y [m]')

legend('Ideal', 'Real')

axis(closeLimits)


%% Animação do robô

% break;

global NPassos

% Separa os vetores de alphas, betas e gamas
Alphas = Z(:,1);
Betas = Z(:,2);
Gamas = Z(:,3);

disp('Calculando as posições das bases e pontas de todos os braços.')

% Cria vetores das posições (x,y) das bases e pontas dos braços 

% Braço 1 - BASE
braco1Base = [zeros(NPassos,1) ones(NPassos,1)*Altura];

% Braço 1 - PONTA
braco1PontaX = braco1Base(:,1) + L1.*cos(Alphas); %   x
braco1PontaY = braco1Base(:,2) + L1.*sin(Alphas); %   y
braco1Ponta = [braco1PontaX braco1PontaY];        % (x,y)

% Braço 2 - BASE ( = ponta do braço 1 )
braco2Base = braco1Ponta;

% Braço 2 - PONTA
braco2PontaX = braco2Base(:,1) + L2.*cos(Betas); %   x
braco2PontaY = braco2Base(:,2) + L2.*sin(Betas); %   y
braco2Ponta = [braco2PontaX braco2PontaY];       % (x,y)

% Braço 3 - BASE ( = ponta do braço 2 )
braco3Base = braco2Ponta;

% Braço 3 - PONTA
braco3PontaX = braco3Base(:,1) + L3.*cos(Gamas); %   x
braco3PontaY = braco3Base(:,2) + L3.*sin(Gamas); %   y
braco3Ponta = [braco3PontaX braco3PontaY];       % (x,y)

disp('Desenhado a animação.')

% Cria figura
figure('Name','Animção do robô');
set(gcf, 'Position', get(0,'Screensize')); % Maximiza a figura.
title('Animação braço robótico');
xlabel('Direção X [m]')
ylabel('Direção Y [m]')
axis(animacaoLimits)

% Plota posição inicial
hold on

%             x da base braço1    x da ponta braço1  
braco1 = plot([braco1Base(1,1)    braco1Ponta(1,1)],... 
              [braco1Base(1,2)    braco1Ponta(1,2)]);
%             y da base braço1    y da ponta braço1 

%             x da base braço2    x da ponta braço2   
braco2 = plot([braco2Base(1,1)    braco2Ponta(1,1)],... 
              [braco2Base(1,2)    braco2Ponta(1,2)]);
%             y da base braço2    y da ponta braço2

%             x da base braço3    x da ponta braço3  
braco3 = plot([braco3Base(1,1)    braco3Ponta(1,1)],... 
              [braco3Base(1,2)    braco3Ponta(1,2)]);
%             y da base braço3    y da ponta braço3 

% Muda a largura da linha
braco1.LineWidth = 3;
braco2.LineWidth = 3;
braco3.LineWidth = 3;

% Cria "vetor" de frames
F(NPassos) = struct('cdata',[],'colormap',[]);

% Itera através de todas as configurações do robô alterando os dados X e Y
% dos braços.
for i = 1:NPassos
    
%     hold off
    
    % Reposiciona o braço 1
    braco1.XData = [braco1Base(i,1) braco1Ponta(i,1)];
    braco1.YData = [braco1Base(i,2) braco1Ponta(i,2)];
    
%     hold on

    % Reposiciona o braço 2
    braco2.XData = [braco2Base(i,1) braco2Ponta(i,1)];
    braco2.YData = [braco2Base(i,2) braco2Ponta(i,2)];
    
    % Reposiciona o braço 3
    braco3.XData = [braco3Base(i,1) braco3Ponta(i,1)];
    braco3.YData = [braco3Base(i,2) braco3Ponta(i,2)];
        
    % Captura o frame
    F(i) = getframe;
end

% Write a video of the animation
disp('Escrevendo AVI...')
vWriter = VideoWriter('animação.avi');
open(vWriter);
global repeticoesVideo
for i = 1:repeticoesVideo
    writeVideo(vWriter, F);
end
close(vWriter);

clear v bracos braco1 braco2 braco3 
clear braco1Base braco2Base braco3Base braco1Ponta braco2Ponta braco3Ponta