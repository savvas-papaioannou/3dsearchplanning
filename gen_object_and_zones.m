function [Vobs,Vw] = gen_object_and_zones(model,fig)

[~,V1]=gen_Z1(model,fig);
[~,V2]=gen_Z2(model,fig);
[Vobs,V3]=gen_Z3(model,fig);

Vw{1} = V1{2};
Vw{2} = V2{2};
Vw{3} = V3{2};

end

function [Vobs,Vw]=gen_Z1(model,fig)

x_obs = 225;
y_obs = 180;
h_obs = 60;
w_obs = 60;
z_obs = 60;
zinit = 0;

Xobs = [x_obs x_obs+w_obs x_obs+w_obs x_obs x_obs x_obs+w_obs x_obs+w_obs x_obs];
Yobs = [y_obs y_obs y_obs+h_obs y_obs+h_obs y_obs y_obs y_obs+h_obs y_obs+h_obs];
Zobs = [zinit zinit zinit zinit z_obs z_obs z_obs z_obs];
Vobs = [Xobs' Yobs' Zobs'];

x = 193;
y = 180;
h = 20;
w = 10;
z = 20;

Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [0 0 0 0 z z z z];
Vzone1{1,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{1,2} = [w h z];

x = 193;
y = 200;
h = 20;
w = 10;
z = 20;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [0 0 0 0 z z z z];
Vzone1{2,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{2,2} = [w h z];


x = 193;
y = 220;
h = 20;
w = 10;
z = 20;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [0 0 0 0 z z z z];
Vzone1{3,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{3,2} = [w h z];


x = 193;
y = 180;
h = 20;
w = 10;
z = 40;

Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [20 20 20 20 z z z z];
Vzone1{4,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{4,2} = [w h z];

x = 193;
y = 200;
h = 20;
w = 10;
z = 40;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [20 20 20 20 z z z z];
Vzone1{5,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{5,2} = [w h z];


x = 193;
y = 220;
h = 20;
w = 10;
z = 40;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [20 20 20 20 z z z z];
Vzone1{6,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{6,2} = [w h z];



x = 193;
y = 180;
h = 20;
w = 10;
z = 60;

Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [40 40 40 40 z z z z];
Vzone1{7,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{7,2} = [w h z];

x = 193;
y = 200;
h = 20;
w = 10;
z = 60;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [40 40 40 40 z z z z];
Vzone1{8,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{8,2} = [w h z];


x = 193;
y = 220;
h = 20;
w = 10;
z = 60;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [40 40 40 40 z z z z];
Vzone1{9,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{9,2} = [w h z];


x = 193 + 2.5;
y = 180 + 5;
h = 20/2;
w = 10/2;
z = 15;

Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [5 5 5 5 z z z z];
Vzone2{1,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{1,2} = [w h z];

x = 193 + 2.5;
y = 200 + 5;
h = 20/2;
w = 10/2;
z = 15;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [5 5 5 5 z z z z];
Vzone2{2,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{2,2} = [w h z];


x = 193 + 2.5;
y = 220 + 5;
h = 20/2;
w = 10/2;
z = 15;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [5 5 5 5 z z z z];
Vzone2{3,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{3,2} = [w h z];


x = 193 + 2.5;
y = 180 + 5;
h = 20/2;
w = 10/2;
z = 35;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [25 25 25 25 z z z z];
Vzone2{4,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{4,2} = [w h z];

x = 193 + 2.5;
y = 200 + 5;
h = 20/2;
w = 10/2;
z = 35;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [25 25 25 25 z z z z];
Vzone2{5,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{5,2} = [w h z];


x = 193  + 2.5;
y = 220 + 5;
h = 20/2;
w = 10/2;
z = 35;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [25 25 25 25 z z z z];
Vzone2{6,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{6,2} = [w h z];



x = 193 + 2.5;
y = 180 + 5;
h = 20/2;
w = 10/2;
z = 55;

Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [45 45 45 45 z z z z];
Vzone2{7,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{7,2} = [w h z];

x = 193 + 2.5;
y = 200 + 5;
h = 20/2;
w = 10/2;
z = 55;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [45 45 45 45 z z z z];
Vzone2{8,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{8,2} = [w h z];


x = 193 + 2.5;
y = 220 + 5;
h = 20/2;
w = 10/2;
z = 55;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [45 45 45 45 z z z z];
Vzone2{9,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{9,2} = [w h z];


Vw{1} = Vzone1;
Vw{2} = Vzone2;


if ~isempty(fig)
    
   
    cmap = colorcube(200);
    figure(fig);
    
    Frect = [1 2 3 4;
        5 6 7 8;
        1 2 6 5;
        2 3 7 6;
        3 4 8 7;
        1 4 8 5];
   
    v = Vobs;
    patch('Faces',Frect,'Vertices',v,'FaceVertexCData',copper(8),'FaceColor','interp');
    grid on; hold on;
    plot3(v(:,1),v(:,2),v(:,3),'o','MarkerFaceColor','r','MarkerSize',3,'MarkerEdgeColor','r');
   
    c = [42 188 129];
    
    for z = 1:length(Vw)
        V = Vw{z};
        if z==1
            for j=1:size(V,1)
                v = V{j,1};
                patch('Faces',Frect,'Vertices',v,'FaceColor','None','EdgeColor',cmap(c(z),:),'linestyle','--','linewidth',1.5);
                patch('Faces',Frect,'Vertices',v,'FaceColor',cmap(c(z),:),'FaceAlpha',0.09);
            end
        else
            for j=1:size(V,1)
                v = V{j,1};
                patch('Faces',Frect,'Vertices',v,'FaceColor','None','EdgeColor','k','linestyle','-','linewidth',2.5);
                patch('Faces',Frect,'Vertices',v,'FaceColor',cmap(c(z),:),'FaceAlpha',0.09);
            end
        end
    end
    
    xlabel('x');
    ylabel('y');
    zlabel('z');
    xlim(model.Xlen);
    ylim(model.Ylen);
    zlim(model.Zlen);
    set(gca,'FontSize',14,'Fontweight','b');
end


end

function [Vobs,Vw]=gen_Z2(model,fig)

x_obs = 225 ;
y_obs = 180;
h_obs = 60;
w_obs = 60;
z_obs = 60;


zinit = 0;

Xobs = [x_obs x_obs+w_obs x_obs+w_obs x_obs x_obs x_obs+w_obs x_obs+w_obs x_obs];
Yobs = [y_obs y_obs y_obs+h_obs y_obs+h_obs y_obs y_obs y_obs+h_obs y_obs+h_obs];
Zobs = [zinit zinit zinit zinit z_obs z_obs z_obs z_obs];
Vobs = [Xobs' Yobs' Zobs'];


x = 167;
y = 180;
h = 30;
w = 26;
z = 30;

Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [0 0 0 0 z z z z];
Vzone1{1,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{1,2} = [w h z];

x = 167;
y = 210;
h = 30;
w = 26;
z = 30;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [0 0 0 0 z z z z];
Vzone1{2,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{2,2} = [w h z];


x = 167;
y = 180;
h = 30;
w = 26;
z = 60;

Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [30 30 30 30 z z z z];
Vzone1{3,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{3,2} = [w h z];

x = 167;
y = 210;
h = 30;
w = 26;
z = 60;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [30 30 30 30 z z z z];
Vzone1{4,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{4,2} = [w h z];


x = 167 + 6.5;
y = 180 + 7.5;
h = 30/2;
w = 26/2;
z = 15+7.5;

Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [7.5 7.5 7.5 7.5 z z z z];
Vzone2{1,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{1,2} = [w h z];

x = 167 + 6.5;
y = 210+ 7.5;
h = 30/2;
w = 26/2;
z = 15+7.5;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [7.5 7.5 7.5 7.5 z z z z];
Vzone2{2,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{2,2} = [w h z];


x = 167 + 6.5;
y = 180+ 7.5;
h = 30/2;
w = 26/2;
z = 52.5;

Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [37.5000 37.5000 37.5000 37.5000 z z z z];
Vzone2{3,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{3,2} = [w h z];

x = 167 + 6.5;
y = 210+ 7.5;
h = 30/2;
w = 26/2;
z = 52.5;
Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [37.5000 37.5000 37.5000 37.5000 z z z z];
Vzone2{4,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{4,2} = [w h z];



Vw{1} = Vzone1;
Vw{2} = Vzone2;


if ~isempty(fig)
    
    
    cmap = colorcube(200);
    figure(fig);
    
  
    Frect = [1 2 3 4;
        5 6 7 8;
        1 2 6 5;
        2 3 7 6;
        3 4 8 7;
        1 4 8 5];
   
    v = Vobs;
    patch('Faces',Frect,'Vertices',v,'FaceVertexCData',copper(8),'FaceColor','interp');
    grid on; hold on;
    plot3(v(:,1),v(:,2),v(:,3),'o','MarkerFaceColor','r','MarkerSize',3,'MarkerEdgeColor','r');
   
    c = [87 188];
   
    for z = 1:length(Vw)
        V = Vw{z};
        if z==1
            for j=1:size(V,1)
                v = V{j,1};
                patch('Faces',Frect,'Vertices',v,'FaceColor','None','EdgeColor',cmap(c(z),:),'linestyle','--','linewidth',1.5);
                patch('Faces',Frect,'Vertices',v,'FaceColor',cmap(c(z),:),'FaceAlpha',0.09);
            end
        else
            for j=1:size(V,1)
                v = V{j,1};
                patch('Faces',Frect,'Vertices',v,'FaceColor','None','EdgeColor','k','linestyle','-','linewidth',2.5);
                patch('Faces',Frect,'Vertices',v,'FaceColor',cmap(c(z),:),'FaceAlpha',0.09);
            end
        end
    end
    
    xlabel('x');
    ylabel('y');
    zlabel('z');
    xlim(model.Xlen);
    ylim(model.Ylen);
    zlim(model.Zlen);
    set(gca,'FontSize',14,'Fontweight','b');
end


end

function [Vobs,Vw]=gen_Z3(model,fig)

x_obs = 225;
y_obs = 180;
h_obs = 60;
w_obs = 60;
z_obs = 60;


zinit = 0;

Xobs = [x_obs x_obs+w_obs x_obs+w_obs x_obs x_obs x_obs+w_obs x_obs+w_obs x_obs];
Yobs = [y_obs y_obs y_obs+h_obs y_obs+h_obs y_obs y_obs y_obs+h_obs y_obs+h_obs];
Zobs = [zinit zinit zinit zinit z_obs z_obs z_obs z_obs];
Vobs = [Xobs' Yobs' Zobs'];

x = 127;
y = 180;
h = 60;
w = 40;
z = 60;

Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [0 0 0 0 z z z z];
Vzone1{1,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone1{1,2} = [w h z];

x = 127 + w/2 - 10;
y = 180 + h/2 - 10;
h = 20;
w = 20;
z = 35;

Xwaypoint = [x x+w x+w x x x+w x+w x];
Ywaypoint = [y y y+h y+h y y y+h y+h];
Zwaypoint = [25 25 25 25 z z z z];
Vzone2{1,1} = [Xwaypoint' Ywaypoint' Zwaypoint'];
Vzone2{1,2} = [w h z];



Vw{1} = Vzone1;
Vw{2} = Vzone2;


if ~isempty(fig)
    
    
    cmap = colorcube(200);
    figure(fig);
    
  
    Frect = [1 2 3 4;
        5 6 7 8;
        1 2 6 5;
        2 3 7 6;
        3 4 8 7;
        1 4 8 5];
   
    v = Vobs;
    patch('Faces',Frect,'Vertices',v,'FaceVertexCData',copper(8),'FaceColor','interp');
    grid on; hold on;
    plot3(v(:,1),v(:,2),v(:,3),'o','MarkerFaceColor','r','MarkerSize',3,'MarkerEdgeColor','r');
   
    c = [129 188];
   
    for z = 1:length(Vw)
        V = Vw{z};
        if z==1
            for j=1:size(V,1)
                v = V{j,1};
                patch('Faces',Frect,'Vertices',v,'FaceColor','None','EdgeColor',cmap(c(z),:),'linestyle','--','linewidth',1.5);
                
                patch('Faces',Frect,'Vertices',v,'FaceColor',cmap(c(z),:),'FaceAlpha',0.09);
            end
        else
            for j=1:size(V,1)
                v = V{j,1};
                patch('Faces',Frect,'Vertices',v,'FaceColor','None','EdgeColor','k','linestyle','-','linewidth',2.5);
                
                patch('Faces',Frect,'Vertices',v,'FaceColor',cmap(c(z),:),'FaceAlpha',0.09);
            end
        end
    end
    
    xlabel('x');
    ylabel('y');
    zlabel('z');
    xlim(model.Xlen);
    ylim(model.Ylen);
    zlim(model.Zlen);
    set(gca,'FontSize',14,'Fontweight','b');

end


end

