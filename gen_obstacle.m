function Vobs=gen_obstacle(model,obstacle_specs,fig)

% Obstacle Specs
x_obs = obstacle_specs.x;
y_obs = obstacle_specs.y;
h_obs = obstacle_specs.h;
w_obs = obstacle_specs.w;
z_obs = obstacle_specs.z;


zinit = 0;
% --------------------------------------- Generate Obstacle polytope ---------------------------------------------------
Xobs = [x_obs x_obs+w_obs x_obs+w_obs x_obs x_obs x_obs+w_obs x_obs+w_obs x_obs];
Yobs = [y_obs y_obs y_obs+h_obs y_obs+h_obs y_obs y_obs y_obs+h_obs y_obs+h_obs];
Zobs = [zinit zinit zinit zinit z_obs z_obs z_obs z_obs];
Vobs = [Xobs' Yobs' Zobs'];

if ~isempty(fig)
    
    figure(fig);
    
    % Plot Obstacle
    Frect = [1 2 3 4;
        5 6 7 8;
        1 2 6 5;
        2 3 7 6;
        3 4 8 7;
        1 4 8 5];
   
    v = Vobs;
    patch('Faces',Frect,'Vertices',v,'FaceVertexCData',bone(8),'FaceColor','interp','FaceAlpha',0.7);
    grid on; hold on;
    %plot3(v(:,1),v(:,2),v(:,3),'o','MarkerFaceColor','r','MarkerSize',3,'MarkerEdgeColor','r');
   
    xlabel('x');
    ylabel('y');
    zlabel('z');
    xlim(model.Xlen);
    ylim(model.Ylen);
    zlim(model.Zlen);
    set(gca,'FontSize',12,'Fontweight','b');
    
end


end
