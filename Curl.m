syms x y z
F = [x*y, y*z, z*x];  % Define a vector field
curl_F = curl(F, [x, y, z]);  % Compute the curl
disp('Curl of F:');
disp(curl_F);
