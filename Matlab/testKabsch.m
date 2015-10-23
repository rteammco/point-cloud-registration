function [ ] = testKabsch( Obj )
%kabsch Runs the Kabsch algorithm to stitch together two parts of the
%whole object given.
%   Obj is a matrix where each row is a 3D point (x, y, z) for a full 3D
%   object. This function does a few things:
%   1. The full object will be broken up into two parts with some overlap.
%      The points that overlap will be kept as correspondence points.
%   2. If the noise parameter is provided and is greater than 0, that much
%      random noise will be added to each of the two pieces separately.
%   3. The Kabsch algorithm will be used to reconstruct the 3D object.

    % [tri, pts] = plyread('../Data/bunny/reconstruction/bun_zipper_res3.ply', 'rt');
    % scatter3(tri.vertex.x, tri.vertex.y, tri.vertex.z);
    
    % Randomly sample overlapping indices biased towards the center of the
    % matrix.
    num_points = size(Obj, 1);
    num_possible = round(num_points / 5);
    num_overlap = round(num_points / 6);
    padding = round(num_points / 2 - num_possible / 2);
    overlap = randsample(num_possible, num_overlap) + padding;
    
    % Get the two overlapping pieces.
    A_max = max(overlap) + 1;
    B_min = min(overlap) - 1;
    A = Obj([1:A_max], :);
    B = Obj([B_min:num_points], :);
    
    % Save old B before messing it up.
    orig_B = B;
    
    % Randomly translate B so that it's offset from A.
    R = getRandRotation();
    t = 2*rand(1, 3);
    B = rotate(B, R);
    B = B - (t' * ones(1, size(B, 1)))';
    
    % Get the corresponding points of A and B (the overlapping indices).
    P = A(overlap, :);
    Q = B(overlap - B_min, :);

    % Solve for the rotation matrix.
    R = kabsch(P, Q);
    % Fix B to get the restored version. Translate to origin, then rotate.
    fix_B = B - (mean(B)' * ones(1, size(B, 1)))';
    fix_B = rotate(fix_B, R);

    % Center A at origin, too.
    fix_A = A - (mean(A)' * ones(1, size(A, 1)))';

    % Display the two parts before stitching.
    subplot(2, 3, 1);
    scatter3(A(:, 1), A(:, 2), A(:, 3), 'filled');
    title('Original A');
    subplot(2, 3, 2);
    scatter3(orig_B(:, 1), orig_B(:, 2), orig_B(:, 3), 'filled');
    title('Original B');
    % Display the before messing up and after fixing.
    subplot(2, 3, 3);
    scatter3(B(:, 1), B(:, 2), B(:, 3), 'filled');
    title('Rotated B');
    subplot(2, 3, 4);
    scatter3(fix_A(:, 1), fix_A(:, 2), fix_A(:, 3), 'filled');
    title('Rectified A');
    subplot(2, 3, 5);
    scatter3(fix_B(:, 1), fix_B(:, 2), fix_B(:, 3), 'filled');
    title('Rectified B');
    subplot(2, 3, 6);
    scatter3([fix_A(:, 1)' fix_B(:, 1)']', [fix_A(:, 2)' fix_B(:, 2)']', [fix_A(:, 3)' fix_B(:, 3)']', 'filled');
    title('Stitched Object');

end

