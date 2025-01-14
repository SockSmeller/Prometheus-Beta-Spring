% MATLAB script to calculate bending stress and compare with material strength
% using symbolic toolbox and unit conversion

% Import symbolic units
units = symunit;

% Define the properties of the beam with symbolic units
F = 1900 * units.N;              % Applied force in Newtons (N)
L = 75 * units.mm;                    % Length of the beam in inches
h = (7) * units.mm;   % Height (thickness) of the beam in inches
b = 40 * units.mm;                  % Width of the beam in inches
y = h / 2;                           % Distance from neutral axis to outermost fiber (inches)
I = (1/12) * b * h^3;                % Second moment of area in inches^4
material_strength = 40 * units.MPa; % Material strength in MPa (250 MPa)

% Convert all properties to SI units (meters and Pascals)
F_SI = rewrite(F, units.N);                     % Convert force to Newtons
L_SI = rewrite(L, units.m);                     % Convert length to meters
y_SI = rewrite(y, units.m);                     % Convert distance to meters
I_SI = rewrite(I, units.m^4);                   % Convert second moment of area to m^4
material_strength_SI = rewrite(material_strength, units.Pa); % Convert material strength to Pascals

% Calculate Bending Moment in SI units
M_SI = F_SI * L_SI; % Bending moment in Nm

% Calculate Bending Stress in SI units
bending_stress_SI = (M_SI * y_SI) / I_SI; % Bending stress in Pa

% Display the calculated bending stress in SI units
fprintf('The calculated bending stress is %.2f MPa\n', (1e-6 * double(separateUnits(bending_stress_SI))));

% Stress Comparison
if double(separateUnits(bending_stress_SI)) > double(separateUnits(material_strength_SI))
    fprintf('Warning: The bending stress exceeds the material strength! Risk of failure.\n');
else
    fprintf('The bending stress is within the safe limit of the material strength.\n');
end
