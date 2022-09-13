function avg_angle = neighbour(point_id, radius, pt_cloud)

R = radius;
x0 = point_id(1);
y0 = point_id(2);
x = pt_cloud(:,1);
y = pt_cloud(:,2);

in = (x-x0).^2+(y-y0).^2<=R^2;

pt_cloud1 = pt_cloud(in,3);

avg_angle = sum(pt_cloud1)./size(pt_cloud1,1);
end

