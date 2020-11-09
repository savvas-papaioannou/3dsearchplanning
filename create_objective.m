function Q = create_objective(model)

w1 = 0;
w2 = 1;
fprintf('Selecting objective...');

problem = I(model,'problem',[]);

% Problem Parameters
T = model.horizon; 
N = model.agent_particles; 

Q = sparse(problem.lenX,problem.lenX);

for i=1:N
    for t=1:T
        for d=1:model.agent_xdim/2
            xdg_ind = I(model,'xdg',[i t d]);
            Q(xdg_ind,xdg_ind) = (t/T)*w1;
        end
    end
end

for t=1:T
    for d=1:model.agent_udim
        udiff_ind = I(model,'udiff',[t d]);
        Q(udiff_ind,udiff_ind) = w2;
    end
end

fprintf('done \n');
end