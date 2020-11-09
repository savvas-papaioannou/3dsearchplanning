function [Xpred,result] = solve_problem(model,problem,A,B,Aeq,Beq,Q,xinit)

Xpred=[];

intcon = problem.len_x0+problem.len_u+problem.len_udiff+problem.len_x+problem.len_xdg+1:problem.lenX;

[lb,ub] = setBounds(model,problem,xinit);

numberOfEqualities = size(Aeq,1);
numberOfInequalities = size(A,1);
numberOfVariables = problem.lenX;

disp('---------------------------- Solving MPC ----------------------------');
fprintf('* Problem Size: %d (=) constraints, %d (<) constraints, %d variables\n\n',...
    numberOfEqualities,numberOfInequalities,numberOfVariables);

Aeq=sparse(Aeq);
A=sparse(A);
gmodel.A = sparse([Aeq; A]);

if ~isempty(Q)
    gmodel.Q = Q;
end

gmodel.rhs = [Beq; B];
gmodel.sense = [repmat('=', numberOfEqualities,1); repmat('<', numberOfInequalities,1)]';
gmodel.vtype = [repmat('C', length(1:model.agent_xdim+problem.len_u+problem.len_udiff+problem.len_x+problem.len_xdg),1); repmat('B',length(intcon),1)]';
gmodel.lb=lb;
gmodel.ub=ub;
gmodel.modelsense = 'min';
params.outputflag = 1;

result = gurobi(gmodel, params);

if ~strcmp(result.status,'INFEASIBLE') 
    Xpred=result.x;
else
    Xpred = [];
end

end