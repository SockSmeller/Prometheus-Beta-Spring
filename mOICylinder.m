% Import symbolic units
units = symunit;

% Define the dimensions of the hollow cylinder with units in inches
D_outer = 8 * units.in; % Outer diameter of the hollow cylinder (e.g., 6 inches)
D_inner = 4.3 * units.in; % Inner diameter of the hollow cylinder (e.g., 4.1 inches)

% Convert diameters to radii
R_outer = D_outer / 2; % Outer radius of the hollow cylinder
R_inner = D_inner / 2; % Inner radius of the hollow cylinder

% Convert all dimensions to meters
R_outer_m = rewrite(R_outer, units.m); % Convert outer radius to meters
R_inner_m = rewrite(R_inner, units.m); % Convert inner radius to meters

% Simplify to get numerical values in meters
R_outer_m = double(separateUnits(R_outer_m)); % Numeric value of outer radius in meters
R_inner_m = double(separateUnits(R_inner_m)); % Numeric value of inner radius in meters

% Calculate the moment of inertia for the hollow cylinder (about its centroid)
I_hollow_cylinder = (pi / 4) * (R_outer_m^4 - R_inner_m^4); % Moment of inertia in m^4

% Display the result
fprintf('Moment of inertia of the hollow cylinder: %.4e m^4\n', I_hollow_cylinder);
