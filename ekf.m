function [ sk ] = ekf( k , r1 , r2 , r3 , medida1 , medida2 , medida3 , position )
%Filtro de Kalman

global T varradar vare99 varf5

%Espaço de Estados
Ac = [ zeros(3,3) eye(3)     
       zeros(3,3) zeros(3,3) ];
Bc = [ zeros(3,3)  
       eye(3)     ];

%Discretizaçãoo
A = T*Ac+eye(6);
B = T*Bc;
Q = 1e-4*eye(6);                        %Incerteza do modelo
R = diag([ varradar vare99 varf5 ]);    %Covariância do ruído dos sensores
ua = zeros(3,1);
xk = sym( 'xk' , [6 1] );
u = sym( 'u' , [3 1] );

persistent X P

%Predição
if k==1
      X = [ position(1)
            position(2)
            position(3)
            0
            0
            0                   ];
      P = 1e+2*eye(6);
else
      X = A*X+B*ua;
      P = A*P*A'+Q;

h = [ sqrt((xk(1)-r1(1))^2+(xk(2)-r1(2))^2+(xk(3)-r1(3))^2)   
      sqrt((xk(1)-r2(1))^2+(xk(2)-r2(2))^2+(xk(3)-r2(3))^2) 
      sqrt((xk(1)-r3(1))^2+(xk(2)-r3(2))^2+(xk(3)-r3(3))^2) ];

CC = jacobian(h,xk);
C = subs( CC , [xk;u] , [X;ua] );
hk = subs( h , [xk;u] , [X;ua] );

C = double(C);
hk = double(hk);

%Correção
S = C*P*C'+R;
L = (P*C')/S;
X = X + L*([medida1 ; medida2 ; medida3]-hk);
P = P - L*C*P;

end

%Saída Filtro de Kalman Extendido
sk = X;

end