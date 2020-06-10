%%
% Here, we are writing the function of second dynamic system which is 
% linear time-variant as described in project1 description.

% Given equation of dynamic system is  m*w'' + c*w' + k(t) w = u(t)

function fOut = f2(x,u,t,~)  % function handle f2 is the function of system 2.

% Below are the given parameters of this system.
m = 1;  % value mass in kg
c = 0.5;  % vaue of damping coefficient in N-m-s
k = 30+(3*(sin(2*pi*t))); % spring stiffness as function of time in N/m

% Now, we will define the state vector.
% since this is second order system, there will be two state variables
% which are w = x1 and w' = x2.

fOut = zeros(1,2);  % define the function matrix of 1 row and 2 columns

fOut(1) = x(2);   % This will store the value of first state variable
fOut(2) = (1/m)*(u - c*x(2) - k*x(1));  % This will store the value of second state variable