%%
% u3 is the function for input of dynamic system defined by f3.

function uOut = u3(t,~)   % function handle

uOut = 1.2*(sin(0.2*pi*t));  % equation for sinusoidal input u in terms of time t
                              % amplitude = 1.2 units & frequency = 0.2? Hz