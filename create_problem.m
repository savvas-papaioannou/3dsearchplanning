function [A,B,Aeq,Beq,problem] = create_problem(model,OBSTACLES,WAYPOINTS,Vstop,Xstop,Q)

fprintf('Formulating problem ... ');

problem = I(model,'problem',[]);

% Problem Parameters
T = model.horizon; 
N = model.agent_particles; 
M = model.M;
WM = model.WM;
L = model.Nfaces;
M1 = model.M1;
M2 = model.M2;
NZONES = model.NZONES;
NZONE = model.NZONE;


% -----------------------------------------  Equality Constraints ------------------------------------------------------ 
Aeq = sparse(problem.len_x+problem.len_udiff+problem.len_xdg,problem.lenX);
Beq = zeros(problem.len_x+problem.len_udiff+problem.len_xdg,1);

constraint_count = 0;


for i=1:N
    for t=1:T

       constraint_ind = constraint_count+1:constraint_count+6;
       constraint_count = max(constraint_ind);
        
       X_ind = [];
       for d = 1:model.agent_xdim
            X_ind = I(model,'x',[i t d]);
            Aeq(constraint_ind(d),X_ind) = 1;
       end

       X0_ind = I(model,'x0',[]);
       Aeq(constraint_ind,X0_ind) = -model.agentMat_A^t;

       for n=1:t
           U_ind = [];
           for d = 1:model.agent_udim
                U_ind(d) = I(model,'u',[n d]);
           end
           Aeq(constraint_ind,U_ind) = -model.agentMat_A^(t-n) * model.agentMat_B;
       end

       V = zeros(model.agent_xdim,1);
       for n=1:t
           V = V + model.agentMat_A^(t-n) * model.agentMat_GF;
       end
       Beq(constraint_ind,1) = V;
        
    end
end

eqc_count = problem.len_x;

for i=1:N
    
    for t=1:T
        
        constraint_ind = eqc_count+1:eqc_count+model.agent_xdim;
        eqc_count = constraint_ind(end);
        
        for d=1:model.agent_xdim
            xdg_ind = I(model,'xdg',[i t d]);
            x_ind = I(model,'x',[i t d]);
            Aeq(constraint_ind(d),xdg_ind) = 1;
            Aeq(constraint_ind(d),x_ind) = -1;
            Beq(constraint_ind(d),1) = -Xstop(d);
        end
    end
end

for t=1:T-1
    
    constraint_ind = eqc_count+1:eqc_count+model.agent_udim;
    eqc_count = constraint_ind(end);
    
    for d=1:model.agent_udim
        
        Udiff_ind = I(model,'udiff',[t d]);
        U_minus_ind = I(model,'u',[t d]);
        U_plus_ind = I(model,'u',[t+1 d]);  
        Aeq(constraint_ind(d),Udiff_ind) = 1;
        Aeq(constraint_ind(d),U_minus_ind) = 1;
        Aeq(constraint_ind(d),U_plus_ind) = -1;
    end  
    Beq(constraint_ind,1) = 0;
    
end

total_constratints  = problem.len_y_til + problem.len_hat_y_ti + problem.len_y_t + ...
                      problem.len_z_ztjl + problem.len_z_ztj + problem.len_zf + ...
                      problem.len_d_tijl;                           
A = sparse(total_constratints,problem.lenX);
B = zeros(total_constratints,1);
             
[a,b,~] = linear_constraints(model,Vstop,[]);
con_count = 0;

for i=1:N
    for t=1:T      
        x_ind = [];
        for d = 1:model.agent_xdim
            x_ind(d) = I(model,'x',[i t d]);
        end
        for l=1:L
            con_count = con_count +1;
            A(con_count,x_ind)=  a(l,:);
            y_til_ind = I(model,'y_til',[t i l]);
            A(con_count,y_til_ind) = M1-b(l)+5;
            B(con_count,1) =  M1;
        end
    end
end
       
for i=1:N
    for t=1:T
        con_count = con_count +1;
        for l=1:L
            y_til_ind = I(model,'y_til',[t i l]);
            A(con_count,y_til_ind) = -1;
        end
        hat_y_ti_ind =  I(model,'hat_y_ti',[t i]);
        A(con_count,hat_y_ti_ind) = model.Nfaces;
        B(con_count,1) =0; 
    end
