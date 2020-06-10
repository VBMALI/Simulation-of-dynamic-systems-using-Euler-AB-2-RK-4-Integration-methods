%%
% Here, we are writing the function of third dynamic system
% non-linear as described in project1 description.

% forced van der pol oscillator

% Given equation of dynamic system is  w'' - {µ(1-w^2)*w'} + w = u(t)

function fOut = f3(x,u,~)   % f3 is the function of system 3.

% Below are the given parameters of this dynamic system.

mu = 8.53;   % value of mu in the equation which indicates the non-linearity

% Now, we will define the state vector.
% since this is second order system, there will be two state variables
% which are w = x1 and w' = x2.

fOut = zeros(1,2);  % define the function matrix of 1 row and 2 columns 
                    % because of two state variables

fOut(1) = x(2);  % This will store the value of first state variable
fOut(2) = u + mu*(1-(x(1))^2)*x(2) - x(1); % This will store the value of second state variable
