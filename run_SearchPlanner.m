%------------------------------------------------------------------------------
% Supplementary material (Matlab Code) for the paper:
%   S.Papaioannou et al, "A framework for UAV-based 3D Search Planning"
%   submited to the Journal of Intelligent & Robotic Systems (Springer)               
%------------------------------------------------------------------------------
% License
% Copyright (c) 2020, Savvas Papaioannou, KIOS CoE
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
% 
% * Redistributions of source code must retain the above copyright notice, this
%   list of conditions and the following disclaimer.
% 
% * Redistributions in binary form must reproduce the above copyright notice,
%   this list of conditions and the following disclaimer in the documentation
%   and/or other materials provided with the distribution
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
% FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
% DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
% SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
% OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
% OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%
%-------------------------------------------------------------------------------


function run_SearchPlanner

% Modify this function to include the needed supporting software
run_configure();

%% ----------------- BEGIN DEMO ------------------------------

% Generate model
model = gen_model;
Q = 0.9; % needed detection probability

% Generate environment
fig1 = figure;
[~,OBSTACLES,WAYPOINTS,specs,~,Vstop,Xstart,Xstop]=create_env(fig1,model);
model.M = specs.M;
model.WM = specs.WM;
model.NZONES = specs.NZONES;
model.NZONE = specs.NZONE;

% Create Problem
[A,B,Aeq,Beq,problem] = create_problem(model,OBSTACLES,WAYPOINTS,Vstop,Xstop,Q);

% Create Objective
Q = create_objective(model);

% Solve Problem
[Xpred,~] = solve_problem(model,problem,A,B,Aeq,Beq,Q,Xstart);

% Plot search plan
[Xout,Uout] = plotResult(model,Xpred,fig1);

% Plot Controls
TT = computeTrackTime(Xout,Vstop);
plot_x(Xout,Vstop,TT);
plot_u(Uout);

% ----------------- END DEMO ------------------------------

end







