close all
clc

N = size(Z,1);

Z1 = Z(:,1);
Z2 = Z(:,2);
Z3 = Z(:,3);

braco1Base = [zeros(N,1) ones(N,1)*Altura];
braco1PontaX = braco1Base(:,1) + L1.*cos(Z1);
braco1PontaY = braco1Base(:,2) + L1.*sin(Z1);
braco1Ponta = [braco1PontaX braco1PontaY];

braco2Base = braco1Ponta;
braco2PontaX = braco2Base(:,1) + L2.*cos(Z2);
braco2PontaY = braco2Base(:,2) + L2.*sin(Z2);
braco2Ponta = [braco2PontaX braco2PontaY];

braco3Base = braco2Ponta;
braco3PontaX = braco3Base(:,1) + L3.*cos(Z3);
braco3PontaY = braco3Base(:,2) + L3.*sin(Z3);
braco3Ponta = [braco3PontaX braco3PontaY];

bracos = figure;
title('Animação braço robótico');
axis(plotLimits)

hold on
braco1 = plot([braco1Base(1,1) braco1Ponta(1,1)], [braco1Base(1,2) braco1Ponta(1,2)]);
braco2 = plot([braco2Base(1,1) braco2Ponta(1,1)], [braco2Base(1,2) braco2Ponta(1,2)]);
braco3 = plot([braco3Base(1,1) braco3Ponta(1,1)], [braco3Base(1,2) braco3Ponta(1,2)]);

% bracos = plot([braco1Base(1,1) braco1Ponta(1,1) braco2Base(1,1) braco2Ponta(1,1) braco3Base(1,1) braco3Ponta(1,1)], [braco1Base(1,2) braco1Ponta(1,2) braco2Base(1,2) braco2Ponta(1,2) braco3Base(1,2) braco3Ponta(1,2)]);

F(N) = struct('cdata',[],'colormap',[]);
for i = 1:N
    hold off
    braco1.XData = [braco1Base(i,1) braco1Ponta(i,1)];
    braco1.YData = [braco1Base(i,2) braco1Ponta(i,2)];
    
    hold on
    
    braco2.XData = [braco2Base(i,1) braco2Ponta(i,1)];
    braco2.YData = [braco2Base(i,2) braco2Ponta(i,2)];
    
    braco3.XData = [braco3Base(i,1) braco3Ponta(i,1)];
    braco3.YData = [braco3Base(i,2) braco3Ponta(i,2)];
        
    F(i) = getframe;
    disp(i)
    
%     bracos.XData = [braco1Base(i,1) braco1Ponta(i,1) braco2Base(i,1) braco2Ponta(i,1) braco3Base(i,1) braco3Ponta(i,1)];
%     bracos.YData = [braco1Base(i,2) braco1Ponta(i,2) braco2Base(i,2) braco2Ponta(i,2) braco3Base(i,2) braco3Ponta(i,2)];
end

clear N v bracos braco1 braco2 braco3 
clear braco1Base braco2Base braco3Base braco1Ponta braco2Ponta braco3Ponta