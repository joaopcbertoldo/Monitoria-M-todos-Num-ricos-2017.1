figure

color = [1 0.5 0.75];
sobra = lb/2-d_E;

p10 = [-sobra wb/2];
p20 = [lb-sobra wb/2];
p30 = [lb-sobra -wb/2];
p40 = [-sobra -wb/2];
x = [p10(1) p20(1) p30(1) p40(1)];
y = [p10(2) p20(2) p30(2) p40(2)];
barra = fill(x,y,color);

hold on
plot(0,0,'.b','MarkerSize',30)
hold off

limits = [-wb, lb+sobra, -wb, lb+sobra];
axis(limits)

fps = K/(Tf-T0);
spf = fps^-1;
time = timer('TimerFcn',@(~,~) '','StartDelay',spf);

for k = 0:K
    start(time);
    th = tetab(k+1);
    Rot = [cos(th) -sin(th) ;...
           sin(th)  cos(th)];
    p1 = Rot*p10';
    p2 = Rot*p20';
    p3 = Rot*p30';
    p4 = Rot*p40';
    x = [p1(1) p2(1) p3(1) p4(1)];
    y = [p1(2) p2(2) p3(2) p4(2)];
    barra.XData = x;
    barra.YData = y;
    wait(time);
end