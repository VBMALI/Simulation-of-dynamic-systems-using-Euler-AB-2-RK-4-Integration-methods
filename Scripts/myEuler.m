%% MYEULER implements Euler integration.
function [t,y,u] = myEuler(ss,tEnd,dt)
%% Description, Inputs & Outputs
% This method was originally devised by Euler and 
% is therefore called, Euler’s method.
% As per this method, when we integrate over a tiny region from 
% time step = nh to (n+1)h where h is the step size then the difference 
% equation is given as x_(n+1)=x_n+hf_n

% Inputs - 3 inputs for this function - ss,tEnd & dt
% ss = This an array with four elements which are function handle f, output
% g, input u and the initial condition of the system.
% tEnd = value of time in sec for which we want to run the simulation
% dt = value of integration step size for particular system in sec

% Outputs - 3 outputs from this function - t,y & du
% create list of the outputs, describing their data types and units
% t = a time vector of size N x 1 where N is the number of total time steps
% y = an output vector of size N x r where r is the number of outputs for
% particular system.
% u = an input vector of size N x m where m is the number of input for
% particular system.

% Functions Called - initArrays

%% Input arrays, Initial condition and integration equation
% unpack the input cell array that contains function handles that define
% the dynamic system and its initial condition array.

  fFn = ss{1};  % Function handle for the dynamic system function
  yFn = ss{2};  % Function handle for the output of the system
  uFn = ss{3};  % Function handle for the input of the system
  x0  = ss{4};  % initial condition of the system

% create the time vector and acquire memory for the state, input and
% output arrays  
  [t,x,u,y] = initArrays(ss, tEnd, dt);

% Set the values of the first element, t=0, for the state, input and output
% arrays.
  x(1,:) =     x0;  % value of all state variables at time t = 0
  u(1,:) = uFn(0);  % value of all inputs at time t = 0
  y(1,:) = yFn(x0); % value of all outputs at time t = 0

%% Implement Euler integration
% keep track of the quantities that must be returned by the function.  
  for n=2:length(t)
    x(n,:) = x(n-1,:) + ...     % equation for euler integration
      dt * fFn( x(n-1,:), u(n-1,:), t(n-1) );    
    u(n,:) = uFn(t(n));   % input u of system at nth integration step
    y(n,:) = yFn(x(n,:),u(n,:),t(n));  % output y of system at nth integration step
  end

end


