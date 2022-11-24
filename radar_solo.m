%% Modelo 3D %TBD Deixar relativo a medida de altura em vez do raio
%Radar
rr = 200;
[Xr,Yr,Zr] = sphere();
Xr = rr*Xr;
Yr = rr*Yr;
Zr = rr*Zr;
Ra(1) = surface(  Xr  ,  Yr  ,  Zr+rr*4  ,  'Facecolor'  ,  [0.3 0.3 0.3]  );
%Torre
Ra(2) = fill3(  [ rr     -rr     -rr*1.2  rr*1.2]  ,  [ rr      rr      rr*1.2  rr*1.2]  ,  [rr*3.2   rr*3.2      0        0  ]  ,  [0.6 0.6 0.6]  );  %Frente
Ra(3) = fill3(  [ rr     -rr     -rr*1.2  rr*1.2]  ,  [-rr     -rr     -rr*1.2 -rr*1.2]  ,  [rr*3.2   rr*3.2      0        0  ]  ,  [0.6 0.6 0.6]  );  %Tr�s
Ra(4) = fill3(  [ rr     -rr     -rr      rr    ]  ,  [ rr      rr     -rr     -rr    ]  ,  [rr*3.2   rr*3.2   rr*3.2   rr*3.2]  ,  [0.6 0.6 0.6]  );  %Topo
Ra(5) = fill3(  [ rr*1.2 -rr*1.2 -rr*1.2  rr*1.2]  ,  [ rr*1.2  rr*1.2 -rr*1.2 -rr*1.2]  ,  [   0        0        0        0  ]  ,  [0.6 0.6 0.6]  );  %Base
Ra(6) = fill3(  [-rr*1.2 -rr     -rr     -rr*1.2]  ,  [ rr*1.2  rr     -rr     -rr*1.2]  ,  [   0     rr*3.2   rr*3.2      0  ]  ,  [0.6 0.6 0.6]  );  %Esquerda
Ra(7) = fill3(  [ rr*1.2  rr      rr      rr*1.2]  ,  [ rr*1.2  rr     -rr     -rr*1.2]  ,  [   0     rr*3.2   rr*3.2      0  ]  ,  [0.6 0.6 0.6]  );  %Direita

radar = hgtransform('Parent',ax);
set(Ra,'Parent',radar)
set(Ra,'LineStyle','none')