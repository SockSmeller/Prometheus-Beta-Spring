% Import symbolic units
units = symunit;

% Define the properties of the beam with symbolic units
E = 2.5e9 * units.pa;  % Young's modulus
A =  pi / 4 *(8^2 - 4.3^2) * units.in^2;        % Cross-sectional area
I = 7.6703e-05 * units.m^4;      % Moment of inertia
l = 2.5 * units.m;         % Length
S_y = 60e6 * units.pa;      % Yield strength

% Uncomment the appropriate line for column end condition
C = 1/4;  % Fixed-free
% C = 1;     % Rounded-rounded
% C = 1.2;  % Fixed-rounded
% C = 1.2;  % Fixed-fixed

% Convert all properties to SI units (meters and Pascals)
E_SI = rewrite(E, units.Pa);     % Convert Young's modulus to Pascals (Pa)
A_SI = rewrite(A, units.m^2);    % Convert cross-sectional area to square meters (m^2)
I_SI = rewrite(I, units.m^4);    % Convert moment of inertia to m^4
l_SI = rewrite(l, units.m);      % Convert length to meters (m)
S_y_SI = rewrite(S_y, units.Pa); % Convert yield strength to Pascals (Pa)

% Extract numeric values in SI units
E_SI = double(separateUnits(E_SI));
A_SI = double(separateUnits(A_SI));
I_SI = double(separateUnits(I_SI));
l_SI = double(separateUnits(l_SI));
S_y_SI = double(separateUnits(S_y_SI));

% Calculate the radius of gyration (k)
k = sqrt(I_SI / A_SI);

% Calculate the slenderness ratio
slenderness_ratio = l_SI / k;

% Calculate the critical slenderness ratio limit for Johnson's formula
critical_slenderness_ratio = sqrt((2 * pi^2 * E_SI * C) / S_y_SI);

% Check if Johnson's formula is applicable
if slenderness_ratio <= critical_slenderness_ratio
    % Johnson's buckling formula applies
    P_critical_Johnson = A_SI * (S_y_SI - (S_y_SI * l_SI / (2 * pi * k))^2 / (C * E_SI));
    formula_used = 'Johnson''s';
else
    % Euler's buckling formula applies
    P_critical_Euler = (C * pi^2 * E_SI * I_SI) / (l_SI^2);
    P_critical_Johnson = P_critical_Euler;
    formula_used = 'Euler''s';
end

% Display the results
fprintf('Young''s Modulus (Pa): %.2e Pa\n', E_SI);
fprintf('Cross-sectional Area (m^2): %.4e m^2\n', A_SI);
fprintf('Moment of Inertia (m^4): %.4e m^4\n', I_SI);
fprintf('Length (m): %.4f m\n', l_SI);
fprintf('Yield Strength (Pa): %.2e Pa\n', S_y_SI);
fprintf('Radius of Gyration (m): %.4e m\n', k);
fprintf('Slenderness Ratio: %.4f\n', slenderness_ratio);
fprintf('Critical Slenderness Ratio: %.4f\n', critical_slenderness_ratio);
fprintf('Critical Buckling Load using %s formula: %.2f N\n', formula_used, P_critical_Johnson);
