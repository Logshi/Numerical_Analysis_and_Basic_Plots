function P_handle = newtons_interpolation(x, y)
    % x: vector of x-coordinates of data points
    % y: vector of corresponding y-coordinates of data points
    % P_handle: function handle for the Newton's interpolation polynomial

    n = length(x); % Get the number of data points
    
    % Initialize the divided difference table with zeros
    diffTable = zeros(n, n); 
    diffTable(:,1) = y'; % First column is simply the y-values (0-th divided differences)
    
    % Fill in the divided difference table
    for j = 2:n
        for i = 1:(n-j+1)
            % Compute divided differences using previous column values
            diffTable(i,j) = (diffTable(i+1,j-1) - diffTable(i,j-1)) / (x(i+j-1) - x(i));
        end
    end
    
    % Initialize the polynomial P as an anonymous function
    % Start with P(z) = y(1), which corresponds to f[x1]
    P = @(z) y(1);
    
    % Initialize the product term (multTerm) for Newton's polynomial
    multTerm = @(z) 1; % Start with 1 (no terms in the product yet)
    
    % Build the Newton interpolating polynomial
    for k = 2:n
        % Update multTerm to include the new factor (z - x(k-1))
        currentTerm = @(z) (z - x(k-1));
        multTerm = @(z) multTerm(z) .* currentTerm(z);
        % Update the polynomial by adding the next divided difference term
        P = @(z) P(z) + multTerm(z) * diffTable(1,k);
    end
    
    % Return the function handle for the polynomial
    P_handle = P;
end