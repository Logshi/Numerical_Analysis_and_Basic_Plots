function x = gaussian_elimination(A, b)
    % This line defines a MATLAB function called gaussian_elimination
    % that takes two input arguments, A (a matrix of coefficients) and 
    % b (a vector of constants). The function outputs the solution vector x.
    
    n = length(b);  % Number of equations (or rows) by getting the length of the vector b.clc
    
    for i = 1:n
        % Partial pivoting
        [~, pivot] = max(abs(A(i:n, i)));  
        % This finds the row with the largest absolute value in the current column i.
        % The ~ is used to ignore the value itself, while pivot stores the index of the row with the maximum value.
        
        pivot = pivot + i - 1;  % Adjust the pivot index to the correct row in the full matrix.
        
        if pivot ~= i
            % Swap rows: Swapping the current row i with the row containing the maximum value (pivot).
            A([i pivot], :) = A([pivot i], :);  % Swap rows in matrix A.
            b([i pivot]) = b([pivot i]);        % Swap rows in vector b to keep the system consistent.
        end

        % Gaussian elimination to make all elements below the pivot equal to zero.
        for j = i+1:n
            factor = A(j, i) / A(i, i);  % Calculate the factor to zero out the current element.
            A(j, :) = A(j, :) - factor * A(i, :);  % Subtract factor * pivot row from the current row.
            b(j) = b(j) - factor * b(i);  % Update the corresponding element in the vector b.
        end
    end

    % Back substitution: Solving for x after the matrix is in upper triangular form.
    x = zeros(n, 1);  % Initialize the solution vector x.
    
    for i = n:-1:1  % Start from the last equation and work upwards.
        x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);  
        % Solve for x(i) by subtracting the known contributions from the other variables.
    end
end
