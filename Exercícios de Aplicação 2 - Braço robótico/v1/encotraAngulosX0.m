precision = 10^-6;
iMax = 100;

% Z0 = [-30 -10 -90]'*pi/180;
Z0 = [0 -10 -90]'*pi/180;
Zk = Z0;
i = 0;
err = inf;
while (err > precision & i <= iMax)
    Zk_1 = Zk - double(J(Zk(1), Zk(2), Zk(3))) \ double(H(Zk(1), Zk(2), Zk(3)));
    err = norm(Zk_1 - Zk);
    Zk = Zk_1;
    i = i + 1;
end
Z = Zk;
double(pRoboAngG(Z(1), Z(2), Z(3)))