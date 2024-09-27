% Import symbolic units
units = symunit;

% Define the dimensions of the rectangular block with units in inches
b = 12 * units.in; % Width of the rectangle (e.g., 8 inches)
h = 12 * units.in; % Height of the rectangle (e.g., 16 inches)

% Define the dimensions of the circular hole with units in inches
r = 4 * units.in; % Radius of the circular hole (e.g., 2 inches)

% Convert all dimensions to meters
b_m = rewrite(b, units.m); % Convert width to meters
h_m = rewrite(h, units.m); % Convert height to meters
r_m = rewrite(r, units.m); % Convert radius to meters

% Simplify to get numerical values in meters
b_m = double(separateUnits(b_m)); % Numeric value of width in meters
h_m = double(separateUnits(h_m)); % Numeric value of height in meters
r_m = double(separateUnits(r_m)); % Numeric value of radius in meters

% Calculate the moment of inertia for the rectangular block (about its centroid)
I_rect = (1/12) * b_m * h_m^3;

% Calculate the moment of inertia for the circular hole (about its centroid)
I_circle = (1/4) * pi * r_m^4;

% Net moment of inertia (subtract the hole from the block)
I_net = I_rect - I_circle;

% Display the results
fprintf('Net moment of inertia of the block with hole: %.4e m^4\n', I_net);
