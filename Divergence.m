syms x y z
F = [x*y, y*z, z*x];  % Define a vector field
div_F = divergence(F, [x, y, z]);  % Compute the divergence
disp('Divergence of F:');
disp(div_F);
