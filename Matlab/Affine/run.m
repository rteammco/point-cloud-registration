%%%%% TEST PROJ ON A FULL BUNNY AND ROTATE IT BACK %%%%%
subplot(2,2,1);
scatter3(Obj(:,1), Obj(:,2), Obj(:,3), 'filled');
title('Original Obj');

% Randomly deform the object. Get a rotation, then screw it up by adding
% random noise.
%   R = getRandRotation();
%   R = R + (rand(3, 3) / 2);
% Deform the object.
%   ObjR = rotate(Obj, R);
%   t = 10*rand(1, 3);
%   ObjR = ObjR - (t' * ones(1, size(ObjR, 1)))';
% Add noise to the object.
%   ObjR = ObjR + 0.001 * randn(size(ObjR));
% Plot it.
subplot(2,2,2);
scatter3(ObjR(:,1), ObjR(:,2), ObjR(:,3), 'filled');
title('Obj randomly transformed');

H = computeHomography(ObjR, Obj);
trans = affineTransform(ObjR, H);
subplot(2,2,3);
scatter3(trans(:,1), trans(:,2), trans(:,3), 'filled');
title('Obj transformed back by H');
%%%%%