% This script file is created for ENGR 240 final projec thay is simulating the
% thurst, impuls of the rokeck by the time. Also, it is calculating the velocity
% and altitude of the rokect.
% ==============================================================================
% ******************************** Waring **************************************
% This program take more then 2 minutes to perforing all the calcuation. All the
% Variable of the program has beem saved to "calcData.mat", so if you just what
% to check previoue calcuated result, please run "allDataImage" in the comand.
% ==============================================================================

clear
close all
clc
fprintf("LunckRoket\n\n")

% Initializing variabels
Cd = 0.5; % the coefficient of drag for the object
S = 4.418E-3; % The "frontal area" for the object
mTotal = 0.6; % Total mass of rokect
mProp = 0.0358; % Mass of fuel
vi = 0; % initial velocity
yi = 0; % initial altitude
a = 0; % Initial time
b = 10; % Final time
h = 0.01; % Time step

% Calculation
fprintf("Wlecome to rokect lunch simulation\n");
t = a:h:b; % Initializing time vector with time step and
fprintf("The turst and impolse calculation stated\n");
[thrust , imp]= Thrust(t, h);
fprintf("Propellent mass calculation is started\n");
mProp = fueldMass(thrust, imp, mProp, t);

% Equation of rokect velocity and altitude by the time
mRokect = mTotal - mProp; %Mass of Rokect by the time
dydt = @ (v) v;
dvdt = @ (t, y, v, i) thrust(i) / mRokect(i) - gForce(y, mRokect(i)) - ...
    Drag_Force(Cd, S, v, y);

% ODE
fprintf("The velosoty and altitued calculation is started\n");
[tNew, tLG, y, v] = ODEexpli(dvdt, dydt, t, vi, yi, h);
fprintf("The drag replect to altitued calculation is started\n");

% Drag force by yje altitude chages
drag = zeros(1, length(y));
for i = 2:length(y)
    drag(i) = Drag_Force(Cd, S, v(i), y(i));
end
vmax = max(v);
ymax = max(y);
ymin = min(y);
fprintf("test \n")
for i = 1:length(y)
    if y(i) == ymax
        tYmax = tNew(i);
    end
    if v(i) == vmax
        tVmax = tNew(i);
    end
    if v(i) == ymin
        tYground = tNew(i);
    end
    if drag(i) == 0
        tmp = i;
    end   
end
for i = tmp:length(y)
    if drag(i) > 0
        tDearth = tNew(i);
    end
end

fprintf("all the calculation is finished\n");
% Save the variables that calculated and graph the result
save('calcData');
fprintf("%s\n", allDataImage);
