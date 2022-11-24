function [ dx ] = trajectory_e99( x )



dx = [ x(4)    %Vx
       x(5)    %Vy
       x(6)    %Vz
       0
       0
       0 ];

end
