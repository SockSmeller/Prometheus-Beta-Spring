% Import symbolic units
units = symunit;

% Define the properties of the beam with symbolic units
P = 1900 * units.N; % Force in Newtons
l = 78 * units.mm;    % Length in inches
b = 7 * units.mm; % Thickness in inches 
h = 40 * units.mm;     % Width in inches

E = 70 * 1e9 * units.pa; % Young's modulus (200 for steel 70 for al)

% Convert all properties to SI units (meters and Pascals)
P_SI = rewrite(P, units.N);        % Convert force to Newtons
l_SI = rewrite(l, units.m);        % Convert length to meters
b_SI = rewrite(b, units.m);        % Convert width to meters
h_SI = rewrite(h, units.m);        % Convert thickness to meters
E_SI = rewrite(E, units.Pa);       % Convert Young's modulus to Pascals

% Extract numeric values in SI units
P_SI = double(separateUnits(P_SI));
l_SI = double(separateUnits(l_SI));
b_SI = double(separateUnits(b_SI));
h_SI = double(separateUnits(h_SI));
E_SI = double(separateUnits(E_SI));

% Calculate the moment of inertia I for a rectangular cross-section
I_SI = (b_SI^3 * h_SI) / 12;

% Calculate the maximum deflection using the formula
delta_max = (P_SI * l_SI^3) / (3 * E_SI * I_SI);

% Display the results
fprintf('Maximum Deflection: %.4e meters\n', delta_max);
