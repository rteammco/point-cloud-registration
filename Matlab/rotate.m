function [ rotated ] = rotate( A, R )
%rotate Rotates A by R.

    rotated = zeros(size(A));
    for i = 1 : size(A, 1)
        rotated(i, :) = (R * A(i, :)')';
    end

end

