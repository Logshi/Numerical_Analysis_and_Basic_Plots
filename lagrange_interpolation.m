%Lagrange Interpolation
function P = lagrange_interpolation(x, y)
    n = length(x);
    P = @(z) 0;
    
    for i = 1:n
        L = @(z) 1;
        for j = [1:i-1, i+1:n]
            L = @(z) L(z) .* (z - x(j)) / (x(i) - x(j));
        end
        P = @(z) P(z) + y(i) * L(z);
    end
end
