function [ position ] = trilateration( r1 , r2 , r3 , medida1 , medida2 , medida3 )

XYZ_beacons=[r1(1) r1(2) r1(3);r2(1) r2(2) r2(3);r3(1) r3(2) r3(3)];
measured_dist=[medida1(1);medida2(1);medida3(1)];
dist_fun=@(pos) sqrt(sum((bsxfun(@minus,XYZ_beacons,pos(:)')).^2,2));
cost_function=@(pos) sum((dist_fun(pos)-measured_dist(:)).^2);
initial_guess=[r3(1) r3(2) r3(3)];
position=fminsearch(cost_function,initial_guess);

end