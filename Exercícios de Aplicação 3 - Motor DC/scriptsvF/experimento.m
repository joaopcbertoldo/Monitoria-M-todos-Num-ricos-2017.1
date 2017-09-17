
%% Discretiza��o do tempo
    Ts = 0.1;         % Time sampling [seg]
    T0 = 0;            % Instante de tempo inicial [seg]
    Tf = 10;            % Instante de tempo final [seg]
    t = T0:Ts:Tf;      % Vetor de instantes de tempo [seg]
    K = length(t) - 1; % K (n�mero de steps)
    
x = x0;
u = [];
Kp = 130;
Ki = 30;
MontaEspacoDeEstados;
for t_ = t
    u1 = Kp*(tetab_f - x(end-2));
    if t_ > 0 
        u1 = u1 + Ki*(tetab_f - x(end-5));
    end
    u = [u;u1];
    x1 = a*x(end-2:end) + b*u1;
    x = [x;x1];
end

% Pega os valores do vetor solu��o
% tetab
tb = x((0:K) * 3 + 1);
tbp = x((0:K) * 3 + 2);
i = x((0:K) * 3 + 3);

% Linha que represex oX (y = 0)
xaxis = [0 max(t); 0 0];

% Abre uma figura e maximiza
figure('Name','Gr�ficos');
set(gcf, 'Position', get(0,'Screensize')); 

% Tamanho do t�tulo dos plots
titleFontSize = 15;
rightXAxisFontSize = 10;

% Plot � direita
subplot(122)
% Plota tetab (posi��o angular do bra�o)
stairs( t, tb*180/pi )
% T�tulo
hTitle = title('$\theta_b$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]')
ylabel('�')
% hold on
% plot(u);

% Plot esquerdo superior
subplot(221)
% Plota tetabp (velocidade angular do bra�o)
stairs( t, tbp*180/pi )
% T�tulo
hTitle = title('$\dot{\theta_b}$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]')
ylabel('�/seg')
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

% Plot esquerdo inferior
subplot(223)
% Plota im (corrente do motor)
stairs( t, i, 'r' )
% T�tulo
hTitle = title('$i_m$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]','FontSize',rightXAxisFontSize)
ylabel('Amp�res')
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

