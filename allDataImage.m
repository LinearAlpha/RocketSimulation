function tmp = allDataImage()

close all
load calcData.mat

figure('Name', 'Thrust')
plot(t, thrust)
title("Thrust vs Time")
xlim([0 3.5])
xlabel("Time (s)"), ylabel("Thrust (N)")
grid on;

figure('Name',  'Propellant Mass Data')
plot(t, mProp);
xlim([0 3.5]), ylim([-0.001, 0.04])
title("Propellant vs Time")
xlabel("Time (s)"), ylabel("Propellant (kg)")
grid on;

figure('Name',  'velocity')
plot(tNew, v);
title("Velocity vs Time")
xlabel("Time (s)"), ylabel("velocity (m/s)")
grid on;

figure('Name',  'height')
plot(tNew, y);
title("Height vs Time")
xlabel("Time (s)"), ylabel("height (m)")
grid on;

figure('Name', 'drag force')
subplot(3, 1, 1)
plot(tNew, drag)
ylim auto
title("Drag Force vs Time")
xlabel("Time (s)"), ylabel("Force (N)")
grid on;
subplot(3, 1, 2)
plot(tNew, drag)
xlim([0 3.5]), ylim auto
title("Drag Force vs Time (t = 0 to t = 3.5)")
xlabel("Time (s)"), ylabel("Force (N)")
grid on;
subplot(3, 1, 3)
plot(tNew, drag)
xlim([12 16]), ylim auto
title("Drag Force vs Time (t = 12 to t = 16)")
xlabel("Time (s)"), ylabel("Force (N)")
grid on;

tmp = "The result of data has been graphed";
