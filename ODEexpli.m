function [t, tLG, y, v] = ODEexpli(dvdt, dydt, t, vi, yi, h)
% Calculationg second order of ODE by using Euler's method
% Input variable:
% dvdt      Equation recived from caller function. Acceleration of the rokect
% dydt      Equation recived from caller function. Velocity of the rokect
% t         Original time vector
% vi        Initial velocity
% yi        Initial altitude
% Output variable:
% t         Recalculated time vectore reflect to the calculated velocity and
%           altitude
% y         Altitude of rokect
% v         Velocity of rokect

%initializing variables
N = length(t);
v = zeros(1, N);
y = v;
v(1) = vi;
y(1) = yi;
% Euler's mthod of ODE
for i = 1:N
    t(i + 1) = t(i) + h;
    tmpY = y(i) + dydt(v(i)) * h;
    % Case of altude is lower then zero
    if tmpY < 0
        y(i+1) = 0;
        v(i + 1) = 0;
    else
        y(i + 1) = tmpY;
        v(i + 1) = v(i) + dvdt(t(i), y(i), v(i), i) * h;
    end
end
tLG = zeros(1, 3);
for i = 1:N
    if y(i) ~= 0
        tLG(1) = t(i);
        break
    end
end
for i = 1:N
    if v(i) == 0 && t(i) > tLG(1)
        tLG(2) = t(i);
        tLG(3) = t(i - 1);
        break   
    end
end


