parametros;

M = [x0^2 x0 1; xf^2 xf 1; x_^2 x_ 1];
P = [y0 yf y_]';

ABC = M\P;
a = ABC(1);
b = ABC(2);
c = ABC(3);

syms xTraj yTraj
yTraj(xTraj) = a*xTraj^2 + b*xTraj + c;
N = 100;
xTrajPlot = linspace(x0,xf,N);
yTrajPlot = yTraj(xTrajPlot);

figure
plot(xTrajPlot, yTrajPlot,'.');
axis(plotLimits)