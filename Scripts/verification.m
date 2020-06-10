%%
% Solve x' + 4*x = u with y0=2, by AB2 integration and verify solution
% with exact solution
y0 = 2;                  % Initial Condition
dt=0.05;                   % Time step
t1 = 0:dt:2;               % t goes from 0 to 2 seconds.
y1exact = y0*exp(-4*t1);     % Exact solution (in general we won't know this
s1 = {@f1,@y1,@u1,2.0}; 
[Out.t1E,Out.y1E,Out.u1E] = myAB2(s1,2.0,0.05);
plot(t1,y1exact');
hold on
[x,y] = stairs(t1,Out.y1E);
plot(x,y);
hold on
axis([0 2 0 2]);
title('Exact vs approximate solution (AB2) for system 1');
xlabel('Time');
ylabel('Output');
legend('Exact','Approximate');
hold off

