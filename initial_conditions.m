%Condi��es Iniciais Aeronave
global lat lon alt yaw rol pit Vx Vy Vz
lat =  -28.1257*111139+1000;
lon =  -49.4744*111139+3000;
alt =  5000;
yaw = 0;
rol = 0;
pit = 0;
Vx = 100;
Vy = 100;
Vz = 10;

%Posi��o Radar Solo
global latradar lonradar altradar varradar
latradar =  -28.1257*111139;   %Retirado do Google Maps
lonradar =  -49.4744*111139;   %Retirado do Google Maps
altradar =  1820;              %Retirado do Google
varradar = 625;

%Condi��es Iniciais E-99
global late99 lone99 alte99 yawe99 role99 pite99 Vxe99 Vye99 Vze99 vare99
late99 =  -28.1257*111139+7000;
lone99 =  -49.4744*111139-9000;
alte99 =  6000;
yawe99 = 0;
role99 = 0;
pite99 = 0;
Vxe99 = 0;
Vye99 = -500;
Vze99 = -50;
vare99   = 100;

%Condi��es Iniciais F-5
global latf5 lonf5 altf5 yawf5 rolf5 pitf5 Vxf5 Vyf5 Vzf5 varf5
latf5 =  -28.1257*111139-6000;
lonf5 =  -49.4744*111139+5000;
altf5 =  6000;
yawf5 = 0.5;
rolf5 = 0;
pitf5 = 0;
Vxf5  = 10;
Vyf5  = 500;
Vzf5  = 10;
varf5 = 25;