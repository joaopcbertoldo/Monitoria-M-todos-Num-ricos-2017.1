close all

% Linha que represex oX (y = 0)
xaxis = [0 max(t); 0 0];

% Abre uma figura e maximiza
figure('Name','Gráficos');
set(gcf, 'Position', get(0,'Screensize')); 

% Tamanho do título dos plots
titleFontSize = 15;
rightXAxisFontSize = 10;

% Plot superior esquerdo
subplot(221)
% Plota tetab (posição angular do braço)
stairs( t, tetab*180/pi )
% Título
hTitle = title('$\theta_b$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]')
ylabel('º')

% Plot inferior esquerdo 
subplot(223)
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

% Plot superior direito
subplot(322)
% Plota vm (tensão de entrada do motor)
stairs( t, vm, 'b' )
% Título
hLegend = legend('$v_m$');
set(hLegend,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]','FontSize',rightXAxisFontSize)
ylabel('Volts')
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

% Plot intermediário direito
subplot(324)
% Plota im (corrente do motor)
stairs( t, im, 'r' )
% Título
hLegend = legend('$i_m$');
set(hLegend,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]','FontSize',rightXAxisFontSize)
ylabel('Ampéres')
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

% Plot inferior direito
subplot(326)
% Plota uma aproximação discreta da potência instantânea
stairs(t,pm);
% Título
hLegend = legend('$p_m$');
set(hLegend,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]','FontSize',rightXAxisFontSize)
ylabel('Watts')
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

