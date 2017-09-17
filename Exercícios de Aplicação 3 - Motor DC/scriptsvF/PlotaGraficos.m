close all

% Linha que represex oX (y = 0)
xaxis = [0 max(t); 0 0];

% Abre uma figura e maximiza
figure('Name','Gráficos');
set(gcf, 'Position', get(0,'Screensize')); 

% Tamanho do título dos plots
titleFontSize = 15;
rightXAxisFontSize = 10;

% Plot à direita
subplot(122)
% Plota tetab (posição angular do braço)
stairs( t, tetab*180/pi )
% Título
hTitle = title('$\theta_b$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]')
ylabel('º')

% Plot esquerdo superior
subplot(221)
% Plota tetabp (velocidade angular do braço)
stairs( t, tetabp*180/pi )
% Título
hTitle = title('$\dot{\theta_b}$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]')
ylabel('º/seg')
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

% Plot esquerdo inferior
subplot(223)
% Plota im (corrente do motor)
stairs( t, im, 'r' )
% Título
hTitle = title('$i_m$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]','FontSize',rightXAxisFontSize)
ylabel('Ampéres')
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;


