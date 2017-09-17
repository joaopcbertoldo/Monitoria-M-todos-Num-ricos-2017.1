L=[];

for k=1:99,
    L=blkdiag(L,-a);
end

La = [zeros(3,297); L];
La = La + eye(size(La));

L=[];
for k=1:100,
    L=blkdiag(L,-b);
end

Lb = L;

Bloco_cima = [La Lb];


xsol = Bloco_cima\[A*x0 ; zeros(300-6,1); -xf];
% verificando residuo:
norm(Bloco_cima*xsol- [A*x0 ; zeros(300-6,1); -xf])

xsol = pinv(Bloco_cima)*[A*x0 ; zeros(300-6,1); -xf];
% verificando residuo:
norm(Bloco_cima*xsol- [A*x0 ; zeros(300-6,1); -xf])

plot(xsol)


% adicionando restricoes para tirar graus liberdade excessivos

L1 = [zeros(97,1) eye(97,97) zeros(97,2) ];
L2 = [zeros(97,2) -eye(97,97) zeros(97,1) ];
% L1+L2;

Bloco_baixo = [ zeros(97,297) L1+L2];

M_= [Bloco_cima; Bloco_baixo];

sum(eig(M_*M_')<1e-10)

vet_= [ A*x0 ; zeros(300-6,1) ; -xf ; zeros(97,1) ];

xsol = M_\vet_;
% verificando residuo:
norm(M_*xsol- vet_)

plot(xsol)



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % refazendo para tirar algumas restricoes (duas = sum(eig(M_*M_')<1e-10)
% 
% L1 = [zeros(95,1) eye(95,95) zeros(95,4) ];
% L2 = [zeros(95,2) -eye(95,95) zeros(95,3) ];
% % L1+L2;
% 
% Bloco_baixo = [ zeros(95,297) L1+L2];
% M_= [Bloco_cima; Bloco_baixo];
% 
% sum(eig(M_*M_')<1e-10)