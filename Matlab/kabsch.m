function [ R ] = kabsch( P, Q )
%kabsch Runs the Kabsch algorithm to find the rotation matrix that
%   transforms Q such that it is best aligned with P.
%   P and Q are matrices where each row is a 3D point (x, y, z). The
%   indices of both matrices align such that each row in P is a
%   correspondence point to the same row in Q.
%   Returns rotation matrix R that transforms Q to P.
    
    % Center both matrices at the origin.
    P = P - (mean(P)' * ones(1, size(P, 1)))';
    Q = Q - (mean(Q)' * ones(1, size(Q, 1)))';
    
    % Compute covariance matrix.
    A = P'*Q;
    
    % Decompose M using SVD.
    [U, D, V] = svd(A);
    
    % Set E = I with the 3,3 element as sign(det(UV'))
    E = eye(3);
    E(3, 3) = sign(det(U*V'));
    
    % Solve for R.
    R = U*E*V';

end

