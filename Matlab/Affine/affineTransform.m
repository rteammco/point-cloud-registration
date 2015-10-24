function [ Y ] = affineTransform( X, H )
%affineTransform Transforms the matrix X by the homography H.
%   H should be 4 by 4 and X should be n by 3 where each row is a 3D point.

% TODO: this is the same code as the other one... combine it.

    num_points = size(X, 1);

    % Some assertions.
    assert(size(H, 1) == 4 && size(H, 2) == 4);
    assert(size(X, 2) == 3);

    % Extract the translation and rotation matrices.
    R = H(1:3, 1:3);
    t = H(1:3, 4);

    % First project X into homogeneous coordinates.
    X(:, 4) = 1;

    % Build Y using the transformation of each point from X. While doing
    % this, also project each point back into Cartesian coordanates.
    Y = zeros(num_points, 3);
    for i = 1 : num_points
        x = H * X(i, :)';
        Y(i, :) = x(1:3) / x(4);
        %x = R * X(i, :)';
        %x = x + t;
        %Y(i, :) = x;
    end

end

