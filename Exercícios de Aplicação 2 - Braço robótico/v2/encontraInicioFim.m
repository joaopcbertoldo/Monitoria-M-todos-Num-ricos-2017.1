pAlvo = double(pTraj(0));
Z0 = [0 -10 -90]'*pi/180;
Z = newton(Z0, pAlvo);
pInicio = double(pRobo(Z(1),Z(2),Z(3)))

pAlvo = double(pTraj(100));
Z0 = Z;
Z = newton(Z0, pAlvo);
pFim = double(pRobo(Z(1),Z(2),Z(3)))

clear Z0 Z pAlvo