close all

% Linha que represex oX (y = 0)
xaxis = [0 max(t); 0 0];

% Abre uma figura e maximiza
figure('Name','Gr�ficos');
set(gcf, 'Position', get(0,'Screensize')); 

% Tamanho do t�tulo dos plots
titleFontSize = 15;
rightXAxisFontSize = 10;

% Organiza��o dos plots
%        1 | 3
%        - + - 
%        2 | 4

% Plot 1
subplot(221)
% Plota tetab (posi��o angular do bra�o)
stairs( t, tetab * 180 / pi, 'b' )
% T�tulo
hTitle = title('$\theta_b$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]'); ylabel('�');

% Plot 2
subplot(223)
% Plota tetabp (velocidade angular do bra�o)
stairs( t, tetabp * 180 / pi, 'g' )
% T�tulo
hTitle = title('$\dot{\theta_b}$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]'); ylabel('�/seg');
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

% Plot 3
subplot(222)
% Plota tetabpp (acelera��o angular do bra�o)
stairs( t, tetabpp * 180 / pi, 'k' )
% T�tulo
hTitle = title('$\ddot{\theta_b}$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]'); ylabel('�/seg^2');
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

% Plot 4
subplot(224)
% Plota im (corrente do motor)
stairs( t, im, 'r' )
% T�tulo
hTitle = title('$i_m$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]','FontSize',rightXAxisFontSize); ylabel('Amp�res');
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;


