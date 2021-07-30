function [maxYTi, maxTiTi] = findMax(y, v, t, tLG, h)

derY = derivative(y, h);
maxYTi = SecantRoot(derY, t, tLG, 0.001, 1000);
maxYTi(1) = y(maxYTi(1));
derV = derivative(v, h);
tmp = SecantRoot(v, t, tLG, 0.001, 1000);
tmp(1) = tLG(1);
tmp2 = SecantRoot(derV, t, tmp, 0.001, 1000);
maxTiTi(1) = t(tmp2(1)); maxTiTi(2) = tmp2(1);
tmp2 = SecantRoot(derV, t, tmp, 0.001, 1000);
maxTiTi(3) = t(tmp2(1)); maxTiTi(3) = tmp2(1);


function [Xs, tmax, index] = SecantRoot(Fun, t, tLG, Err, imax)
%SecantRoot finds the root of Fun = 0 using the secant method.
%Input bariables:
%Fun     Name of a user-defined function that calculated Fun for a given x.
%a,b     Two points in the neigborhood of the root (on eithet side or the same
%        side of the root).
%Err     Maximum error.
%imax    Maximum numder of iterations
%Output variable:
%Xs      Solurion.

Xa = tLG(1); Xb = tLG(3);
for i = 1:imax
    fXb = Fun(Xb);
    Xi = Xb - fXb * (Xa - Xb) / (Fun(Xa) - fXb);
    if abs((Xi - Xb) / Xb) < Err
        tmax = t(i);
        Xs = i;
        index = i;
        break
    end
    Xa = Xb;
    Xb = Xi;
end

function dx = derivative(x, h)

n = length(x);
dx = zeros(1, n);
dx(1) = (-3 * x(1) + 4 * x(2) - x(3)) / h;
for i = 2:n - 1
    dx(i) = (x(i + 1) - x(i - 1)) / h; 
end
dx(n) = (x(n - 2) - 4 * x(n - 1) + 3 * x(n)) / (2 * h) ;





