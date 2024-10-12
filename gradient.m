%Gradient
syms x y z
f = x^2 + y^2 + z^2;  % Define a scalar function
grad_f = gradient(f, [x, y, z]);  % Compute the gradient
disp('Gradient of f:');
disp(grad_f);
