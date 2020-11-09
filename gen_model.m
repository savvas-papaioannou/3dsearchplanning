function m=gen_model
fprintf('Generating model ... ');


m.Xlen = [0 400];
m.Ylen = [0 400];
m.Zlen = [0 100];
m.Nfaces = 6;
m.dt = 1;
m.agent_drag_coeff = 0.2; 
m.agent_mass = 3.35; 
m.agent_vdim = 3;
m.agent_xdim = 6;
m.agent_udim = 3;
m.side = 5;
m.agentMat_A = [1 0 0 m.dt 0 0;
                0 1 0 0 m.dt 0;
                0 0 1 0 0 m.dt;
                0 0 0 1-m.agent_drag_coeff 0 0;
                0 0 0 0 1-m.agent_drag_coeff 0;
                0 0 0 0 0 1-m.agent_drag_coeff];            
m.agentMat_B = [ 0 0 0; 0 0 0; 0 0 0;
                 m.dt/m.agent_mass 0 0;
                 0 m.dt/m.agent_mass 0;
                 0 0 m.dt/m.agent_mass];
m.agentMat_GF = -[ 0 0 0 0 0 9.8]';             
             
m.agent_particles = 1;
m.horizon = 40;

m.Pt_goal = 1.0*ones(m.horizon,1);
m.Pt_obstacles = 0.0*ones(m.horizon,1);
m.Pt_waypoints = 1.0*ones(m.horizon,1);

m.n_zones = 3;
m.fov_len = [20 30 60];
m.phi = 60;

m.Pd = quantize_pd(m);

m.scanning_time = 1;

m.M1 = 10000;
m.M2 = 10000;

m.u_lb = -35;
m.u_ub = 35;

m.xv_lb = -15;
m.xv_ub = 15;


m.divider = 100000000;
m.inside = [0 0 0 0 0 0];

fprintf('done \n');

setup_optimizer();



end


function setup_optimizer

fprintf('Setting up optimizer ... ');

if ismac
    addpath('/Library/gurobi900/mac64/matlab');
    fprintf('Loading Gurobi on MacOS ... ');
elseif ispc
    addpath('C:\gurobi810\win64\matlab');
    fprintf('Loading Gurobi on Windows ... ');
else
    error('Configure Gurobi for Linux');
end

fprintf('done\n');
    
end





