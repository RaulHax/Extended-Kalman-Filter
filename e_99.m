%% Modelo 3D %TBD Deixar relativo a medida de comprimento em vez do raio
%Raio
r = 100;

%Corpo
rc1 = r;
rc2 = rc1;
hc = 10*rc1;
[Xc,Yc,Zc] = cylinder([rc1 rc2]);
Zc = hc*Zc;

%Nariz
rn1 = rc1;
rn2 = 0;
hn = 4*rc1;
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
ra2 = 0.5*rc1;
ha = 7.5*rc1;
[Xa,Ya,Za] = cylinder([ra1 ra2]);
Za = ha*Za;

%Estabilizadores
re1 = rc1;
re2 = 0.5*rc1;
he = 2.5*rc1;
[Xe,Ye,Ze] = cylinder([re1 re2]);
Ze = he*Ze;

%Radar Erieye
rr = rc1*0.05;
hr = rc1;
[Xr,Yr,Zr] = cylinder(rr);
Zr = hr*Zr;

E(1)  = fill3(  [ rc1*0.2 -rc1*0.2 -rc1*0.2  rc1*0.2]  ,  [ rc1*2.5  rc1*2.5  rc1*2.5  rc1*2.5]  ,  [rc1*1.2 rc1*1.2 rc1*1.9 rc1*1.9]  ,  [ 1  0.5  0]  );
E(2)  = fill3(  [ rc1*0.2 -rc1*0.2 -rc1*0.2  rc1*0.2]  ,  [-rc1*2.5 -rc1*2.5 -rc1*2.5 -rc1*2.5]  ,  [rc1*1.9 rc1*1.9 rc1*2.6 rc1*2.6]  ,  [ 1  0.5  0]  );
E(3)  = fill3(  [ rc1*0.2 -rc1*0.2 -rc1*0.2  rc1*0.2]  ,  [ rc1*2.5  rc1*2.5 -rc1*2.5 -rc1*2.5]  ,  [rc1*1.9 rc1*1.9 rc1*2.6 rc1*2.6]  ,  [ 1  0.5  0]  );
E(4)  = fill3(  [ rc1*0.2 -rc1*0.2 -rc1*0.2  rc1*0.2]  ,  [ rc1*2.5  rc1*2.5 -rc1*2.5 -rc1*2.5]  ,  [rc1*1.2 rc1*1.2 rc1*1.9 rc1*1.9]  ,  [ 1  0.5  0]  );
E(5)  = fill3(  [-rc1*0.2 -rc1*0.2 -rc1*0.2 -rc1*0.2]  ,  [ rc1*2.5  rc1*2.5 -rc1*2.5 -rc1*2.5]  ,  [rc1*1.2 rc1*1.9 rc1*2.6 rc1*1.9]  ,  [ 1  0.5  0]  );
E(6)  = fill3(  [ rc1*0.2  rc1*0.2  rc1*0.2  rc1*0.2]  ,  [ rc1*2.5  rc1*2.5 -rc1*2.5 -rc1*2.5]  ,  [rc1*1.2 rc1*1.9 rc1*2.6 rc1*1.9]  ,  [ 1  0.5  0]  );
E(7)  = surface(  Xr       ,  Yr+hc*0.2         ,  Zr+hc*0.05  ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Radar
E(8)  = surface(  Xr       ,  Yr-hc*0.2         ,  Zr+hc*0.08  ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Radar
E(9)  = surface(  Xn*0.8   ,  Zn+hc*0.40        ,  Yn*0.8      ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Nariz
E(10) = surface(  Xc*0.8   ,  Zc-hc*0.60        ,  Yc*0.8      ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Corpo
E(11) = surface(  Za       ,  Xa*1.75           ,  Ya*0.5      ,  'Facecolor'  ,  [ 1  0    0]  );  %Asa Direita
E(12) = surface(  -Za      ,  Xa*1.75           ,  Ya*0.5      ,  'Facecolor'  ,  [ 1  1    0]  );  %Asa Esquerda
E(13) = surface(  Xb*0.8   ,  Zb-hc*0.60        ,  Yb*0.8      ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Rabo
E(14) = surface(  Ze       ,  (Xe*0.75)-hc*0.7  ,  Ye*0.25+he  ,  'Facecolor'  ,  [ 1  0    0]  );  %Estabilizador Direito
E(15) = surface(  -Ze      ,  (Xe*0.75)-hc*0.7  ,  Ye*0.25+he  ,  'Facecolor'  ,  [ 1  1    0]  );  %Estabilizador Esquerdo
E(16) = surface(  Ye*0.25  ,  (Xe*0.75)-hc*0.7  ,  Ze          ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Estabilizador Vertical

e99 = hgtransform('Parent',ax);
set(E,'Parent',e99)
set(E,'LineStyle','none')