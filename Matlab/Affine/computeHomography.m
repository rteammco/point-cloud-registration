function [ H ] = computeHomography( P, Q )
%computeHomography Computes a 3D homography transformation for the given
%   set of correspondences P and Q.
%   P and Q are n by 3 matrices, where each row is an x, y, z coordinate.
%   Both P and Q are correspondences, so the index of each point in P
%   aligns with the point in Q at that same index.

    num_points = size(P, 1);

    % Run some basic assertions about the input.
    assert(size(Q, 1) == num_points);
    assert(num_points >= 4);
    assert(size(P, 2) == 3 && size(Q, 2) == 3);

    % Find A and compute the homography.
    A = buildA(P, Q);
    y = reshape(Q.', num_points*3, 1);
    h = A \ y;
    M = reshape(h(1:9), 3, 3)';
    t = h(10:12);
    H = [M t];
    H(4, :) = [0 0 0 1];

end

