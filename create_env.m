function [OBS,OBSTACLES,WAYPOINTS,specs,Vstart,Vstop,Xstart,Xstop] = create_env(fig,model)

[B,WB]=gen_object_and_zones(model,fig);

[Vstart,Vstop,Xstart,Xstop] = create_goal(fig);
OBS = {};
OBSTACLES = {B};
WAYPOINTS = WB;
specs.NZONES = length(WB);
specs.NZONE = zeros(1,specs.NZONES);

wm = 0;
for z=1:length(WB)
    wm = wm + size(WB{z},1);
    specs.NZONE(z) = size(WB{z},1);
end

specs.M = length(OBSTACLES);
specs.WM = wm;

end

