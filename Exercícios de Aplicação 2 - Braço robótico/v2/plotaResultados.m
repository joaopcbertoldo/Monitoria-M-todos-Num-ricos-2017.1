close all
clc

% figure('Name', '�ngulos dos bra�os medidos a partir da horizontal')
% hold on
% xlabel('t [%]')
% ylabel('[rad]')
% plot(T, Z(1,:))
% plot(T, Z(2,:))
% plot(T, Z(3,:))
% legend('alpha', 'beta', 'gama')

figure('Name', '�ngulos dos bra�os medidos a partir da horizontal')
hold on
xlabel('t [%]')
ylabel('[�]')
angulosPlot = plot(T, Z(:,1) * 180/pi, T, Z(:,2) * 180/pi, T, Z(:,3) * 180/pi);
angulosPlot(1).LineWidth = 2;
angulosPlot(2).LineWidth = 2;
angulosPlot(3).LineWidth = 2;
legend('alpha', 'beta', 'gama')

figure('Name', '�ngulos dos bra�os nos motores')
hold on
xlabel('t [%]')
ylabel('[�]');
tetasPlot = plot(T, teta(:,1), T, teta(:,2), T, teta(:,3));
tetasPlot(1).LineWidth = 2;
tetasPlot(2).LineWidth = 2;
tetasPlot(3).LineWidth = 2;
legend('Motor 1', 'Motor 2', 'Motor 3')

x = p(:,1)';
y = p(:,2)';

xIdeal = pIdeal(:,1)';
yIdeal = pIdeal(:,2)';

figure('Name', 'Trajet�rias ideal e real')
hold on

trajIdeal = plot(xIdeal, yIdeal, 'g');
trajIdeal.LineWidth = 2.5;

trajReal = plot(x, y, 'o');

xlabel('x [m]')
ylabel('y [m]')

legend('Ideal', 'Real')

% axis(plotLimits)
axis(closeLimits)