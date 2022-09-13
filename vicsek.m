clear

%% Initialisation
n = 50;
V_abs = 20;
angle = rand(1)*2*pi; 

%% Domain

dt = 0.2;
domain_size = 100;
pt_cloud = rand([n 2])*domain_size;
pt_cloud(:,3) = angle*ones(n,1);

eta = 0.06;
sim_time = 200;

radius = 4;

%%
for i = dt : dt : sim_time
    for j = 1:n
        pt_cloud(j,3) = neighbour(pt_cloud(j,1:2), radius, pt_cloud) + eta * rand(1)*2*pi; 
        pt_cloud(j,1) = (pt_cloud(j,1) + V_abs*cos(pt_cloud(j,3))*dt);
        pt_cloud(j,2) = (pt_cloud(j,2) + V_abs*sin(pt_cloud(j,3))*dt);
    end

    h = figure(1);
    set(h, 'Position', [50 50 750 640], 'Color', 'white');
    
    scatter(pt_cloud(:,1),pt_cloud(:,2)); 
    xlabel(i)
    axis([-100 200 -150 200])
end