%% %% MYAB2 implements Adams Bashforth-2nd order integration.
function [t,y,u] = myAB2(ss,tEnd,dt)
%% Description, Inputs & Outputs
%AB2 stands for Adams Bashforth 2nd order integration method. 
%This is an explicit integration method meaning that the equation ofx_(n+1)
% is evaluated by using older values of x such as x_n or x_(n-1).
% Also, this method is a multistep method meaning that it uses more than
% one previous values therefore they need help in getting started. 
% The start-up scheme for n-step integration evaluates the another starting
% point value at n - 1 for using in main integration equation. 
% Therefore, AB method needs another starting point value along with the 
% initial condition to compute the integration. 
% In this project, we are using AB2 integration with Euler integration 
% startup scheme. 
% That means, the another starting value will be computed through 
% Euler integration first and then it will execute AB-2 integration function.

% Outputs - 3 outputs from this function - t,y & du
% create list of the outputs, describing their data types and units
% t = a time vector of size N x 1 where N is the number of total time steps
% y = an output vector of size N x r where r is the number of outputs for
% particular system.
% u = an input vector of size N x m where m is the number of input for
% particular system.

% Functions Called - initArrays

%%
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

%% Startup scheme - Euler Integration
% Use Euler Integration for startup now to generate another starting point
for n=1     % at first time step 
    fn = fFn( x(n,:), u(n,:), t(n)); % function f evaluated at nth step
    x(n+1,:) = x(n,:) + (dt*fn) ; % standard euler integration equation
    u(n+1,:) = uFn(t(n+1)); % Input u evaluated at n+1 step
    y(n+1,:) = yFn(x(n+1,:),u(n+1,:),t(n+1)); % Output y evaluated at n+1 step
  
end    
%% Main AB2 Integration loop
% Implement AB-2 integration and keep track of the quantities that must
% be returned by the function.  
for n=2:length(t)-1  % from 2nd step onwards
    fn = fFn( x(n,:), u(n,:), t(n));  % function f evaluated at nth step
    fn1 = fFn( x(n-1,:), u(n-1,:), t(n-1)); % function f evaluated at (n-1)th step
    x(n+1,:) = x(n,:) + (dt/2)*(3*fn-fn1) ;  % standard AB2 integration equation
    u(n+1,:) = uFn(t(n+1)); % Input u evaluated at n+1 step
    y(n+1,:) = yFn(x(n+1,:),u(n+1,:),t(n+1));  % Output y evaluated at n+1 step
       
end
