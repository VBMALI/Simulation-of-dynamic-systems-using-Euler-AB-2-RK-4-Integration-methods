%% MYRK4 implements RungeKutta 4th order integration.
function [t,y,u] = myRK4(ss,tEnd,dt)
%% Description, Inputs & Outputs
% RK4 stands for Runge Kutta 4nd order integration method. 
% This is an explicit integration method meaning that the equation of  
% x_(n+1) is evaluated by using older values of x.
% This method uses 4 estimates of function and output 
% which include the intermediate estimate at n+1/2. 
% The more number of estimates results in more accuracy.

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

% Implement RK-4 integration and keep track of the quantities that must
% be returned by the function.  

%% %% Implement RK-4 integration
for n = 1:length(t)-1
    
    %funtion f evaluated at t = n
    fn = fFn( x(n,:), uFn(t(n)), t(n) );
    % intermediate output estimate at n = 1/2 using funtion f at t = n
    xnhat12 = x(n,:) + dt/2 * fn;   
    
    % function f evaluated at n = 1/2
    fnhat12 = fFn( xnhat12, uFn(t(n)+dt/2) , t(n)+dt/2 );  
    % another intermediate output estimate at n = 1/2 using funtion f 
    % at n = 1/2
    xndoublehat12 = x(n,:) + dt/2 * fnhat12;  
    
    % second evaluation of function f at n = 1/2 
    fndoublehat12 = fFn( xndoublehat12, uFn(t(n)+dt/2) , t(n)+dt/2 ); 
    % output estimate at n = 1 using second evaluation of function f at n = 1/2
    xnhat1 = x(n,:) + dt * fndoublehat12;   
    
    % function f evaluated at t = t(0) + dt
    fnhat1 = fFn(  xnhat1, uFn(t(n)+dt), t(n)+dt );
    % output estimate at n+1 
    x(n+1,:) = x(n,:) + dt/6*(fn + 2*fnhat12 + 2*fndoublehat12 + fnhat1);
    
    % input u of system at n+1 integration step
    u(n+1,:) = uFn(t(n+1));
    % output y of system at n+1 integration step
    y(n+1,:) = yFn(x(n+1,:), u(n+1,:), t(n+1));
end