end

for t=1:T
    con_count = con_count + 1;
    for i=1:N
        hat_y_ti_ind = I(model,'hat_y_ti',[t i]);
        A(con_count,hat_y_ti_ind) = -1;
    end
    y_t_ind = I(model,'y_t',t);
    A(con_count,y_t_ind) = N*model.Pt_goal(t);
    B(con_count,1) = 0;
end

con_count = con_count + 1;
for t=T:T
    y_t_ind = I(model,'y_t',t);
    A(con_count,y_t_ind) = -1;
end
B(con_count,1) = -1;

D = sqrt(3)*model.side/2;

for i=1:N
    for t=1:T
        x_ind = [];
        for d = 1:model.agent_xdim
            x_ind(d) = I(model,'x',[i t d]);
        end
        for j=1:M
            [aj,bj,~] = linear_constraints(model,OBSTACLES{j},[]);
            for l=1:L
                con_count = con_count +1;
                A(con_count,x_ind)= -aj(l,:);
                d_tijl_ind = I(model,'d_tijl',[t i j l]);
                A(con_count,d_tijl_ind) =  - M2;
                B(con_count,1) = -bj(l) - D - 1;
            end
        end
    end
end


for i=1:N
    for t=1:T
        for j=1:M
            con_count = con_count +1;
            for l=1:L
                d_tijl_ind = I(model,'d_tijl',[t i j l]);
                A(con_count,d_tijl_ind) =  1;
            end
            B(con_count,1) = model.Nfaces -1 ;
        end
    end
end

if WM~=0

    for Z = 1:NZONES
        WZ = WAYPOINTS{Z};
        for t=1:T
            x_ind = [];
            for d = 1:model.agent_xdim
                x_ind(d) = I(model,'x',[1 t d]);
            end
            for j=1:NZONE(Z)
                W = WZ{j,1};
                Sw = WZ{j,2};
                [aj,bj,b0] = linear_constraints(model,W,Sw);
                for l=1:L
                    con_count = con_count +1;
                    A(con_count,x_ind)= aj(l,:);
                    z_ztjl_ind = I(model,'z_ztjl',[Z t j l]);
                    A(con_count,z_ztjl_ind) =  M2-bj(l) + model.inside(l);
                    B(con_count,1) = M2;
                end
            end
        end
    end

    for Z = 1:NZONES
        for t=1:T
            for j=1:NZONE(Z)
                con_count = con_count +1;
                for l=1:L
                    z_ztjl_ind = I(model,'z_ztjl',[Z t j l]);
                    A(con_count,z_ztjl_ind) =  -1;
                end
                B(con_count,1) = 0;
                z_ztj_ind = I(model,'z_ztj',[Z t j]);
                A(con_count,z_ztj_ind) = model.Nfaces;
            end
        end
    end

    for Z = 1:NZONES
        for j=1:NZONE(Z)
            con_count = con_count +1;
            for t=1:T
               z_ztj_ind = I(model,'z_ztj',[Z t j]);
               A(con_count,z_ztj_ind) = -1;
            end
            zf_ind =  I(model,'zf',Z);
            A(con_count,zf_ind) = model.scanning_time;
            B(con_count,1) = 0;
        end
    end

    for Z = 1:NZONES
        con_count = con_count +1;
        for t=1:T
            for j=1:NZONE(Z)
                z_ztj_ind = I(model,'z_ztj',[Z t j]);
                A(con_count,z_ztj_ind) = -1;
            end
        end
        zf_ind =  I(model,'zf',Z);
        A(con_count,zf_ind) = NZONE(Z);
        B(con_count,1) = 0;
    end

    con_count = con_count +1;
    for Z = 1:NZONES
        zf_ind =  I(model,'zf',Z);
        A(con_count,zf_ind) = -model.Pd(Z);
        B(con_count,1) = -Q;
    end
    
    con_count = con_count +1;
    for Z = 1:NZONES
        zf_ind =  I(model,'zf',Z);
        A(con_count,zf_ind) = 1;
        B(con_count,1) = 1;
    end

end

fprintf('done \n');
end