function [lb,ub] = setBounds(model,problem,xinit)
    
u_lb = ones(1,problem.len_u) * model.u_lb;
u_ub = ones(1,problem.len_u) * model.u_ub;

udiff_lb = ones(1,problem.len_udiff) * 2 * model.u_lb;
udiff_ub = ones(1,problem.len_udiff) * 2 * model.u_ub;

th = 3;
x_lb = [model.Xlen(1) model.Ylen(1) model.Zlen(1)+th model.xv_lb model.xv_lb model.xv_lb];
X_lb = repmat(x_lb,1,model.horizon*model.agent_particles);

x_ub = [model.Xlen(2) model.Ylen(2) model.Zlen(2) model.xv_ub model.xv_ub model.xv_ub];
X_ub = repmat(x_ub,1,model.horizon*model.agent_particles);

xdg_lb = [-model.Xlen(2) -model.Ylen(2) -model.Zlen(2) model.xv_lb model.xv_lb model.xv_lb];
Xdg_lb = repmat(xdg_lb,1,(model.horizon)*model.agent_particles);

xdg_ub = [model.Xlen(2) model.Ylen(2) model.Zlen(2) model.xv_ub model.xv_ub model.xv_ub];
Xdg_ub = repmat(xdg_ub,1,(model.horizon)*model.agent_particles);

lb = [xinit' u_lb udiff_lb X_lb Xdg_lb zeros(1,length(model.agent_xdim+problem.len_u+problem.len_udiff+problem.len_x+problem.len_xdg+1:problem.lenX))]';
ub = [xinit' u_ub udiff_ub X_ub Xdg_ub ones(1,length(model.agent_xdim+problem.len_u+problem.len_udiff+problem.len_x+problem.len_xdg+1:problem.lenX))]';

end