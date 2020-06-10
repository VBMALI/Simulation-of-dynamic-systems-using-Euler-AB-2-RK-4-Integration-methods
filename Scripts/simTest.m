%% Test Simulator Code
% This code runs all integration functions (Euler, AB2 & RK4)
% on all three dynamic systems and returns the plots for all three
% system outputs computed through three different integration methods.

%%
% Cleanup
clearvars; % clear the workspace
close all

%% Dynamic System 1 - Linear Time-Invariant
% Equation of the system x' = -4*x + u
% x' = f1(x,u,t) where f1 and u1(t) are MATLAB functions
% y1(x,u,t) is also a MATLAB function 

% System 1 defined by function handles f1,u1,y1 and 1 initial condition = 0
s1 = {@f1,@y1,@u1,2.0};  

%% Dynamic System 2 - Linear Time-variant
% Equation of the system is m*w'' + cw'+ k(t)w(t)= u(t)
% w'' = f2(w,w',u,t) where f2 and u2(t) are MATLAB functions
% y2(w, w') is also a MATLAB function 

% System 2 defined by function handles f2,u2,y2 and 2 initial conditions
% of value 0 each
s2 = {@f2,@y2,@u2,[0 0]};

%% Dynamic System 3 - Non linear - Forced Van der pol oscillator
% Equation of the system is w'' -  mu*(1 - w2)w'+ w = u
% w'' = f3(w, w',u,t) where f3 and u3(t) are MATLAB functions
% y3(w, w') is also a MATLAB function 

% System 3 defined by function handles f3,u3,y3 and 2 initial conditions
% of value 0 each
s3 = {@f3,@y3,@u3,[0 0]};

%% Simulation with Euler Integration
% Simulate the dynamic systems with Euler Integration 
%where the second and third arguments are the final time and time step.

% Implement myEuler on system 1 with tEnd = 2 secs and dt = 0.05 secs
% Return the arrays t1E, output of system 1 with Euler y1E and input u1E
[Out.t1,Out.y1E,Out.u1] = myEuler(s1,2.0,0.05);

% Implement myEuler on system 2 with tEnd = 10 secs and dt = 0.005 secs
% Return the arrays t2E, output of system 2 with Euler y2E and input u2E
[Out.t2,Out.y2E,Out.u2] = myEuler(s2,10.0,0.005);

% Implement myEuler on system 3 with tEnd = 50 secs and dt = 0.01 secs
% Return the arrays t3E, output of system 3 with Euler y3E and input u3E
[Out.t3,Out.y3E,Out.u3] = myEuler(s3,50.0,0.01);

%% Simulation with AB2 Integration
% Simulate the dynamic systems with AB-2 Integration 
%where the second and third arguments are the final time and time step.

% Implement myAB2 on system 1 with tEnd = 2 secs and dt = 0.05 secs
% Return the arrays t1A, output of system 1 with AB2 y1A and input u1A
[Out.t1,Out.y1A,Out.u1] = myAB2(s1,2.0,0.05);

% Implement myAB2 on system 2 with tEnd = 10 secs and dt = 0.005 secs
% Return the arrays t2A, output of system 2 with AB2 y2A and input u2A
[Out.t2,Out.y2A,Out.u2] = myAB2(s2,10.0,0.005);

% Implement myEuler on system 3 with tEnd = 50 secs and dt = 0.01 secs
% Return the arrays t3A, output of system 3 with ABA y3A and input u3A
[Out.t3,Out.y3A,Out.u3] = myAB2(s3,50.0,0.01);

%% Simulation with RK4 Integration
% Simulate the dynamic systems with RK-4 Integration 
%where the second and third arguments are the final time and time step.

% Implement myRK4 on system 1 with tEnd = 2 secs and dt = 0.05 secs
% Return the arrays t1R, output of system 1 with RK4 y1R and input u1R
[Out.t1,Out.y1R,Out.u1] = myRK4(s1,2.0,0.05);

% Implement myRK4 on system 2 with tEnd = 10 secs and dt = 0.005 secs
% Return the arrays t2R, output of system 2 with RK4 y2R and input u2R
[Out.t2,Out.y2R,Out.u2] = myRK4(s2,10.0,0.005);

% Implement myRK4 on system 3 with tEnd = 50 secs and dt = 0.001 secs
% Return the arrays t3R, output of system 3 with RK4 y23R and input u3R
[Out.t3,Out.y3R,Out.u3] = myRK4(s3,50.0,0.01);

%% 
% Plot results 
%Helper Functions
h = plotData(Out);

function h = plotData(Out)

 % Set some attributes to make the plot easier to read
  FS = 14; % font size
  LW =  2; % line width
%%
  h.fig = figure(1);  % figure window 1
  
  h.axs(1) = subplot(3,1,1);             % input axes   
  [x,y] = stairs(Out.t1,Out.y1E); % y stairs
  h.ln(1)  = line(x,y,'Color','r'); % y line
  [x,y] = stairs(Out.t1,Out.u1);  % u stairs
  h.ln(2)  = line(x,y,'Color','k'); % u line
  h.ylb(1) = ylabel('Input and Output');  % y-axis label
  h.leg(1) = legend('y=x','u');        % legend
  h.ttl   = title({      % Generate the title
                 ('$\dot{x} + 4x = u$')  %Put system equation in title
                 ('$x(0) = 2$')  % Put initial condition in title
                 ('$Solved  by  Euler Method$')  % Put method in title
                 });
  h.ttl.Interpreter = 'LaTeX';  %Interpreter of title is latex
  grid;  
  
  h.axs(2) = subplot(3,1,2);             % input axes   
  [x,y] = stairs(Out.t1,Out.y1A); % y stairs
  h.ln(1)  = line(x,y,'Color','r'); % y line
  [x,y] = stairs(Out.t1,Out.u1);  % u stairs
  h.ln(2)  = line(x,y,'Color','k'); % u line
  h.xlb(1) = xlabel('Time (seconds)');  % x-axis label
  h.ylb(1) = ylabel('Input and Output');  % y-axis label
  h.leg(1) = legend('y=x','u');        % legend
  h.ttl   = title({      % Generate the title
                 ('$\dot{x} + 4x = u$')  %Put system equation in title
                 ('$x(0) = 2$')  % Put initial condition in title
                 ('$Solved  by  AB2 Method$')  % Put method in title
                 });           
  h.ttl.Interpreter = 'LaTeX';
  grid;  
  
  h.axs(3) = subplot(3,1,3);             % input axes   
  [x,y] = stairs(Out.t1,Out.y1R); % y stairs
  h.ln(1)  = line(x,y,'Color','r'); % y line
  [x,y] = stairs(Out.t1,Out.u1);  % u stairs
  h.ln(2)  = line(x,y,'Color','k'); % u line
  h.xlb(1) = xlabel('Time (seconds)');  % x-axis label
  h.ylb(1) = ylabel('Input and Output');  % y-axis label
  h.leg(1) = legend('y=x','u');        % legend
  h.ttl   = title({      % Generate the title
                 ('$\dot{x} + 4x = u$')  %Put system equation in title
                 ('$x(0) = 2$')  % Put initial condition in title
                 ('$Solved  by  RK4 Method$')  % Put method in title
                 });
  h.ttl.Interpreter = 'LaTeX';  %Interpreter of title is latex
  grid;
 
 %% 
  h.fig = figure(2);  % figure window 2
  
  h.axs(1) = subplot(3,1,1);             % input axes   
  [x,y] = stairs(Out.t2,Out.y2E(:,1)); % y stairs
  h.ln(1)  = line(x,y,'Color','k'); % y line
  [x,y] = stairs(Out.t2,Out.y2E(:,2)); % y stairs
  h.ln(2)  = line(x,y,'Color','r'); % y line
  [x,y] = stairs(Out.t2,Out.u2); % y stairs
  h.ln(3)  = line(x,y,'Color','b'); % u line
  h.xlb(1) = xlabel('Time (seconds)');  % x-axis label
  h.xlb(1) = xlabel('Time (seconds)');  % x-axis label
  h.ylb(1) = ylabel('Input and Output');  % y-axis label
  h.leg(1) = legend('w','w-dot','u');        % legend
  % Generate the title
  % Put system equation, initial condition & method in title
  h.ttl   = title({   
                ('$m\ddot{\omega} + c{\dot\omega} + k(t)){\omega} = u(t)$')
                ('$\omega(0) = 0;{\dot\omega}(0) = 0$')
                ('$Solved  by  Euler Method$')
                 });
  h.ttl.Interpreter = 'LaTeX';  %Interpreter of title is latex
  h.leg.Interpreter = 'LaTeX';  %Interpreter of legend is latex
  grid;   
  
  h.axs(2) = subplot(3,1,2);             % input axes   
 [x,y] = stairs(Out.t2,Out.y2A(:,1)); % y stairs
  h.ln(1)  = line(x,y,'Color','k'); % y line
  [x,y] = stairs(Out.t2,Out.y2A(:,2)); % y stairs
  h.ln(2)  = line(x,y,'Color','r'); % y line
  [x,y] = stairs(Out.t2,Out.u2); % y stairs
  h.ln(3)  = line(x,y,'Color','b'); % u line
  h.xlb(1) = xlabel('Time (seconds)');  % x-axis label
  h.ylb(1) = ylabel('Input and Output');  % y-axis label
  h.leg(1) = legend('w','w-dot','u');        % legend
  % Generate the title
  % Put system equation, initial condition & method in title
  h.ttl   = title({   
                ('$m\ddot{\omega} + {\dot\omega} + k(t)){\omega} = u(t)$')
                ('${\omega}(0) = 0;{\dot\omega}(0) = 0$')
                ('$Solved  by  AB2 Method$')
                 });
  h.ttl.Interpreter = 'LaTeX';  %Interpreter of title is latex
  h.leg.Interpreter = 'LaTeX';  %Interpreter of legend is latex
  grid;  
  
  h.axs(3) = subplot(3,1,3);             % input axes   
  [x,y] = stairs(Out.t2,Out.y2R(:,1)); % y stairs
  h.ln(1)  = line(x,y,'Color','k'); % y line
  [x,y] = stairs(Out.t2,Out.y2R(:,2)); % y stairs
  h.ln(2)  = line(x,y,'Color','r'); % y line
  [x,y] = stairs(Out.t2,Out.u2); % y stairs
  h.ln(3)  = line(x,y,'Color','b'); % u line
  h.xlb(1) = xlabel('Time (seconds)');  % x-axis label
  h.ylb(1) = ylabel('Input and Output');  % y-axis label
  h.leg(1) = legend('w','w-dot','u');        % legend
  % Generate the title
  % Put system equation, initial condition & method in title
  h.ttl   = title({   
                ('$m\ddot{\omega} + c{\dot\omega} + k(t)){\omega} = u(t)$')
                ('$\omega(0) = 0;{\dot\omega}(0) = 0$')
                ('$Solved  by  RK4 Method$')
                 });
  h.ttl.Interpreter = 'LaTeX';  %Interpreter of title is latex
  h.leg.Interpreter = 'LaTeX';  %Interpreter of legend is latex
  grid;
    
 %% 
  h.fig = figure(3);  % figure window 3
  
  h.axs(1) = subplot(3,1,1);             % input axes   
  [x,y] = stairs(Out.t3,Out.y3E(:,1)); % y stairs
  h.ln(1)  = line(x,y,'Color','k'); % y line
  [x,y] = stairs(Out.t3,Out.y3E(:,2)); % y stairs
  h.ln(2)  = line(x,y,'Color','r'); % y line
  [x,y] = stairs(Out.t3,Out.u3); % y stairs
  h.ln(3)  = line(x,y,'Color','b'); % u line
  h.xlb(1) = xlabel('Time (seconds)');  % x-axis label
  h.ylb(1) = ylabel('Input and Output');  % y-axis label
  h.leg(1) = legend('w','w-dot','u');        % legend
  % Generate the title
  % Put system equation, initial condition & method in title
  h.ttl   = title({
                ('$\ddot{\omega} - \mu(1-\omega^2)\dot{\omega} + \omega = u$')
                ('$\omega(0) = 0; \dot{\omega}(0) = 0$')
                ('$Solved  by  Euler Method$')
                 });
  h.ttl.Interpreter = 'LaTeX';  %Interpreter of title is latex
  h.leg.Interpreter = 'LaTeX';  %Interpreter of legend is latex
  grid;  
  
  h.axs(2) = subplot(3,1,2);             % input axes   
  [x,y] = stairs(Out.t3,Out.y3A(:,1)); % y stairs
  h.ln(1)  = line(x,y,'Color','k'); % y line
  [x,y] = stairs(Out.t3,Out.y3A(:,2)); % y stairs
  h.ln(2)  = line(x,y,'Color','r'); % y line
  [x,y] = stairs(Out.t3,Out.u3); % y stairs
  h.ln(3)  = line(x,y,'Color','b'); % u line
  h.xlb(1) = xlabel('Time (seconds)');  % x-axis label
  h.ylb(1) = ylabel('Input and Output');  % y-axis label
  h.leg(1) = legend('w','w-dot','u');        % legend
  % Generate the title
  % Put system equation, initial condition & method in title
  h.ttl   = title({
                ('$\ddot{\omega} - \mu(1-\omega^2)\dot{\omega} + \omega = u$')
                ('$\omega(0) = 0; \dot{\omega}(0) = 0$')
                ('$Solved  by  AB2 Method$')
                 });
  h.ttl.Interpreter = 'LaTeX';    %Interpreter of title is latex
  h.leg.Interpreter = 'LaTeX';    %Interpreter of legend is latex
  grid;  
  
  h.axs(3) = subplot(3,1,3);             % input axes   
  [x,y] = stairs(Out.t3,Out.y3R(:,1)); % y stairs
  h.ln(1)  = line(x,y,'Color','k'); % y line
  [x,y] = stairs(Out.t3,Out.y3R(:,2)); % y stairs
  h.ln(2)  = line(x,y,'Color','r'); % y line
  [x,y] = stairs(Out.t3,Out.u3); % y stairs
  h.ln(3)  = line(x,y,'Color','b'); % u line
  h.xlb(1) = xlabel('Time (seconds)');  % x-axis label
  h.ylb(1) = ylabel('Input and Output');  % y-axis label
  h.leg(1) = legend('w','w-dot','u');        % legend
  % Generate the title
  % Put system equation, initial condition & method in title
  h.ttl   = title({
                ('$\ddot{\omega} - \mu(1-\omega^2)\dot{\omega} + \omega = u$')
                ('$\omega(0) = 0; \dot{\omega}(0) = 0$')
                ('$Solved  by  RK4 Method$')
                 });
  h.ttl.Interpreter = 'LaTeX';  %Interpreter of title is latex
  h.leg.Interpreter = 'LaTeX';  %Interpreter of legend is latex
  grid;
  
% Adjust its look to make it easier to read
for k = 1:length(h.axs)
    h.axs(k).FontSize = FS;       % font size
    h.axs(k).FontWeight = 'normal'; % normal font
end  % For loop end
  
for k=1:length(h.ln)            % Use FS value assigned above
      h.ln(k).LineWidth = LW;   % Use linewidth value assigned above
end % For loop end
  
end  % helper function end
  