function [Vstart,Vstop,Xstart,Xstop] = create_goal(fig)

cmap = lines(5);
F = [1 2 3 4;
    5 6 7 8;
    1 2 6 5;
    2 3 7 6;
    3 4 8 7;
    1 4 8 5];

% Start
x = 130;
y = 300;
z = 20;
w = 20;
h = 20;

Vx_start = [x x+w x+w x x x+w x+w x];
Vy_start = [y y y+h y+h y y y+h y+h];
Vz_start = [0 0 0 0 z z z z];
Vstart = [Vx_start' Vy_start' Vz_start'];
Xstart = [x+w/2 y+h/2 z/2 0 0 0]'; 

x = 250;
y = 100;
w = 20;
h = 20;
z = 20;
Vx_stop = [x x+w x+w x x x+w x+w x];
Vy_stop = [y y y+h y+h y y y+h y+h];
Vz_stop = [0 0 0 0 z z z z];
Vstop = [Vx_stop' Vy_stop' Vz_stop'];
Xstop = [x+w/2 y+h/2 z/2 0 0 0];


if ~isempty(fig)
    figure(fig);
    hold on;
    patch('Faces',F,'Vertices',Vstart,'FaceColor','None','EdgeColor',cmap(5,:));
    patch('Faces',F(1,:),'Vertices',Vstart(1:4,:),'FaceColor',cmap(5,:),'FaceAlpha',0.5);
    plot3(Xstart(1),Xstart(2),Xstart(3),'*g','MarkerSize',15,'Linewidth',2);

    patch('Faces',F,'Vertices',Vstop,'FaceColor','None','EdgeColor',cmap(2,:));
    patch('Faces',F(1,:),'Vertices',Vstop(1:4,:),'FaceColor',cmap(2,:),'FaceAlpha',0.5);
    
end



end

