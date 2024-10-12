%Function for Engineering Calculus
function engineering_calculus()
    syms x
    
    % 1. Differentiation
    disp('--- Differentiation ---');
    f = x^3 + 2*x^2 - 5*x + 6;
    df = diff(f, x);
    disp('First derivative of f:');
    disp(df);
    
    % 2. Numerical Differentiation
    disp('--- Numerical Differentiation ---');
    x_vals = 0:0.01:10;
    y_vals = x_vals.^2 + 3*x_vals + 5;
    dy_vals = gradient(y_vals, x_vals);
    figure;
    plot(x_vals, dy_vals);
    title('Numerical Derivative');
    xlabel('x');
    ylabel('dy/dx');
    
    % 3. Integration
    disp('--- Integration ---');
    F = int(f, x);
    disp('Indefinite integral of f:');
    disp(F);
    
    % Definite integral
    F_definite = int(f, x, 0, 5);
    disp('Definite integral of f from 0 to 5:');
    disp(F_definite);
    
    % 4. Numerical Integration
    disp('--- Numerical Integration ---');
    f_numeric = @(x) x.^2 + 3*x + 5;
    result_numeric = integral(f_numeric, 0, 5);
    disp('Numerical integral from 0 to 5:');
    disp(result_numeric);
    
    % 5. ODE Solving
    disp('--- Solving ODE ---');
    odefun = @(x, y) -2*y;
    [x_vals_ode, y_vals_ode] = ode45(odefun, [0 5], 1);
    figure;
    plot(x_vals_ode, y_vals_ode);
    title('Solution of dy/dx = -2y');
    xlabel('x');
    ylabel('y');
    
    % 6. Optimization
    disp('--- Optimization ---');
    f_opt = @(x) x^2 - 4*x + 4;
    x_min = fminbnd(f_opt, -10, 10);
    disp('Minimum point of f:');
    disp(x_min);
end
