function [thrust, imp] = Thrust(t, h)
% Read orifginal data of thrust ans creat linear spline interpolation with
% evenly spaced time.
% Input variable:
% t         time vector evenly spaced
% h         gap between indivisual variable
% output variable:
% thrust    new thrust vector
% imp       total impulse

Motor=xlsread('EstesE9','A2:B33');
tOriginal = Motor(:, 1); %original time
f = Motor(:, 2); %force reflect orginal time
clear Motor;
numOriginal = length(tOriginal);
numNewTime = length(t);
thrust = zeros(1, size(t, 2));
parfor i = 1:numNewTime
    for j = 2:numOriginal
        if t(i) < tOriginal(j)
            tmp = (t(i) - tOriginal(j)) / (tOriginal(j - 1) - tOriginal(j)) ...
                * f(j - 1) ;
            tmp2 = (t(i) - tOriginal(j - 1)) / (tOriginal(j) - ...
                tOriginal(j - 1))  * f(j) ;
            thrust(i) = tmp + tmp2;
            break
        end
    end
end
imp = intTrap(thrust, numNewTime, h);


function i = intTrap(vec, N, h)
% Author: Minpyo Kim
% Integrate the vector that recived by trapezoidal integration
% Input variable:
% vec       vector variable thay what to calculate
% N         number of section
% h         gap betweem variables
% Output variavle:
% i         reasult of integration

i = h / 2 * (vec(1) + vec(N)) + h * sum(vec(2:N -1));


