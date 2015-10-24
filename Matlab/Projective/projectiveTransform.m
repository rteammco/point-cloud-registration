function [ Y ] = projectiveTransform( X, H )
%projectiveTransform Transforms the matrix X by the homography H.
%   H should be 4 by 4 and X should be n by 3 where each row is a 3D point.

    num_points = size(X, 1);

    % Some assertions.
    assert(size(H, 1) == 4 && size(H, 2) == 4);
    assert(size(X, 2) == 3);

    % First project X into homogeneous coordinates.
    X(:, 4) = 1;

    % Build Y using the transformation of each point from X. While doing
    % this, also project each point back into Cartesian coordanates.
    Y = zeros(num_points, 3);
    for i = 1 : num_points
        x = H * X(i, :)';
        Y(i, :) = x(1:3) / x(4);
    end

end

