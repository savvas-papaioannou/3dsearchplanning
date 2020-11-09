function out = I(model,var,ind)

out = [];

T = model.horizon; 
N = 1; 
M = model.M;
L = model.Nfaces;

NZONES = model.NZONES;
NZONE = model.NZONE;
WMZ = max(NZONE);

problem.T = T;
problem.N = N;
problem.M = M;
problem.L = L;
problem.x0 = [model.agent_xdim 1];
problem.u = [model.agent_udim T];
problem.udiff  = [model.agent_udim T-1];
problem.x = [model.agent_xdim T N];
problem.xdg = [model.agent_xdim T N];
problem.y_til = [T N L];
problem.hat_y_ti = [T N];
problem.y_t = [1 T]; 

% Waypoints
problem.z_ztjl = [NZONES T WMZ L];
problem.z_ztj = [NZONES T WMZ]; 
problem.zf = [NZONES];

problem.d_tijl = [T N M L];
problem.len_x0 = prod(problem.x0);
problem.len_u = prod(problem.u);
problem.len_udiff = prod(problem.udiff);
problem.len_x = prod(problem.x);
problem.len_xdg = prod(problem.xdg);
problem.len_y_til = prod(problem.y_til);
problem.len_hat_y_ti = prod(problem.hat_y_ti);
problem.len_y_t = prod(problem.y_t);
problem.len_z_ztjl = prod(problem.z_ztjl);
problem.len_z_ztj = prod(problem.z_ztj); 
problem.len_zf = prod(problem.zf); 

problem.len_d_tijl = prod(problem.d_tijl);
problem.lenX = prod(problem.x0) + ...
               prod(problem.u) + ...
               prod(problem.udiff) +  ...
               prod(problem.x) + ...
               prod(problem.xdg) + ...
               prod(problem.y_til) + ...
               prod(problem.hat_y_ti) + ...
               prod(problem.y_t) + ...
               prod(problem.z_ztjl) + ...
               prod(problem.z_ztj) + ...
               prod(problem.zf) + ...
               prod(problem.d_tijl);
            
            
            
switch var
    
    case 'problem'
        out = problem;
        
    case 'x0'
        out = 1:model.agent_xdim;
        
    case 'u'
        t = ind(1);
        d = ind(2);
        out = sub2ind(problem.u,d,t) + problem.len_x0; 
        
        
   case 'udiff'
        t = ind(1);
        d = ind(2);
        out = sub2ind(problem.u,d,t) + problem.len_x0 + problem.len_udiff;      
        
 
    case 'x'
        i = ind(1); 
        t = ind(2);
        d = ind(3);
        out = sub2ind(problem.x,d,t,i) + problem.len_x0 + problem.len_u + problem.len_udiff;
               
    case 'xdg'
        i = ind(1); 
        t = ind(2);
        d = ind(3);
        out = sub2ind(problem.xdg,d,t,i) + problem.len_x0 + problem.len_u + problem.len_x + problem.len_udiff;
            
    case 'y_til'
        t = ind(1);
        i = ind(2); 
        l = ind(3);
        out = sub2ind(problem.y_til,t,i,l)+problem.len_x0+problem.len_u+problem.len_x+problem.len_xdg + problem.len_udiff;
        
    case 'hat_y_ti'
        t = ind(1);
        i = ind(2); 
        out =  sub2ind(problem.hat_y_ti,t,i)+problem.len_x0+problem.len_u+problem.len_x+problem.len_xdg+problem.len_y_til + problem.len_udiff;
        
        
    case 'y_t'
        t = ind(1);
        out =  t+problem.len_x0+problem.len_u+problem.len_x+problem.len_xdg+problem.len_y_til+problem.len_hat_y_ti + problem.len_udiff;
        
    case 'z_ztjl'
        z = ind(1);
        t = ind(2);
        j = ind(3);
        l = ind(4);
        out = sub2ind(problem.z_ztjl,z,t,j,l) + ...
             problem.len_x0+problem.len_u+problem.len_x+problem.len_xdg+problem.len_y_til+problem.len_hat_y_ti+problem.len_y_t + problem.len_udiff;
        
    case 'z_ztj'
        z = ind(1);
        t = ind(2);
        j = ind(3);
        out = sub2ind(problem.z_ztj,z,t,j) + ...
             problem.len_x0+problem.len_u+problem.len_x+problem.len_xdg+problem.len_y_til+problem.len_hat_y_ti+problem.len_y_t+...
             problem.len_z_ztjl + problem.len_udiff;
         
    case 'zf'
        z = ind(1);
        out = z + ...
             problem.len_x0+problem.len_u+problem.len_x+problem.len_xdg+problem.len_y_til+problem.len_hat_y_ti+problem.len_y_t+...
             problem.len_z_ztjl + problem.len_z_ztj + problem.len_udiff;
         
    case 'd_tijl'
        t = ind(1);
        i = ind(2); 
        j = ind(3);
        l = ind(4);
        out = sub2ind(problem.d_tijl,t,i,j,l) + ...
              problem.len_x0+problem.len_u+problem.len_x+problem.len_xdg +problem.len_y_til+...
              problem.len_hat_y_ti+problem.len_y_t+problem.len_z_ztjl+ problem.len_z_ztj + problem.len_zf+ problem.len_udiff;
                    
end
    
end