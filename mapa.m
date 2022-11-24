addpath('3D_models/map_database');

%Carrega Base do Mapa
fileID = fopen('28_495cor_rec.txt','r');
M1 = textscan(fileID,'%f %f %d',inf);
fclose(fileID);

fileID = fopen('28_51_cor_rec.txt','r');
M2 = textscan(fileID,'%f %f %d',inf);
fclose(fileID);

x1 = M1{1}';
y1 = M1{2}';
z1 = M1{3};
x2 = M2{1}';
z2 = M2{3};
x = [x2(1:1860) x1(1:1860)]*111139;  %1 grau em latitude/longitude é aproximadamente 111139 metros
y = y1(1:1860:2343600)*111139;
z1 = reshape(z1,length(x)/2,length(y));
z2 = reshape(z2,length(x)/2,length(y));
z = [z2;z1];
z = z';

ax = axes('XLim',[min(x) max(x)],'YLim',[min(y) max(y)],'ZLim',[0 120000]);

janelax1 = 1755;
janelax2 = 2029;
janelay1 = 75;
janelay2 = 289;
s = 1;

m = surf(x(janelax1:s:janelax2),y(janelay1:s:janelay2),double(z(janelay1:s:janelay2,janelax1:s:janelax2)));
shading interp;
colormap(summer);
hold all

figure(1)
axis equal

axis([-49.4744*111139-10000 -49.4744*111139+10000 -28.1257*111139-10000 -28.1257*111139+10000 0 12000])
view(3);
grid on;
xlabel('X')
ylabel('Y')
zlabel('Z')