global yaw rol pit
global latradar lonradar altradar
global yawe99 role99 pite99
global yawf5 rolf5 pitf5

run mapa.m
run aviao_comercial.m
run radar_solo.m
run e_99.m
run f_5.m

%% Plotagem Comparação
figure(2)
subplot(3,1,1)
hold all
plot(1:N,c(1,1:N),'o','Color',[0.7 0.7 0.7])
plot(1:N,position(1,:),'x','Color','r')
plot(1:N,sk(1,:),'.','Color','b')
title('X')
subplot(3,1,2)
hold all
plot(1:N,c(2,1:N),'o','Color',[0.7 0.7 0.7])
plot(1:N,position(2,:),'x','Color','r')
plot(1:N,sk(2,:),'.','Color','b')
title('Y')
subplot(3,1,3)
hold all
plot(1:N,c(3,1:N),'o','Color',[0.7 0.7 0.7])
plot(1:N,position(3,:),'x','Color','r')
plot(1:N,sk(3,:),'.','Color','b')
title('Z')
%legend('Posição Real','EKF')
legend('Posição Real','Trilateração','EKF')
set(figure(2),'Position',[ 1009  278   560   420 ]);

figure(4)
grid on;
hold on
plot(1:N,erro1,'-','Color',[0.9290 0.6940 0.1250])
plot(1:N,erro2,'-','Color',[0.4660 0.6470 0.1880])
plot(1:N,erro3,'-','Color',[0.4940 0.1840 0.5560])
legend('Radar de Solo','E-99M','F-5EM')
% set(figure(4),'Position',[ 1009  278   560   420 ]);

figure(5)
subplot(3,1,1)
grid on;
hold all
plot(1:N,errotri(1,:),'-','Color','r')
plot(1:N,errokalman(1,:),'-','Color','b')
title('Erro X [m]')
subplot(3,1,2)
grid on;
hold all
plot(1:N,errotri(2,:),'-','Color','r')
plot(1:N,errokalman(2,:),'-','Color','b')
title('Erro Y [m]')
subplot(3,1,3)
grid on;
hold all
plot(1:N,errotri(3,:),'-','Color','r')
plot(1:N,errokalman(3,:),'-','Color','b')
title('Erro Z [m]')
legend('Trilateração','EKF')
% set(figure(4),'Position',[ 1009  278   560   420 ]);

figure(6)
grid on;
hold all
plot(-max([erro1,erro2,erro3]):0.1:max([erro1,erro2,erro3]),p1)
plot(-max([erro1,erro2,erro3]):0.1:max([erro1,erro2,erro3]),p2)
plot(-max([erro1,erro2,erro3]):0.1:max([erro1,erro2,erro3]),p3)
title('Funções de Distribuição Probabilística')
xlabel('Erro de Medida [m]')
ylabel('Densidade Probabilistica')
legend('Radar de Solo','E-99M','F-5EM')

figure(7)
subplot(3,1,1)
grid on;
hold all
plot(-max([errotri(1,:)]):0.1:max([errotri(1,:)]),p4,'-','Color','r')
plot(-max([errotri(1,:)]):0.1:max([errotri(1,:)]),p7,'-','Color','b')
title('Erro X')
subplot(3,1,2)
grid on;
hold all
plot(-max([errotri(2,:)]):0.1:max([errotri(2,:)]),p5,'-','Color','r')
plot(-max([errotri(2,:)]):0.1:max([errotri(2,:)]),p8,'-','Color','b')
title('Erro Y')
subplot(3,1,3)
grid on;
hold all
plot(-max([errotri(3,:),errokalman(3,:)]):0.1:max([errotri(3,:),errokalman(3,:)]),p6,'-','Color','r')
plot(-max([errotri(3,:)]):0.1:max([errotri(3,:)]),p9,'-','Color','b')
title('Erro Z')
xlabel('Erro de Medida [m]')
ylabel('Densidade Probabilistica')
legend('Trilateração','EKF')

%% Animação
set(figure(1),'Position',[ 425   280   560   420 ]);
for k=1:N
    
if c(4,k)>=0
   eixo1=-1;
else
   eixo1=1;
end

if e(4,k)>=0
   eixo2=-1;
else
   eixo2=1; 
end

if f(4,k)>=0
   eixo3=-1;
else
   eixo3=1; 
end    

if c(5,k)==0
   offset1=0;
else
   offset1=3*pi/2;
end

if e(5,k)==0
   offset2=0;
else
   offset2=3*pi/2; 
end

if f(5,k)==0
   offset3=0;
else
   offset3=3*pi/2; 
end    
   
if c(4,k)==0 && c(5,k)==0
   offset4=1;
else
   offset4=0;
end

if c(6,k)==0 && c(5,k)==0
   offset5=1;
else
   offset5=0;
end

if e(4,k)==0 && e(5,k)==0
   offset6=1;
