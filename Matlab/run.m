[tri, pts] = plyread('../Data/bunny/data/bun045.ply', 'rt');
scatter3(tri.vertex.x, tri.vertex.y, tri.vertex.z);
