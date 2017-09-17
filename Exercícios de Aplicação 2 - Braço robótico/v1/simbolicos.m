syms alpha beta gama f g h xRobo yRobo angRobo p J H

xRobo(alpha, beta, gama) = L1*cos(alpha) + L2*cos(beta) + L3*cos(gama); 
yRobo(alpha, beta, gama) = Altura + L1*sin(alpha) + L2*sin(beta) + L3*sin(gama);
angRobo(alpha, beta, gama) = gama;

pRobo(alpha, beta, gama) = [xRobo yRobo angRobo]';
pRoboAngG(alpha, beta, gama) = [xRobo yRobo angRobo*180/pi]';

f(alpha, beta, gama) = xRobo - x0;
g(alpha, beta, gama) = yRobo - y0;
h(alpha, beta, gama) = angRobo - gama0;

H = [f g h]';

f_alpha = diff(f, alpha);
f_beta = diff(f, beta);
f_gama =  diff(f, gama);

g_alpha = diff(g, alpha);
g_beta = diff(g, beta);
g_gama =  diff(g, gama);

h_alpha = diff(h, alpha);
h_beta = diff(h, beta);
h_gama =  diff(h, gama);

J(alpha, beta, gama) = [f_alpha f_beta f_gama; g_alpha g_beta g_gama; h_alpha h_beta h_gama];

