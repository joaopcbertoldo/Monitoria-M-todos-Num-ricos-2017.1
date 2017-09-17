
%% Discretização do tempo
    Ts = 0.1;         % Time sampling [seg]
    T0 = 0;            % Instante de tempo inicial [seg]
    Tf = 10;            % Instante de tempo final [seg]
    t = T0:Ts:Tf;      % Vetor de instantes de tempo [seg]
    K = length(t) - 1; % K (número de steps)
    
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

% Pega os valores do vetor solução
% tetab
tb = x((0:K) * 3 + 1);
tbp = x((0:K) * 3 + 2);
i = x((0:K) * 3 + 3);

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
stairs( t, tb*180/pi )
% Título
hTitle = title('$\theta_b$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]')
ylabel('º')
% hold on
% plot(u);

% Plot esquerdo superior
subplot(221)
% Plota tetabp (velocidade angular do braço)
stairs( t, tbp*180/pi )
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
stairs( t, i, 'r' )
% Título
hTitle = title('$i_m$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
% Eixos
xlabel('t [seg]','FontSize',rightXAxisFontSize)
ylabel('Ampéres')
% oX (y = 0)
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

