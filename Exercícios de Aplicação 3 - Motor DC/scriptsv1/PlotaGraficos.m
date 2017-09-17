close all

xaxis = [0 max(t); 0 0];

figure
set(gcf, 'Position', get(0,'Screensize')); 

titleFontSize = 15;

subplot(221)
stairs( t, tetab*180/pi )
hTitle = title('$\theta_b$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
xlabel('t [seg]')
ylabel('º')

subplot(223)
stairs( t, tetabp*180/pi )
hTitle = title('$\dot{\theta_b}$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
xlabel('t [seg]')
ylabel('º/seg')
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

subplot(222)
hold on
yyaxis left
stairs( t, vm, 'b' )
hold on; plot(xaxis(1,:),xaxis(2,:),'b--'); hold off;
ylabel('Volts')
yyaxis right
stairs( t, im, 'r' )
hold on; plot(xaxis(1,:),xaxis(2,:),'r--'); hold off;
ylabel('Ampéres')
hold off
xlabel('t [seg]')
hTitle = title('$v_m$ e $i_m$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
hLegend = legend('$v_m$','$v_m = 0$','$i_m$','$i_m = 0$');
set(hLegend,'Interpreter','latex','FontSize',14);

subplot(224)
stairs(t,pm);
hTitle = title('$p_m$');
set(hTitle,'Interpreter','latex','FontSize',titleFontSize);
xlabel('t [seg]')
ylabel('Watts')
hold on; plot(xaxis(1,:),xaxis(2,:),'k--'); hold off;

