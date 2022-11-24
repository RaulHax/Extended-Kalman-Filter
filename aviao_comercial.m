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
rn = rc1;
[Xn,Yn,Zn] = sphere();
Xn = rn*Xn;
Yn = rn*Yn;
Zn = rn*Zn;
Yn(1:10,:) = 0;

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

Co(1) = surface(  Xn       ,  Zn*4+hc*0.40      ,  Yn       ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Nariz
Co(2) = surface(  Xc       ,  Zc-hc*0.60        ,  Yc       ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Corpo
Co(3) = surface(  Za       ,  Xa*1.75           ,  Ya*0.5   ,  'Facecolor'  ,  [ 1  0  0]    );  %Asa Direita
Co(4) = surface(  -Za      ,  Xa*1.75           ,  Ya*0.5   ,  'Facecolor'  ,  [ 1  1  0]    );  %Asa Esquerda
Co(5) = surface(  Xb       ,  Zb-hc*0.60        ,  Yb       ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Rabo
Co(6) = surface(  Ze       ,  (Xe*0.75)-hc*0.7  ,  Ye*0.25  ,  'Facecolor'  ,  [ 1  0  0]    );  %Estabilizador Direito
Co(7) = surface(  -Ze      ,  (Xe*0.75)-hc*0.7  ,  Ye*0.25  ,  'Facecolor'  ,  [ 1  1  0]    );  %Estabilizador Esquerdo
Co(8) = surface(  Ye*0.25  ,  (Xe*0.75)-hc*0.7  ,  Ze       ,  'Facecolor'  ,  [ 1  0.5  0]  );  %Estabilizador Vertical

com = hgtransform('Parent',ax);
set(Co,'Parent',com)
set(Co,'LineStyle','none')