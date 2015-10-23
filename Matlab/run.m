% bunny 1
%[tri, pts] = plyread('../Data/bunny/data/bun045.ply', 'rt');
%subplot(1, 2, 1);
%scatter3(tri.vertex.x, tri.vertex.y, tri.vertex.z);

% bunny 2
%[tri, pts] = plyread('../Data/bunny/data/top2.ply', 'rt');
%subplot(1, 2, 2);
%scatter3(tri.vertex.x, tri.vertex.y, tri.vertex.z);

%%%%% TEST KABSCH ON A FULL BUNNY AND ROTATE IT BACK %%%%%
subplot(2,2,1);
scatter3(Obj(:,1), Obj(:,2), Obj(:,3))
R = getRandRotation();
det(R)
R'*R
ObjR = rotate(Obj, R);
subplot(2,2,2);
scatter3(ObjR(:,1), ObjR(:,2), Obj(:,3))

R = kabsch(Obj, ObjR);
rot = rotate(ObjR, R);
subplot(2,2,3);
scatter3(rot(:,1), rot(:,2), rot(:,3))
%%%%%