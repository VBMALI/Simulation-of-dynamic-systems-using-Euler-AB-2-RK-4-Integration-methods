%%
% u2 is the function for input of dynamic system defined by f2.

function uOut = u2(t,~)  % function handle

uOut = 100*(sin(8*pi*t)); % equation for sinusoidal input u in terms of time t.
                          % amplitude = 100 N & frequency = 8? Hz