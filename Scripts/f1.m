%%
% Here, we are writing the function of first dynamic system

% Given equation of dynamic system is  x' + 4*x = u

function fOut = f1(x,u,~)  % f1 is the function of system 1.

fOut = -4*x + u;   % output of this function is derivative of x 
                   %which will be used to calculate x