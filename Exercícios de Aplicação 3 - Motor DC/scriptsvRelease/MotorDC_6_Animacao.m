% Abre uma figura nova
figure('Name','Animação');

% Define a cor da barra
cor = [1 0.5 0.75];

% Calcula o tamanho do pedaço antes do eixo
pedaco = lb/2-d_E;

% Barra: 
% (1)                                                (2)
%  .--------------------------------------------------.
%  |                                                  |
%  |      O (0,0)                                     |
%  |                                                  |
%  .--------------------------------------------------.
% (4)                                                (3)

% Ponto (1) no instante 
p10 = [-pedaco wb/2];
% Ponto (2) no instante 
p20 = [lb-pedaco wb/2];
% Ponto (3) no instante 
p30 = [lb-pedaco -wb/2];
% Ponto (4) no instante 
p40 = [-pedaco -wb/2];

% Reúne os Xs dos pontos
x = [p10(1) p20(1) p30(1) p40(1)];
% Reúne os Ys dos pontos
y = [p10(2) p20(2) p30(2) p40(2)];

% Cria o plot
barra = fill(x,y,cor);

% Labels
xlabel('metros'); ylabel('metros');

hold on
% Gambiarra para pintar o eixo
plot(0,0,'.b','MarkerSize',30);
% Eixos Ox e Oy
plot([0 lb],[0 0],'--k',[0 0],[0 lb],'--k');
% Escreve textinhos...
text(0.95,-0.05,'\theta = 0º')
text(-0.05,1,'\theta = 90º')
hold off

% Delimita os plot
limits = [-wb, lb+pedaco, -wb, lb+pedaco];
axis(limits)

% Frames per second
fps = 20;
% Inverso disso
spf = fps^-1;
% Timer de ajuste dos fps
time = timer('TimerFcn',@(~,~) '','StartDelay',spf);

% Itera para cada frame
for k = 0:K
    % Dispara o timer
    start(time);
    
    % Pega a posição da barra
    th = tetab(k+1);
    
    % Calcula matriz rotação
    Rot = [cos(th) -sin(th) ;...
           sin(th)  cos(th)];
    % Calcula os pontos da barra
    p1 = Rot*p10'; p2 = Rot*p20'; p3 = Rot*p30'; p4 = Rot*p40';
    
    % Reúne os Xs dos pontos
    x = [p1(1) p2(1) p3(1) p4(1)];
    % Reúne os Ys dos pontos
    y = [p1(2) p2(2) p3(2) p4(2)];
    
    % Altera o plot
    barra.XData = x;
    barra.YData = y;
    
    % Espera o timer
    wait(time);
end