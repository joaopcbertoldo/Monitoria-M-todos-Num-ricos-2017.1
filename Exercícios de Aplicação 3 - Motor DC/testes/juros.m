r = 0.1;
R = 1 + r;
Div = 100;
P = 16.27; 

n = 10;

N = n + 1; 

A = eye(N);
A(2:(N+1):(numel(A)-N)) = -R;

b = zeros(N,1);
b(1) = Div;
b(2:end) = -P;
% b(N) = 0;

divs = (A\b);

clc
fprintf(['Dívida inicial : R$%.2f \n',...
         'Taxa de juros : %.2f ao mês \n',...
         'Pagamento por mês : R$%g \n',...
         'Número de meses : %d \n',...
         'Sequência da dívida :  \n'],...
         Div,r*100,P,n);
disp(divs)