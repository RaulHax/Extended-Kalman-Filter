function [ c , e , f , medida1 , medida2 , medida3 , erro1 , erro2 , erro3 , position , errotri , sk , errokalman , erromedio1 , erromedio2 , erromedio3 , erromediotri , erromediokalman ,p1,p2,p3,p4,p5,p6,p7,p8,p9] = simulation( T , N )

global lat lon alt Vx Vy Vz
global latradar lonradar altradar varradar
global late99 lone99 alte99 Vxe99 Vye99 Vze99 vare99
global latf5 lonf5 altf5 Vxf5 Vyf5 Vzf5 varf5

%%Inicializa��o
n=6;                %N�mero de Estados
c=zeros(n,N);
e=zeros(n,N);
f=zeros(n,N);

c(:,1) = [ lon ; lat ; alt ; Vx ; Vy ; Vz ];
e(:,1) = [ lone99 ; late99 ; alte99 ; Vxe99 ; Vye99 ; Vze99 ];
f(:,1) = [ lonf5 ; latf5 ; altf5 ; Vxf5 ; Vyf5 ; Vzf5 ];
r2(:,N) = [0;0;0];
r3(:,N) = [0;0;0];

medida1(1:N) = 0;
medida2(1:N) = 0;
medida3(1:N) = 0;

mr1(1:N) = 0;
mr2(1:N) = 0;
mr3(1:N) = 0;

erro1(1:N) = 0;
erro2(1:N) = 0;
erro3(1:N) = 0;

position(:,N) = [0;0;0] ;
errotri(:,N) = [0;0;0] ;

sk=zeros(n,N);
errokalman=zeros(n,N);

%%Simula��o
for k=1:N
 
    dxc = trajectory( c(:,k) );
    dxe = trajectory_e99( e(:,k) );
    dxf = trajectory_f5( f(:,k) );
    c(:,k+1) = T*dxc + c(:,k);
    e(:,k+1) = T*dxe + e(:,k);
    f(:,k+1) = T*dxf + f(:,k);
    r1 = [ lonradar ; latradar ; altradar ];
    r2(:,k) = e(1:3,k);
    r3(:,k) = f(1:3,k);

    %%Coleta de Dados
    medida1(k) = sqrt((c(1,k)-r1(1))^2+(c(2,k)-r1(2))^2+(c(3,k)-r1(3))^2)+randn()*sqrt(varradar);
    medida2(k) = sqrt((c(1,k)-r2(1,k))^2+(c(2,k)-r2(2,k))^2+(c(3,k)-r2(3,k))^2)+randn()*sqrt(vare99);
    medida3(k) = sqrt((c(1,k)-r3(1,k))^2+(c(2,k)-r3(2,k))^2+(c(3,k)-r3(3,k))^2)+randn()*sqrt(varf5);

    mr1(k) = sqrt((c(1,k)-r1(1))^2+(c(2,k)-r1(2))^2+(c(3,k)-r1(3))^2);
    mr2(k) = sqrt((c(1,k)-r2(1,k))^2+(c(2,k)-r2(2,k))^2+(c(3,k)-r2(3,k))^2);
    mr3(k) = sqrt((c(1,k)-r3(1,k))^2+(c(2,k)-r3(2,k))^2+(c(3,k)-r3(3,k))^2);    
    
    erro1(k) = abs(medida1(k)-mr1(k));
    erro2(k) = abs(medida2(k)-mr2(k));
    erro3(k) = abs(medida3(k)-mr3(k));
        
    %%Estima��o de Posi��o por Trilatera��o
    position(:,k) = trilateration( r1 , r2(:,k) , r3(:,k) , medida1(k) , medida2(k) , medida3(k) ); %Posi��o por trilatera��o?
    
    errotri(:,k) = abs(position(:,k)-c(1:3,k));
    
    %%Filtro de Kalman
    sk(:,k)=ekf( k , r1 , r2(:,k) , r3(:,k) , medida1(k) , medida2(k) , medida3(k) , position(:,1));
    
    errokalman(:,k) = abs(sk(:,k)-c(:,k));
    
end

erromedio1 = sum(erro1)/numel(erro1);
erromedio2 = sum(erro2)/numel(erro2);
erromedio3 = sum(erro3)/numel(erro3);

erromediotri = sum(errotri,2)/size(errotri,2);
erromediokalman = sum(errokalman,2)/size(errokalman,2);

pd1 = fitdist(erro1','Normal');
pd2 = fitdist(erro2','Normal');
pd3 = fitdist(erro3','Normal');
pd4 = fitdist(errotri(1,:)','Normal');
pd5 = fitdist(errotri(2,:)','Normal');
pd6 = fitdist(errotri(3,:)','Normal');
pd7 = fitdist(errokalman(1,:)','Normal');
pd8 = fitdist(errokalman(2,:)','Normal');
pd9 = fitdist(errokalman(3,:)','Normal');

time = -max([erro1,erro2,erro3]):0.1:max([erro1,erro2,erro3]);
time1 = -max([errotri(1,:),errokalman(1,:)]):0.1:max([errotri(1,:),errokalman(1,:)]);
time2 = -max([errotri(2,:),errokalman(2,:)]):0.1:max([errotri(2,:),errokalman(2,:)]);
time3 = -max([errotri(3,:),errokalman(3,:)]):0.1:max([errotri(3,:),errokalman(3,:)]);

p1=pdf(pd1,time);
p2=pdf(pd2,time);
p3=pdf(pd3,time);
p4=pdf(pd4,time1);
p5=pdf(pd5,time2);
p6=pdf(pd6,time3);
p7=pdf(pd7,time1);
p8=pdf(pd8,time2);
p9=pdf(pd9,time3);

end

