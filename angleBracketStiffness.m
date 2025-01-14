%% Combined Shear and Bending Stiffness Calculation for Material AB

% Import symbolic units
units = symunit;

% Define the properties of material AB
E_AB = 200 * units.GPa;           % Young's modulus 200 - steel/ 70 - Al
G_AB = 25 * units.GPa;             % Shear modulus of material AB in MPa
width_AB = 2.5 * units.in;           % Width of the material AB cross-section in inches
height_AB = 4 * units.in;            % Height of the material AB cross-section in inches
thickness_AB = 6 * units.mm;         % Thickness of the material AB over which shear force acts in mm
length_AB = height_AB;               % Use height as length for bending calculation

% Calculate the cross-sectional area (A) for shear force (width * thickness)
A_shear_AB = width_AB * thickness_AB;    % Cross-sectional area for shear in in*mm

% Calculate the moment of inertia (I) for a rectangular cross-section
% I = (1/12) * b * h^3
I_AB = (1/12) * width_AB * thickness_AB^3; % Moment of inertia in in^4

% Convert all properties for stiffness to SI units
G_AB_SI = rewrite(G_AB, units.Pa);                 % Convert shear modulus to Pascals (Pa)
A_shear_AB_SI = rewrite(A_shear_AB, units.m^2);    % Convert cross-sectional area for shear to m^2
thickness_AB_SI = rewrite(thickness_AB, units.m);  % Convert thickness to meters (m)
E_AB_SI = rewrite(E_AB, units.Pa);                 % Convert Young's modulus to Pascals (Pa)
I_AB_SI = rewrite(I_AB, units.m^4);                % Convert moment of inertia to m^4
length_AB_SI = rewrite(length_AB, units.m);        % Convert length to meters (m)

% Calculate Shear Stiffness using the formula k_shear = (G * A) / L
k_shear_AB_SI = (G_AB_SI * A_shear_AB_SI) / thickness_AB_SI; % Shear stiffness in N/m

% Display the calculated shear stiffness of material AB in N/m
fprintf('The calculated shear stiffness of material AB is %.2f MN/m\n', double(separateUnits(k_shear_AB_SI))/1e6);

% Calculate Bending Stiffness using the formula k_bending = (E * I) / L
k_bending_AB_SI = 3 * (E_AB_SI * I_AB_SI) / length_AB_SI.^3; % Bending stiffness in N*m^2/m = N*m

% Display the calculated bending stiffness of material AB in N*m
fprintf('The calculated bending stiffness of material AB is %.2f MN*m\n', double(separateUnits(k_bending_AB_SI))/1e6);

% Calculate equivalent stiffness using seriesSpringsCalc function
k_AB = seriesSpringsCalc(double(separateUnits(k_bending_AB_SI)), double(separateUnits(k_shear_AB_SI)));

% Display the calculated equivalent stiffness of material AB in N/m
fprintf('The equivalent stiffness of material AB in series is %.2f kN/m\n', k_AB/1e3);