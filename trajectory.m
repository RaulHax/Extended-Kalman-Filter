function [ dx ] = trajectory( x )

dx = [ x(4)    %Vx
       x(5)    %Vy
       x(6)    %Vz
       0
       0
       0 ];

end


%Separar em 3 arquivos, um para cada trajetoria
%No caso do meu objeto a aceleração seria a entrada de controle
