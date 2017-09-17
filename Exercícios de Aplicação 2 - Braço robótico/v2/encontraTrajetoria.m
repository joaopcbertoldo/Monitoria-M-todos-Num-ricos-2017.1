clc

N = 200;
Z = zeros(N,3);
i = 1;
T = linspace(0, 100, N);

for t = T
    
    pAlvo = double(pTraj(t));
    
    if(i == 1)
        Z0 = [0 -10 -90]'*pi/180;
    else
        Z0 = Z(i-1,:)';
    end
    
    Z(i,:) = newton(Z0, pAlvo)';
    
    i = i + 1;
end

teta = [Z(:,1) (Z(:,2) - Z(:,1)) (Z(:,3) - Z(:,2))];
teta = teta .* (180/pi);

if min(teta(:)) >= -135 && max(teta(:)) <= 135
    disp('ok')
else
    disp('posição impossível ocorreu')
end

p = zeros(size(Z, 1), 3);
for i = 1:size(Z, 1)
    p(i,:) = double(pRobo(Z(i,1), Z(i,2), Z(i,3)))';
end

pIdeal = zeros(size(Z, 1), 3);
i = 1;
for t = T
    pIdeal(i,:) = double(pTraj(t))';
    i = i + 1;
end

clear i t pAlvo N Z0
