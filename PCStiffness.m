%% Polycarbonate Spring Stiffness Calculation

% Import symbolic units
units = symunit;

% Define the properties of the polycarbonate spring with symbolic units
E_pc = 2200 * units.MPa;             % Tensile modulus of polycarbonate in MPa
width_pc = 12 * units.in;             % Width of polycarbonate spring in inches
height_pc = 12 * units.in;            % Height of polycarbonate spring in inches
radiusHole = 4 * units.in;
thickness_pc = 0.5 * units.in;       % Thickness of a single polycarbonate layer in inches
number_of_PC = 6;                   % Number of polycarbonate layers
L_pc = number_of_PC * thickness_pc;  % Total length of the polycarbonate spring (number_of_PC * thickness)

% Calculate the cross-sectional area of the polycarbonate spring
% Cross-sectional area for a rectangular cross-section


% Convert all polycarbonate spring properties to SI units (meters and Pascals)
E_pc_SI = rewrite(E_pc, units.Pa);          % Convert Young's modulus to Pascals (Pa)
width_pc_SI = rewrite(width_pc, units.m);   % Convert width to meters (m)
height_pc_SI = rewrite(height_pc, units.m); % Convert height to meters (m)
thickness_pc_SI = rewrite(thickness_pc, units.m); % Convert thickness to meters (m)
radiusHole_SI = rewrite(radiusHole, units.m);
L_pc_SI = rewrite(L_pc, units.m);           % Convert length to meters (m)

A_pc_SI = width_pc_SI * height_pc_SI - (pi * radiusHole_SI^2) ;

% Calculate Polycarbonate Spring Stiffness in SI units
k_pc_SI = (E_pc_SI * A_pc_SI) / L_pc_SI;    % Stiffness in N/m

% Display the calculated stiffness of the polycarbonate spring in N/m
fprintf('The calculated stiffness of the polycarbonate spring is %.2f MN/m\n', double(separateUnits(k_pc_SI))/1e6);
