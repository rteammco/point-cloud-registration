function [ A ] = buildA( P, Q )
%buildA Builds the A matrix needed to solve the equation.

    num_points = size(P, 1);

    % First some assertions.
    assert(size(Q, 1) == num_points);
    assert(num_points >= 5);
    assert(size(P, 2) == 3 && size(Q, 2) == 3);

    % Build A.
    A = zeros(num_points*3, 15);
    for i = 1 : num_points
        x1 = P(i, 1);
        y1 = P(i, 2);
        z1 = P(i, 3);
        x2 = -Q(i, 1);
        y2 = -Q(i, 2);
        z2 = -Q(i, 3);
        x_vec = [x1 y1 z1 1 zeros(1, 8) x2*x1 x2*y1 x2*z1];
        y_vec = [zeros(1, 4) x1 y1 z1 1 zeros(1, 4) y2*x1 y2*y1 y2*z1];
        z_vec = [zeros(1, 8) x1 y1 z1 1 z2*x1 z2*y1 z2*z1];
        A(i*3-2, :) = x_vec;
        A(i*3-1, :) = y_vec;
        A(i*3-0, :) = z_vec;
    end

end