else
   offset6=0;
end

if e(6,k)==0 && e(5,k)==0
   offset7=1;
else
   offset7=0;
end

if f(4,k)==0 && f(5,k)==0
   offset8=1;
else
   offset8=0;
end

if f(6,k)==0 && f(5,k)==0
   offset9=1;
else
   offset9=0;
end

    yaw(k)    = acos(c(5,k)/(sqrt((abs(c(4,k))^2)+(abs(c(5,k))^2))+offset4))*eixo1;
    pit(k)    = (acos(c(6,k)/(sqrt((abs(c(6,k))^2)+(abs(c(5,k))^2))+offset5))+offset1)*-1;
    yawe99(k) = acos(e(5,k)/(sqrt((abs(e(4,k))^2)+(abs(e(5,k))^2))+offset6))*eixo2;
    pite99(k) = (acos(e(6,k)/(sqrt((abs(e(6,k))^2)+(abs(e(5,k))^2))+offset7))+offset2)*-1;
    yawf5(k)  = acos(f(5,k)/(sqrt((abs(f(4,k))^2)+(abs(f(5,k))^2))+offset8))*eixo3;
    pitf5(k)  = (acos(f(6,k)/(sqrt((abs(f(6,k))^2)+(abs(f(5,k))^2))+offset9))+offset3)*-1;
    
    linha = plot3([c(1,k) c(1,k)],[c(2,k) c(2,k)],[0 c(3,k)],'--','Color','k');
    linha2 = plot3([lonradar c(1,k)],[latradar c(2,k)],[altradar+rr*4 c(3,k)],'--','Color','k');
    linha3 = plot3([f(1,k) c(1,k)],[f(2,k) c(2,k)],[f(3,k) c(3,k)],'--','Color','k');
    linha4 = plot3([e(1,k) c(1,k)],[e(2,k) c(2,k)],[e(3,k) c(3,k)],'--','Color','k');
    linha5 = plot3([e(1,k) e(1,k)],[e(2,k) e(2,k)],[0 e(3,k)],'--','Color','k');
    linha6 = plot3([f(1,k) f(1,k)],[f(2,k) f(2,k)],[0 f(3,k)],'--','Color','k');
%Aeronave
    posit1 = plot3(c(1,k),c(2,k),c(3,k),'.','MarkerSize',0.5,'Color','k');
    trans1 = makehgtform('translate',[c(1,k) c(2,k) c(3,k)]);
    rotz1  = makehgtform('zrotate',yaw(k));
    roty1  = makehgtform('yrotate',rol);
    rotx1  = makehgtform('xrotate',pit(k));
    set(com,'Matrix',trans1*rotz1*roty1*rotx1);
%Radar de Solo
    trans4 = makehgtform('translate',[lonradar latradar altradar]);
    set(radar,'Matrix',trans4);
%E-99
    posit2 = plot3(e(1,k),e(2,k),e(3,k),'.','MarkerSize',0.5,'Color','k');
    trans2 = makehgtform('translate',[e(1,k) e(2,k) e(3,k)]);
    rotz2  = makehgtform('zrotate',yawe99(k));
    roty2  = makehgtform('yrotate',role99);
    rotx2  = makehgtform('xrotate',pite99(k));
    set(e99,'Matrix',trans2*rotz2*roty2*rotx2);
%F-5
    posit3 = plot3(f(1,k),f(2,k),f(3,k),'.','MarkerSize',0.5,'Color','k');
    trans3 = makehgtform('translate',[f(1,k) f(2,k) f(3,k)]);
    rotz3  = makehgtform('zrotate',yawf5(k));
    roty3  = makehgtform('yrotate',rolf5);
    rotx3  = makehgtform('xrotate',pitf5(k));
    set(f5,'Matrix',trans3*rotz3*roty3*rotx3);
    if k==1
%         return
        pause
    end
    pause(0.1)
    delete(linha)
    delete(linha2)
    delete(linha3)
    delete(linha4)
    delete(linha5)
    delete(linha6)
end
plot3([c(1,k) c(1,k)],[c(2,k) c(2,k)],[0 c(3,k)],'--','Color','k');
plot3(e(1,k),e(2,k),e(3,k),'.','MarkerSize',0.5,'Color','k');
plot3([lonradar c(1,k)],[latradar c(2,k)],[altradar+rr*4 c(3,k)],'--','Color','k');
plot3([f(1,k) c(1,k)],[f(2,k) c(2,k)],[f(3,k) c(3,k)],'--','Color','k');
plot3([e(1,k) c(1,k)],[e(2,k) c(2,k)],[e(3,k) c(3,k)],'--','Color','k');
plot3([e(1,k) e(1,k)],[e(2,k) e(2,k)],[0 e(3,k)],'--','Color','k');
plot3([f(1,k) f(1,k)],[f(2,k) f(2,k)],[0 f(3,k)],'--','Color','k');