F = 1 / (s^2 + 4);  % Define the Laplace-domain function
f = ilaplace(F, s, t);  % Compute inverse Laplace transform
disp('Inverse Laplace transform of F:');
disp(f);
