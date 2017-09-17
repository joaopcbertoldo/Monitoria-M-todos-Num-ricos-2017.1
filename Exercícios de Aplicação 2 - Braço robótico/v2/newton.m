function [Z] = newton(Z0, XAlvo)
global precision iMax
Zk = Z0;
i = 0;
err = inf;
while (err > precision && i <= iMax)
    alpha = Zk(1);
    beta = Zk(2);
    gama = Zk(3);
    
    f = (3*cos(alpha))/2 + cos(beta) + cos(gama)/2 - XAlvo(1);
    g = (3*sin(alpha))/2 + sin(beta) + sin(gama)/2 + 1 - XAlvo(2);
    h = gama - XAlvo(3);
    
    H = [f g h]';
    
    J11 = -(3*sin(alpha))/2;
    J12 = -sin(beta);
    J13 = -sin(gama)/2;
    
    J21 = (3*cos(alpha))/2;
    J22 = cos(beta);
    J23 = cos(gama)/2;
    
    J = [J11 J12 J13; 
         J21 J22 J23; 
         0 0 1];
    
    Zk_1 = Zk - J \ H;
    err = norm(Zk_1 - Zk);
    Zk = Zk_1;
    i = i + 1;
end
Z = Zk;
end
