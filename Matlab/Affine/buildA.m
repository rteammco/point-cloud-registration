function [ A ] = buildA( P, Q )
%buildA Builds the A matrix needed to solve the equation.

    num_points = size(P, 1);

    % First some assertions.
    assert(size(Q, 1) == num_points);
    assert(num_points >= 4);
    assert(size(P, 2) == 3 && size(Q, 2) == 3);

    % Build A.
    A = zeros(num_points*3, 12);
    for i = 1 : num_points
        x = P(i, 1);
        y = P(i, 2);
        z = P(i, 3);
        x_vec = [x y z 0 0 0 0 0 0 1 0 0];
        y_vec = [0 0 0 x y z 0 0 0 0 1 0];
        z_vec = [0 0 0 0 0 0 x y z 0 0 1];
        A(i*3-2, :) = x_vec;
        A(i*3-1, :) = y_vec;
        A(i*3-0, :) = z_vec;
    end

end

