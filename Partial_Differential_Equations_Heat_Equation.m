m = 0;  % Symmetry parameter (0 for slab, 1 for cylindrical, 2 for spherical)
alpha = 1;  % Thermal diffusivity constant

% Define the PDE function
function [c, f, s] = heatpde(x, t, u, DuDx)
    c = 1;
    f = alpha * DuDx;
    s = 0;
end

% Initial condition function
function u0 = heatic(x)
    u0 = sin(pi * x);  % Initial temperature distribution
end

% Boundary condition function
function [pl, ql, pr, qr] = heatbc(xl, ul, xr, ur, t)
    pl = ul;   % Left boundary (Dirichlet condition)
    ql = 0;
    pr = ur;   % Right boundary (Dirichlet condition)
    qr = 0;
end

% Define spatial and temporal domains
x = linspace(0, 1, 20);
t = linspace(0, 2, 50);

% Solve the PDE
sol = pdepe(m, @heatpde, @heatic, @heatbc, x, t);

% Plot the results
figure;
surf(x, t, sol);
title('Solution to Heat Equation');
xlabel('Distance x');
ylabel('Time t');
zlabel('Temperature u');
