tetaMin = -135 * pi/180;
tetaMax = +135 * pi/180;
tetaN = 60;

xSpace = zeros(tetaN^3,1);
ySpace = zeros(tetaN^3,1);
i = 1;
for al = linspace(tetaMin, tetaMax, tetaN)
    
    for be = linspace(tetaMin + al, tetaMax + al, tetaN)
        
        for ga = linspace(tetaMin + be, tetaMax + be, tetaN)
            xSpace(i) = L1*cos(al) + L2*cos(be) + L3*cos(ga);
            ySpace(i) = Altura + L1*sin(al) + L2*sin(be) + L3*sin(ga);
            i = i + 1;
        end
    end
end

plot(xSpace, ySpace, '.');
axis(plotLimits)
clear ySpace
clear xSpace