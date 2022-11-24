%% Modelo 3D %TBD Deixar relativo a medida de comprimento em vez do raio
%Raio
r = 100;

%Corpo
rc1 = r;
rc2 = rc1;
hc = 5*rc1;
[Xc,Yc,Zc] = cylinder([rc1 rc2]);
Zc = hc*Zc;

%Nariz
rn1 = rc1;
rn2 = 0;
hn = 5*rc1;
[Xn,Yn,Zn] = cylinder([rn1 rn2]);
Zn = hn*Zn;

%Rabo
rb1 = rc1;
rb2 = 0.5*rb1;
hb = -2.5*rc1;
[Xb,Yb,Zb] = cylinder([rb1 rb2]);
Zb = hb*Zb;

%Asas
ra1 = rc1;
ra2 = 0.3*rc1;
ha = 6*rc1;
[Xa,Ya,Za] = cylinder([ra1 ra2]);
Za = ha*Za;

%Estabilizadores
re1 = rc1;
re2 = 0.5*rc1;
he = 3*rc1;
[Xe,Ye,Ze] = cylinder([re1 re2]);
Ze = he*Ze;

F(1)  = surface(  Xn        ,  Zn+hc*0.40      ,  Yn*0.75  ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Nariz
F(2)  = surface(  Xc        ,  Zc-hc*0.60      ,  Yc*0.75  ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Corpo
F(3)  = surface(  Za        ,  Xa*1.75         ,  Ya*0.25  ,  'Facecolor'  ,  [ 1  0  0]    );  %Asa Direita
F(4)  = surface(  Xc*0.1+ha ,  Zc*0.75-hc*0.3  ,  Yc*0.1   ,  'Facecolor'  ,  [ 1  0  0]    );  %Asa Direita
F(5)  = surface(  -Za       ,  Xa*1.75         ,  Ya*0.25  ,  'Facecolor'  ,  [ 1  1  0]    );  %Asa Esquerda
F(6)  = surface(  Xc*0.1-ha ,  Zc*0.75-hc*0.3  ,  Yc*0.1   ,  'Facecolor'  ,  [ 1  1  0]    );  %Asa Esquerda
F(7)  = surface(  Xb        ,  Zb-hc*0.60      ,  Yb*0.75  ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Rabo
F(8)  = surface(  Ze        ,  (Xe)-hc*0.85    ,  Ye*0.25  ,  'Facecolor'  ,  [ 1  0  0]    );  %Estabilizador Direito
F(9)  = surface(  -Ze       ,  (Xe)-hc*0.85    ,  Ye*0.25  ,  'Facecolor'  ,  [ 1  1  0]    );  %Estabilizador Esquerdo
F(10) = surface(  Ye*0.25   ,  (Xe)-hc*0.85    ,  Ze       ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Estabilizador Vertical

f5 = hgtransform('Parent',ax);
set(F,'Parent',f5)
set(F,'LineStyle','none')