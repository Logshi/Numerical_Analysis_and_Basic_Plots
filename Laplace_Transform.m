syms t s
f = exp(-t) * sin(2*t);  % Define the time-domain function
F = laplace(f, t, s);  % Compute Laplace transform
disp('Laplace transform of f:');
disp(F);
