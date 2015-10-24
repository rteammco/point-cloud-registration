function [ R ] = getRandRotation( )
%getRandRotation Returns a random valid rotation matrix R.

    Rx = rotationmat3D(rand()*2*pi, [1 0 0]);
    Ry = rotationmat3D(rand()*2*pi, [0 1 0]);
    Rz = rotationmat3D(rand()*2*pi, [0 0 1]);
    R = Rx * Ry * Rz;
    
    %R = rotationmat3D(rand()*2*pi, [1 1 1]);

end

