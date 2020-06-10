clearvars;
close all

%% Dynamic System 1: x' = -4x
ics = 2.0;  % initial condition
s1 = {@f1,@y1,@u1,ics};  % system 1
% 
dt   = 0.05;  % time step size
tEnd = 2; % simulation end time
% 
[soln1.tE,soln1.yE,soln1.uE] = myEuler(s1,tEnd,dt); % solution of system 1 with Euler
[soln1.tA,soln1.yA,soln1.uA] = myAB2(s1,tEnd,dt);   % solution of system 1 with AB2
[soln1.tR,soln1.yR,soln1.uR] = myRK4(s1,tEnd,dt);   % solution of system 1 with RK4

%% Dynamic System 2: LTV
% m*w'' + cw'+ k(t)w(t)= u(t)
ics = [0 0];  % initial condition
s2 = {@f2,@y2,@u2,ics};   % system 2
%
dt   = 0.005;   % time step size
tEnd = 10;   % simulation end time
% % % 
[soln2.tE,soln2.yE,soln2.uE] = myEuler(s2,tEnd,dt);  % solution of system 2 with Euler
[soln2.tA,soln2.yA,soln2.uA] = myAB2(s2,tEnd,dt);    % solution of system 2 with AB2
[soln2.tR,soln2.yR,soln2.uR] = myRK4(s2,tEnd,dt);     % solution of system 1 with RK4


%% Dynamic System 3: Van der Pol
% w'' - {µ(1-w^2)*w'} + w = u(t)
ics = [0 0];  % initial condition
s3 = {@f3,@y3,@u3,ics};   % system 2

dt = 0.01;  % time step size
tEnd = 50;   % time step size
% 
[soln3a.tE,soln3a.yE,soln3a.uE] = myEuler(s3,tEnd,dt);  % solution of system 3 with Euler
[soln3a.tA,soln3a.yA,soln3a.uA] = myAB2(s3,tEnd,dt);    % solution of system 3 with AB2
[soln3a.tR,soln3a.yR,soln3a.uR] = myRK4(s3,tEnd,dt);    % solution of system 3 with AB2

dt = 0.001;  % time step size
tEnd = 50;   % time step size

[soln3b.tE,soln3b.yE,soln3b.uE] = myEuler(s1,tEnd,dt);  % solution of system 3 with Euler
[soln3b.tA,soln3b.yA,soln3b.uA] = myAB2(s2,tEnd,dt);    % solution of system 3 with AB2
[soln3b.tR,soln3b.yR,soln3b.uR] = myRK4(s3,tEnd,dt);    % solution of system 3 with AB2

save solutionDataVrushaketu.mat soln1 soln2 soln3a soln3b
% 

% %% Zero Data Solution
soln1.yE = soln1.yE * 0;
soln1.uE = soln1.uE * 0;
soln1.yA = soln1.yA * 0;
soln1.uA = soln1.uA * 0;
soln1.yR = soln1.yR * 0;
soln1.uR = soln1.uR * 0;

soln2.yE = soln2.yE * 0;
soln2.uE = soln2.uE * 0;
soln2.yA = soln2.yA * 0;
soln2.uA = soln2.uA * 0;
soln2.yR = soln2.yR * 0;
soln2.uR = soln2.uR * 0;

soln3a.yE = soln3a.yE * 0;
soln3a.uE = soln3a.uE * 0;
soln3a.yA = soln3a.yA * 0;
soln3a.uA = soln3a.uA * 0;
soln3a.yR = soln3a.yR * 0;
soln3a.uR = soln3a.uR * 0;

soln3b.yE = soln3b.yE * 0;
soln3b.uE = soln3b.uE * 0;
soln3b.yA = soln3b.yA * 0;
soln3b.uA = soln3b.uA * 0;
soln3b.yR = soln3b.yR * 0;
soln3b.uR = soln3b.uR * 0;

save solutionDataZero.mat soln1 soln2 soln3a soln3b



