function [D] = Drag_Force(C,S,V,x)

rawData = xlsread('Density','A2:B86');
alt = rawData(:, 1);
row = rawData(:, 2);
clear rawData
n = numel(alt);
for i = 2:n
    if x > alt(length(alt))
        cpo = 0;
        break
    elseif x < alt(i)
        a1 = row(i);
        a2 = (row(i) - row(i - 1)) / (alt(i) - alt(i - 1));
        cpo = a1 + a2 * (x - alt(i));
        break
    end
end
q = 1 / 2 .* cpo .* (V.^2);
D = q * C * S;
