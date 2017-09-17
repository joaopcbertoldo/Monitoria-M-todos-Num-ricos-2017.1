close all

% Linha que represex oX (y = 0)
xaxis = [0 max(t); 0 0];

% Abre uma figura e maximiza
figure('Name','Gr�ficos');
set(gcf, 'Position', get(0,'Screensize')); 

% Tamanho do t�tulo dos plots
titleFontSize = 15;
rightXAxisFontSize = 10;

% Plot superior esquerdo
subplot(221)
% Plota tetab (posi��o angular do bra�o)
stairs( t, tetab*180/pi )
% T�tulo
hTitle = title('$\theta_b$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]')
ylabel('�')

% Plot inferior esquerdo 
subplot(223)
% Plota tetabp (velocidade angular do bra�o)
stairs( t, tetabp*180/pi )
% T�tulo
hTitle = title('$\dot{\theta_b}$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]')
ylabel('�/seg')
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

% Plot superior direito
subplot(322)
% Plota vm (tens�o de entrada do motor)
stairs( t, vm, 'b' )
% T�tulo
hLegend = legend('$v_m$');
set(hLegend,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]','FontSize',rightXAxisFontSize)
ylabel('Volts')
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

% Plot intermedi�rio direito
subplot(324)
% Plota im (corrente do motor)
stairs( t, im, 'r' )
% T�tulo
hLegend = legend('$i_m$');
set(hLegend,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]','FontSize',rightXAxisFontSize)
ylabel('Amp�res')
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

% Plot inferior direito
subplot(326)
% Plota uma aproxima��o discreta da pot�ncia instant�nea
stairs(t,pm);
% T�tulo
hLegend = legend('$p_m$');
set(hLegend,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]','FontSize',rightXAxisFontSize)
ylabel('Watts')
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

