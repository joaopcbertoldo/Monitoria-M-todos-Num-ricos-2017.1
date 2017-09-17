close all

% Linha que represex oX (y = 0)
xaxis = [0 max(t); 0 0];

% Abre uma figura e maximiza
figure('Name','Gráficos');
set(gcf, 'Position', get(0,'Screensize')); 

% Tamanho do título dos plots
titleFontSize = 15;
rightXAxisFontSize = 10;

% Organização dos plots
%        1 | 3
%        - + - 
%        2 | 4

% Plot 1
subplot(221)
% Plota tetab (posição angular do braço)
stairs( t, tetab * 180 / pi, 'b' )
% Título
hTitle = title('$\theta_b$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]'); ylabel('º');

% Plot 2
subplot(223)
% Plota tetabp (velocidade angular do braço)
stairs( t, tetabp * 180 / pi, 'g' )
% Título
hTitle = title('$\dot{\theta_b}$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]'); ylabel('º/seg');
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

% Plot 3
subplot(222)
% Plota tetabpp (aceleração angular do braço)
stairs( t, tetabpp * 180 / pi, 'k' )
% Título
hTitle = title('$\ddot{\theta_b}$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]'); ylabel('º/seg^2');
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

% Plot 4
subplot(224)
% Plota im (corrente do motor)
stairs( t, im, 'r' )
% Título
hTitle = title('$i_m$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]','FontSize',rightXAxisFontSize); ylabel('Ampéres');
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;


