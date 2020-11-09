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
