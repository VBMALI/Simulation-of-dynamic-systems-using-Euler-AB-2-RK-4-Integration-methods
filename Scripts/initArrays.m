function [t,x,u,y] = initArrays(ss, tEnd, dt)
% This function initializes the arrays like time vector, input vector & output vector.

% Inputs - 
% ss - ss is cell array from which we can extract either s1 or s2 or s3 
% where s1 is system 1 array, s2 & s3 for system 2 & 3 respectively.
% s1 contains function handles f1, y1 & u1 along with initial condition of system 1
% s2 contains function handles f2, y2 & u2 along with initial condition of system 2
% s3 contains function handles f3, y3 & u3 along with initial condition of system 3
% tEnd - End time of the simulaton for particular system
% dt - time step for chosen integration method

% Outputs -
% t - time vector as per tEnd and dt value
% u - input vector
% y - output vector
% x = state vector

% Below are the functions Called

[n,r,m] = calcDims(ss);         % Calculate dimensions of ss cell array

  tEndSim = ceil(tEnd/dt)*dt;   % Calculate end time of the simulation
  N = tEndSim/dt + 1;  % Calculate N which is the number of simulation time steps
  u = zeros(N,m);      % Initialize the input vector of N rows and m columns  
  y = zeros(N,r);      % Initialize the output vector of N rows and r columns
  x = zeros(N,n);      % Initialize the state vector of N rows and n columns

  t = (0:dt:tEndSim)';  % Create the time vector from 0 to simulation end time
                        % with spacing of dt which is integration step size.
end

function [n,r,m] = calcDims(ss)  % Calculate the dimension of ss cell array.

  yFn = ss{2};      % second element of cell array ss defining output function
  uFn = ss{3};      % third element of cell array ss defining input function
  x0  = ss{4};      % fourth element of cell array ss defining initial conditions

  n = length(x0);       % n is the number of initial conditions for a system under consideration.
  r = length(yFn(x0));  % r is the number of outputs for system under consideration.
  m = length(uFn( 0));  % m is the number of inputs for a system under consideration.
  
end