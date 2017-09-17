clear
clc
close all

xPlotMin = 0;
xPlotMax = 2.15;
yPlotMin = 0;
yPlotMax = 1.85;

plotLimits = [xPlotMin xPlotMax yPlotMin yPlotMax];

L1 = 1.5; % m
L2 = 1.0; % m 
L3 = 0.5; % m
Altura = 1.0; % m

x0 = 2.1; % m
y0 = 0.1; % m
gama0 = -90 * pi/180;
xf = 1.9; %m 
flecha = 0.10; % m

yf = y0; % m
x_ = (x0 + xf) / 2; % m
y_ = y0 + flecha; % m

p0 = [x0 y0]'; % m
pf = [xf yf]'; % m
p_ = [x_ y_]; % m
